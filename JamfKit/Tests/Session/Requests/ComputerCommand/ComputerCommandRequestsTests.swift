//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

import XCTest

@testable import JamfKit

class ComputerCommandRequestsTests: XCTestCase {

    // MARK: - Constants

    let subfolder = "ComputerCommand/"
    let defaultHost = "http://localhost"
    var element: ComputerCommand!

    // MARK: - Lifecycle

    override func setUp() {
        try? SessionManager.instance.configure(for: defaultHost, username: "username", password: "password")

        let payload = self.payload(for: "computer_command", subfolder: subfolder)!
        element = ComputerCommand(json: payload)!
    }

    override func tearDown() {
        SessionManager.instance.clearConfiguration()
    }

    // MARK: - Tests

    func testShouldReturnReadAllRequest() {
        let actualValue = ComputerCommand.readAllRequest()

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.httpMethod, HttpMethod.get.rawValue)
        XCTAssertEqual(actualValue?.url?.absoluteString, "\(defaultHost)/\(ComputerCommand.Endpoint)")
        XCTAssertNil(actualValue?.httpBody)
    }

    func testShouldReturnCreateRequest() {
        let actualValue = element.createRequest()

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.httpMethod, HttpMethod.post.rawValue)
        XCTAssertEqual(actualValue?.url?.absoluteString, "\(defaultHost)/\(element.endpoint)/command/\(element.general.command)")
        XCTAssertNotNil(actualValue?.httpBody)
    }

    func testShouldNotReturnStaticReadRequestWithIdentifier() {
        let actualValue = ComputerCommand.readRequest(identifier: "12345")

        XCTAssertNil(actualValue)
    }

    func testShouldNotReturnReadRequestWithIdentifier() {
        let actualValue = element.readRequest()

        XCTAssertNil(actualValue)
    }
}
