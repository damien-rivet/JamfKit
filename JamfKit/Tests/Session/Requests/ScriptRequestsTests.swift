//
//  ScriptRequestsTests.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

import XCTest

@testable import JamfKit

class ScriptRequestsTests: XCTestCase {

    // MARK: - Constants

    let subfolder = "Script/"
    let defaultHost = "http://localhost"
    let defaultUsername = "username"
    let defaultPassword = "password"

    // MARK: - Lifecycle

    override func setUp() {
        try? SessionManager.instance.configure(for: defaultHost, username: defaultUsername, password: defaultPassword)
    }

    override func tearDown() {
        SessionManager.instance.clearConfiguration()
    }

    // MARK: - Tests

    func testShouldReturnCreateRequest() {
        let payload = self.payload(for: "script_valid", subfolder: subfolder)!
        let element = Script(json: payload)!

        let actualValue = element.create()

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.httpMethod, HttpMethod.post.rawValue)
        XCTAssertEqual(actualValue?.url?.absoluteString, "\(defaultHost)/\(element.endpoint)/id/\(element.identifier)")
    }
}
