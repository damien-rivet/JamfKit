//
//  SMTPServerRequestsTests.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

import XCTest

@testable import JamfKit

class SMTPServerRequestsTests: XCTestCase {

    // MARK: - Constants

    let subfolder = "SMTPServer/"
    let defaultHost = "http://localhost"
    var element: SMTPServer!

    // MARK: - Lifecycle

    override func setUp() {
        try? SessionManager.instance.configure(for: defaultHost, username: "username", password: "password")

        let payload = self.payload(for: "smtp_server", subfolder: subfolder)!
        element = SMTPServer(json: payload)!
    }

    override func tearDown() {
        SessionManager.instance.clearConfiguration()
    }

    // MARK: - Tests

    func testShouldNotReturnReadAllRequest() {
        let actualValue = SMTPServer.readAllRequest()

        XCTAssertNil(actualValue)
    }

    func testShouldNotReturnStaticReadRequestWithIdentifier() {
        let actualValue = SMTPServer.readRequest(identifier: "12345")

        XCTAssertNil(actualValue)
    }

    func testShouldReturnReadRequest() {
        let actualValue = element.readRequest()

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.httpMethod, HttpMethod.get.rawValue)
        XCTAssertEqual(actualValue?.url?.absoluteString, "\(defaultHost)/\(element.endpoint)")
        XCTAssertNil(actualValue?.httpBody)
    }

    func testShouldReturnUpdateRequestWithIdentifier() {
        let actualValue = element.updateRequest()

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.httpMethod, HttpMethod.put.rawValue)
        XCTAssertEqual(actualValue?.url?.absoluteString, "\(defaultHost)/\(element.endpoint)")
        XCTAssertNotNil(actualValue?.httpBody)
    }
}
