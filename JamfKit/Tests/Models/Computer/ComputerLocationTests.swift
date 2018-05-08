//
//  LocationTests.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

import XCTest

@testable import JamfKit

class ComputerLocationTests: XCTestCase {

    // MARK: - Constants

    let subfolder = "Computer/"
    let defaultUsername = "JDoe"
    let defaultRealName = "John Doe"
    let defaultEmailAddress = "john.doe@doecorp.com"
    let defaultPosition = "Unknown"
    let defaultPhoneNumber = "123-456-7890"
    let defaultDepartment = "Unknown department"
    let defaultBuilding = "Unknown building"
    let defaultRoom: UInt = 1234

    // MARK: - Tests

    func testShouldInitializeFromJSON() {
        let payload = self.payload(for: "computer_location", subfolder: subfolder)!

        let actualValue = ComputerLocation(json: payload)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.username, defaultUsername)
        XCTAssertEqual(actualValue?.realName, defaultRealName)
        XCTAssertEqual(actualValue?.emailAddress, defaultEmailAddress)
        XCTAssertEqual(actualValue?.position, defaultPosition)
        XCTAssertEqual(actualValue?.phoneNumber, defaultPhoneNumber)
        XCTAssertEqual(actualValue?.department, defaultDepartment)
        XCTAssertEqual(actualValue?.building, defaultBuilding)
        XCTAssertEqual(actualValue?.room, defaultRoom)
    }

    func testShouldInitializeFromEmptyJSON() {
        let actualValue = ComputerLocation(json: [String: Any]())

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.username, "")
        XCTAssertEqual(actualValue?.realName, "")
        XCTAssertEqual(actualValue?.emailAddress, "")
        XCTAssertEqual(actualValue?.position, "")
        XCTAssertEqual(actualValue?.phoneNumber, "")
        XCTAssertEqual(actualValue?.department, "")
        XCTAssertEqual(actualValue?.building, "")
        XCTAssertEqual(actualValue?.room, 0)
    }

    func testShouldEncodeToJSON() {
        let payload = self.payload(for: "computer_location", subfolder: subfolder)!

        let actualValue = ComputerLocation(json: payload)
        let encodedObject = actualValue?.toJSON()

        XCTAssertNotNil(encodedObject)
        XCTAssertEqual(encodedObject?.count, 8)
        XCTAssertNotNil(encodedObject?[ComputerLocation.CodingKeys.username.rawValue])
        XCTAssertNotNil(encodedObject?[ComputerLocation.CodingKeys.realName.rawValue])
        XCTAssertNotNil(encodedObject?[ComputerLocation.CodingKeys.emailAddress.rawValue])
        XCTAssertNotNil(encodedObject?[ComputerLocation.CodingKeys.position.rawValue])
        XCTAssertNotNil(encodedObject?[ComputerLocation.CodingKeys.phoneNumber.rawValue])
        XCTAssertNotNil(encodedObject?[ComputerLocation.CodingKeys.department.rawValue])
        XCTAssertNotNil(encodedObject?[ComputerLocation.CodingKeys.building.rawValue])
        XCTAssertNotNil(encodedObject?[ComputerLocation.CodingKeys.room.rawValue])
    }

    func testShouldInitializeFromData() {
        let payload = self.payloadData(for: "computer_location", subfolder: subfolder)!

        do {
            let actualValue = try JSONDecoder().decode(ComputerLocation.self, from: payload)

            XCTAssertNotNil(actualValue)
            XCTAssertEqual(actualValue.username, defaultUsername)
            XCTAssertEqual(actualValue.realName, defaultRealName)
            XCTAssertEqual(actualValue.emailAddress, defaultEmailAddress)
            XCTAssertEqual(actualValue.position, defaultPosition)
            XCTAssertEqual(actualValue.phoneNumber, defaultPhoneNumber)
            XCTAssertEqual(actualValue.department, defaultDepartment)
            XCTAssertEqual(actualValue.building, defaultBuilding)
            XCTAssertEqual(actualValue.room, defaultRoom)
        } catch {
            XCTFail("Failed to initialize from data")
        }
    }

    func testShouldEncodeToData() {
        let payload = self.payload(for: "computer_location", subfolder: subfolder)!

        let actualValue = ComputerLocation(json: payload)

        do {
            let encodedObject = try JSONEncoder().encode(actualValue)

            XCTAssertNotNil(encodedObject)
        } catch {
            XCTFail("Failed to encode to data")
        }
    }
}
