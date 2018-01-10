//
//  ComputerCommandGeneralTests.swift
//  JamfKit
//
//  Copyright © 2018 JamfKit. All rights reserved.
//

import XCTest

@testable import JamfKit

class ComputerCommandGeneralTests: XCTestCase {

    // MARK: - Constants

    let subfolder = "ComputerCommand/"
    let defaultCommand = "command"
    let defaultPasscode: UInt = 123456

    // MARK: - Tests

    func testShouldInitializeFromJSON() {
        let payload = self.payload(for: "computer_command_general_valid", subfolder: subfolder)!

        let actualValue = ComputerCommandGeneral(json: payload)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.command, defaultCommand)
        XCTAssertEqual(actualValue?.passcode, defaultPasscode)
    }

    func testShouldNotInitializeFromInvalidJSON() {
        let payload = self.payload(for: "computer_command_general_invalid", subfolder: subfolder)!

        let actualValue = ComputerCommandGeneral(json: payload)

        XCTAssertNil(actualValue)
    }

    func testShouldEncodeToJSON() {
        let payload = self.payload(for: "computer_command_general_valid", subfolder: subfolder)!

        let actualValue = ComputerCommandGeneral(json: payload)
        let encodedObject = actualValue?.toJSON()

        XCTAssertNotNil(encodedObject)
        XCTAssertEqual(encodedObject?.count, 2)
        XCTAssertNotNil(encodedObject?[ComputerCommandGeneral.CommandKey])
        XCTAssertNotNil(encodedObject?[ComputerCommandGeneral.PasscodeKey])
    }
}
