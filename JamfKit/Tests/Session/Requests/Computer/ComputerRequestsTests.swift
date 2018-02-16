//
//  ComputerRequestsTests.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

import XCTest

@testable import JamfKit

class ComputerRequestsTests: XCTestCase {

    // MARK: - Constants

    let subfolder = "Computer/"
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

    func testReturnCreateRequest() {
        let payload = self.payload(for: "computer", subfolder: subfolder)!
        let element = Computer(json: payload)!

        let actualValue = element.create(with: "id")

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.url?.absoluteString, "\(defaultHost)/\(element.endpoint)/id/\(element.general.identifier)")
    }
}
