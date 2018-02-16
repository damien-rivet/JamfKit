//
//  UserRequestsTests.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

import XCTest

@testable import JamfKit

class UserRequestsTests: XCTestCase {

    // MARK: - Constants

    let subfolder = "User/"
    let defaultHost = "http://localhost"
    var element: User!

    // MARK: - Lifecycle

    override func setUp() {
        try? SessionManager.instance.configure(for: defaultHost, username: "username", password: "password")

        let payload = self.payload(for: "user_valid", subfolder: subfolder)!
        element = User(json: payload)!
    }

    override func tearDown() {
        SessionManager.instance.clearConfiguration()
    }

    // MARK: - Tests

    func testShouldReturnCreateRequest() {
        let actualValue = element.create()

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.httpMethod, HttpMethod.post.rawValue)
        XCTAssertEqual(actualValue?.url?.absoluteString, "\(defaultHost)/\(element.endpoint)/id/\(element.identifier)")
    }
}
