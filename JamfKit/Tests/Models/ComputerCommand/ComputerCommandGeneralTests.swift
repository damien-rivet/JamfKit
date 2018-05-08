//
//  ComputerCommandGeneralTests.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

import XCTest

@testable import JamfKit

class ComputerCommandGeneralTests: XCTestCase {

    // MARK: - Constants

    let subfolder = "ComputerCommand/"
    let defaultCommand = "command"
    let defaultPasscode: UInt = 123456

    // MARK: - Tests

    func testShouldInstantiate() {
        let actualValue = ComputerCommandGeneral(command: defaultCommand, passcode: defaultPasscode)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.command, defaultCommand)
        XCTAssertEqual(actualValue?.passcode, defaultPasscode)
    }

    func testShouldNotInstantiateWithInvalidParameters() {
        let actualValue = ComputerCommandGeneral(command: "", passcode: defaultPasscode)

        XCTAssertNil(actualValue)
    }

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
        XCTAssertNotNil(encodedObject?[ComputerCommandGeneral.CodingKeys.command.rawValue])
        XCTAssertNotNil(encodedObject?[ComputerCommandGeneral.CodingKeys.passcode.rawValue])
    }

    func testShouldInitializeFromData() {
        let payload = self.payloadData(for: "computer_command_general_valid", subfolder: subfolder)!

        do {
            let actualValue = try JSONDecoder().decode(ComputerCommandGeneral.self, from: payload)

            XCTAssertNotNil(actualValue)
            XCTAssertEqual(actualValue.command, defaultCommand)
            XCTAssertEqual(actualValue.passcode, defaultPasscode)
        } catch {
            XCTFail("Failed to initialize from data")
        }
    }

    func testShouldEncodeToData() {
        let payload = self.payload(for: "computer_command_general_valid", subfolder: subfolder)!

        let actualValue = ComputerCommandGeneral(json: payload)

        do {
            let encodedObject = try JSONEncoder().encode(actualValue)

            XCTAssertNotNil(encodedObject)
        } catch {
            XCTFail("Failed to encode to data")
        }
    }
}
