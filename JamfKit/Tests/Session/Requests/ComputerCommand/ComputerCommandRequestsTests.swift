//
//  ComputerCommandRequestsTests.swift
//  JamfKit
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
        let payload = self.payload(for: "computer_command", subfolder: subfolder)!
        let element = ComputerCommand(json: payload)!

        let actualValue = element.create(with: ComputerCommandGeneral.CommandKey)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.url?.absoluteString, "\(defaultHost)/\(element.endpoint)/command/\(element.general.command)")
    }
}
