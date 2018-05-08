//
//  ComputerRemoteManagementTests.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

import XCTest

@testable import JamfKit

class ComputerRemoteManagementTests: XCTestCase {

    // MARK: - Constants

    let subfolder = "Computer/"
    let defaultManaged = true
    let defaultManagementUsername = "username"

    // MARK: - Tests

    func testShouldInitializeFromJSON() {
        let payload = self.payload(for: "computer_remote_management", subfolder: subfolder)!

        let actualValue = ComputerRemoteManagement(json: payload)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.isManaged, defaultManaged)
        XCTAssertEqual(actualValue?.managementUsername, defaultManagementUsername)
    }

    func testShouldInitializeFromEmptyJSON() {
        let actualValue = ComputerRemoteManagement(json: [String: Any]())

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.isManaged, false)
        XCTAssertEqual(actualValue?.managementUsername, "")
    }

    func testShouldEncodeToJSON() {
        let payload = self.payload(for: "computer_remote_management", subfolder: subfolder)!

        let actualValue = ComputerRemoteManagement(json: payload)
        let encodedObject = actualValue?.toJSON()

        XCTAssertNotNil(encodedObject)
        XCTAssertEqual(encodedObject?.count, 2)
        XCTAssertNotNil(encodedObject?[ComputerRemoteManagement.CodingKeys.managed.rawValue])
        XCTAssertNotNil(encodedObject?[ComputerRemoteManagement.CodingKeys.managementUsername.rawValue])
    }

    func testShouldInitializeFromData() {
        let payload = self.payloadData(for: "computer_remote_management", subfolder: subfolder)!

        do {
            let actualValue = try JSONDecoder().decode(ComputerRemoteManagement.self, from: payload)

            XCTAssertNotNil(actualValue)
            XCTAssertEqual(actualValue.isManaged, defaultManaged)
            XCTAssertEqual(actualValue.managementUsername, defaultManagementUsername)
        } catch {
            XCTFail("Failed to initialize from data")
        }
    }

    func testShouldEncodeToData() {
        let payload = self.payload(for: "computer_remote_management", subfolder: subfolder)!

        let actualValue = ComputerRemoteManagement(json: payload)

        do {
            let encodedObject = try JSONEncoder().encode(actualValue)

            XCTAssertNotNil(encodedObject)
        } catch {
            XCTFail("Failed to encode to data")
        }
    }
}
