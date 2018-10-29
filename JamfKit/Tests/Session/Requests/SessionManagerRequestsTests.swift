//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

import XCTest

@testable import JamfKit

class SessionManagerRequestsTests: XCTestCase {

    // MARK: - Constants

    let defaultHost = "http://localhost"
    let defaultUsername = "username"
    let defaultPassword = "password"
    let defaultAuthorizationHeader = "Basic dXNlcm5hbWU6cGFzc3dvcmQ="

    // MARK: - Lifecycle

    override func setUp() {
        try? SessionManager.instance.configure(for: defaultHost, username: defaultUsername, password: defaultPassword)
    }

    override func tearDown() {
        SessionManager.instance.clearConfiguration()
    }

    // MARK: - Tests

    func testShouldComputeAuthorizationHeaderFromValidParameters() {
        let actualValue = SessionManager.computeAuthorizationHeader(from: defaultUsername, password: defaultPassword)

        XCTAssertEqual(actualValue, defaultAuthorizationHeader)
    }

    func testShouldNotComputeAuthorizationHeaderFromEmptyUsername() {
        let actualValue = SessionManager.computeAuthorizationHeader(from: "", password: defaultPassword)

        XCTAssertEqual(actualValue, "")
    }

    func testShouldNotComputeAuthorizationHeaderFromEmptyPassword() {
        let actualValue = SessionManager.computeAuthorizationHeader(from: defaultUsername, password: "")

        XCTAssertEqual(actualValue, "")
    }

    func testShouldReturnAuthentifiedURLRequest() {
        let defaultURL = URL(string: defaultHost)!
        let authorizationHeader = SessionManager.computeAuthorizationHeader(from: defaultUsername, password: defaultPassword)

        let actualValue = SessionManager.instance.authentifiedRequest(for: defaultURL, authorizationHeader: authorizationHeader, method: HttpMethod.get)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue.value(forHTTPHeaderField: HttpHeader.authorization.rawValue), defaultAuthorizationHeader)
    }
}
