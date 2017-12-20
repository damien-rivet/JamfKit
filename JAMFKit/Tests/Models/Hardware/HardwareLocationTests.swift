//
//  LocationTests.swift
//  JAMFKit
//
//  Copyright © 2017 JAMFKit. All rights reserved.
//

import XCTest

@testable import JAMFKit

class HardwareLocationTests: XCTestCase {

    // MARK: - Constants

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
        let payload = self.payload(for: "location")!

        let actualValue = HardwareLocation(json: payload)

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

    func testShouldEncodeToJSON() {
        let payload = self.payload(for: "location")!

        let actualValue = HardwareLocation(json: payload)
        let encodedObject = actualValue?.toJSON()

        XCTAssertNotNil(encodedObject)
        XCTAssertEqual(encodedObject?.count, 8)
        XCTAssertNotNil(encodedObject?[HardwareLocation.UsernameKey])
        XCTAssertNotNil(encodedObject?[HardwareLocation.RealNameKey])
        XCTAssertNotNil(encodedObject?[HardwareLocation.EmailAddressKey])
        XCTAssertNotNil(encodedObject?[HardwareLocation.PositionKey])
        XCTAssertNotNil(encodedObject?[HardwareLocation.PhoneNumberKey])
        XCTAssertNotNil(encodedObject?[HardwareLocation.DepartementKey])
        XCTAssertNotNil(encodedObject?[HardwareLocation.BuildingKey])
        XCTAssertNotNil(encodedObject?[HardwareLocation.RoomKey])
    }
}
