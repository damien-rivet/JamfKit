//
//  HardwareGroupTests.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

import XCTest

@testable import JamfKit

class HardwareGroupTests: XCTestCase {

    // MARK: - Constants

    let subfolder = "HardwareGroup/"
    let defaultIdentifier: UInt = 12345
    let defaultName = "hardwares"
    let defaultIsSmart = true

    // MARK: - Tests

    func testShouldInstantiate() {
        let actualValue = HardwareGroup(identifier: defaultIdentifier, name: defaultName)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.identifier, defaultIdentifier)
        XCTAssertEqual(actualValue?.name, defaultName)
    }

    func testShouldInitializeFromJSON() {
        let payload = self.payload(for: "hardware_group_valid", subfolder: subfolder)!

        let actualValue = HardwareGroup(json: payload)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.identifier, defaultIdentifier)
        XCTAssertEqual(actualValue?.name, defaultName)
        XCTAssertEqual(actualValue?.isSmart, defaultIsSmart)
        XCTAssertNotNil(actualValue?.criteria)
        XCTAssertNotNil(actualValue?.site)
    }

    func testShouldNotInstantiateWithInvalidParameters() {
        let actualValue = HardwareGroup(identifier: defaultIdentifier, name: "")

        XCTAssertNil(actualValue)
    }

    func testShouldEncodeToJSON() {
        let payload = self.payload(for: "hardware_group_valid", subfolder: subfolder)!

        let actualValue = HardwareGroup(json: payload)
        let encodedObject = actualValue?.toJSON()

        XCTAssertNotNil(encodedObject)
        XCTAssertEqual(encodedObject?.count, 5)
        XCTAssertNotNil(encodedObject?[BaseObject.IdentifierKey])
        XCTAssertNotNil(encodedObject?[BaseObject.NameKey])
        XCTAssertNotNil(encodedObject?[HardwareGroup.IsSmartKey])
        XCTAssertNotNil(encodedObject?[HardwareGroup.CriteriaKey])
        XCTAssertNotNil(encodedObject?[HardwareGroup.SiteKey])
    }

    func testShouldInitializeFromData() {
        let payload = self.payloadData(for: "hardware_group_valid", subfolder: subfolder)!

        do {
            let actualValue = try JSONDecoder().decode(HardwareGroup.self, from: payload)

            XCTAssertNotNil(actualValue)
            XCTAssertEqual(actualValue.identifier, defaultIdentifier)
            XCTAssertEqual(actualValue.name, defaultName)
            XCTAssertEqual(actualValue.isSmart, defaultIsSmart)
            XCTAssertNotNil(actualValue.criteria)
            XCTAssertNotNil(actualValue.site)
        } catch {
            XCTFail("Failed to initialize from data")
        }
    }

    func testShouldEncodeToData() {
        let payload = self.payload(for: "hardware_group_valid", subfolder: subfolder)!

        let actualValue = HardwareGroup(json: payload)

        do {
            let encodedObject = try JSONEncoder().encode(actualValue)

            XCTAssertNotNil(encodedObject)
        } catch {
            XCTFail("Failed to encode to data")
        }
    }
}
