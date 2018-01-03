//
//  MobileDeviceTests.swift
//  JAMFKit
//
//  Copyright © 2018 JAMFKit. All rights reserved.
//

import XCTest

@testable import JAMFKit

class MobileDeviceTests: XCTestCase {

    // MARK: - Tests

    func testShouldInitializeFromJSON() {
        let payload = self.payload(for: "mobile_device")!

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
        let payload = self.payload(for: "mobile_device")!

        let actualValue = MobileDevice(json: payload)
        let encodedObject = actualValue?.toJSON()

        XCTAssertNotNil(encodedObject)
        XCTAssertEqual(encodedObject?.count, 1)
        XCTAssertNotNil(encodedObject?[MobileDevice.GeneralKey])
    }
}
