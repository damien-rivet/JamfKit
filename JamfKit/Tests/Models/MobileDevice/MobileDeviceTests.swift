//
//  MobileDeviceTests.swift
//  JamfKit
//
//  Copyright © 2018 JamfKit. All rights reserved.
//

import XCTest

@testable import JamfKit

class MobileDeviceTests: XCTestCase {

    // MARK: - Constants

    let subfolder = "MobileDevice/"

    // MARK: - Tests

    func testShouldInitializeFromJSON() {
        let payload = self.payload(for: "mobile_device", subfolder: subfolder)!

        let actualValue = MobileDevice(json: payload)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.description, "[MobileDevice][12345. Mobile Device]")
        XCTAssertNotNil(actualValue?.general)
    }

    func testShouldInitializeFromEmptyJSON() {
        let actualValue = MobileDevice(json: [String: Any]())

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.description, "[MobileDevice]")
        XCTAssertNil(actualValue?.general)
    }

    func testShouldEncodeToJSON() {
        let payload = self.payload(for: "mobile_device", subfolder: subfolder)!

        let actualValue = MobileDevice(json: payload)
        let encodedObject = actualValue?.toJSON()

        XCTAssertNotNil(encodedObject)
        XCTAssertEqual(encodedObject?.count, 1)
        XCTAssertNotNil(encodedObject?[MobileDevice.GeneralKey])
    }
}
