//
//  LocationTests.swift
//  JAMFKit
//
//  Copyright © 2017 JAMFKit. All rights reserved.
//

import XCTest

@testable import JAMFKit

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
        XCTAssertNotNil(encodedObject?[ComputerLocation.UsernameKey])
        XCTAssertNotNil(encodedObject?[ComputerLocation.RealNameKey])
        XCTAssertNotNil(encodedObject?[ComputerLocation.EmailAddressKey])
        XCTAssertNotNil(encodedObject?[ComputerLocation.PositionKey])
        XCTAssertNotNil(encodedObject?[ComputerLocation.PhoneNumberKey])
        XCTAssertNotNil(encodedObject?[ComputerLocation.DepartementKey])
        XCTAssertNotNil(encodedObject?[ComputerLocation.BuildingKey])
        XCTAssertNotNil(encodedObject?[ComputerLocation.RoomKey])
    }
}
