//
//  MobileDeviceTests.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

import XCTest

@testable import JamfKit

class MobileDeviceTests: XCTestCase {

    // MARK: - Constants

    let subfolder = "MobileDevice/"
    let defaultIdentifier: UInt = 12345
    let defaultName = "computer"

    // MARK: - Tests

    func testShouldInstantiate() {
        let actualValue = MobileDevice(identifier: defaultIdentifier, name: defaultName)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.general.identifier, defaultIdentifier)
        XCTAssertEqual(actualValue?.general.name, defaultName)
    }

    func testShouldNotInstantiateWithInvalidParameters() {
        let actualValue = MobileDevice(identifier: defaultIdentifier, name: "")

        XCTAssertNil(actualValue)
    }

    func testShouldInitializeFromJSON() {
        let payload = self.payload(for: "mobile_device", subfolder: subfolder)!

        let actualValue = MobileDevice(json: payload)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.description, "[MobileDevice][12345 - Mobile Device]")
        XCTAssertNotNil(actualValue?.general)
    }

    func testShouldNotInitializeFromEmptyJSON() {
        let actualValue = MobileDevice(json: [String: Any]())

        XCTAssertNil(actualValue)
    }

    func testShouldEncodeToJSON() {
        let payload = self.payload(for: "mobile_device", subfolder: subfolder)!

        let actualValue = MobileDevice(json: payload)
        let encodedObject = actualValue?.toJSON()

        XCTAssertNotNil(encodedObject)
        XCTAssertEqual(encodedObject?.count, 1)
        XCTAssertNotNil(encodedObject?[MobileDevice.CodingKeys.general.rawValue])
    }

    func testShouldInitializeFromData() {
        let payload = self.payloadData(for: "mobile_device", subfolder: subfolder)!

        do {
            let actualValue = try JSONDecoder().decode(MobileDevice.self, from: payload)

            XCTAssertNotNil(actualValue)
            XCTAssertEqual(actualValue.description, "[MobileDevice][12345 - Mobile Device]")
            XCTAssertNotNil(actualValue.general)
        } catch {
            XCTFail("Failed to initialize from data")
        }
    }

    func testShouldEncodeToData() {
        let payload = self.payload(for: "mobile_device", subfolder: subfolder)!

        let actualValue = MobileDevice(json: payload)

        do {
            let encodedObject = try JSONEncoder().encode(actualValue)

            XCTAssertNotNil(encodedObject)
        } catch {
            XCTFail("Failed to encode to data")
        }
    }
}
