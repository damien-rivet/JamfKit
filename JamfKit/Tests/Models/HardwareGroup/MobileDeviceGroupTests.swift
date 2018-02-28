//
//  MobileDeviceGroup.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

import XCTest

@testable import JamfKit

class MobileDeviceGroupTests: XCTestCase {

    // MARK: - Constants

    let subfolder = "MobileDeviceGroup/"
    let defaultIdentifier: UInt = 12345
    let defaultName = "mobile_devices"
    let defaultIsSmart = true

    // MARK: - Tests

    func testShouldInstantiate() {
        let actualValue = MobileDeviceGroup(identifier: defaultIdentifier, name: defaultName)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.identifier, defaultIdentifier)
        XCTAssertEqual(actualValue?.name, defaultName)
    }

    func testShouldNotInstantiateWithInvalidParameters() {
        let actualValue = MobileDeviceGroup(identifier: defaultIdentifier, name: "")

        XCTAssertNil(actualValue)
    }

    func testShouldInitializeFromJSON() {
        let payload = self.payload(for: "mobile_device_group_valid", subfolder: subfolder)!

        let actualValue = MobileDeviceGroup(json: payload)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.description, "[MobileDeviceGroup][12345 - mobile_devices]")
        XCTAssertEqual(actualValue?.identifier, defaultIdentifier)
        XCTAssertEqual(actualValue?.name, defaultName)
        XCTAssertEqual(actualValue?.isSmart, defaultIsSmart)
        XCTAssertNotNil(actualValue?.criteria)
        XCTAssertEqual(actualValue?.criteria.count, 1)
        XCTAssertNotNil(actualValue?.site)
        XCTAssertNotNil(actualValue?.mobileDevices)
        XCTAssertEqual(actualValue?.mobileDevices.count, 1)
    }

    func testShouldNotInitializeFromInvalidJSON() {
        let payload = self.payload(for: "mobile_device_group_invalid", subfolder: subfolder)!

        let actualValue = MobileDeviceGroup(json: payload)

        XCTAssertNil(actualValue)
    }

    func testShouldInitializeFromInvalidCriterionJSON() {
        let payload = self.payload(for: "mobile_device_group_invalid_criterion", subfolder: subfolder)!

        let actualValue = MobileDeviceGroup(json: payload)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.description, "[MobileDeviceGroup][12345 - mobile_devices]")
        XCTAssertEqual(actualValue?.identifier, defaultIdentifier)
        XCTAssertEqual(actualValue?.name, defaultName)
        XCTAssertEqual(actualValue?.isSmart, defaultIsSmart)
        XCTAssertNotNil(actualValue?.criteria)
        XCTAssertEqual(actualValue?.criteria.count, 0)
        XCTAssertNotNil(actualValue?.site)
        XCTAssertNotNil(actualValue?.mobileDevices)
        XCTAssertEqual(actualValue?.mobileDevices.count, 1)
    }

    func testShouldInitializeFromInvalidMobileDeviceJSON() {
        let payload = self.payload(for: "mobile_device_group_invalid_mobile_device", subfolder: subfolder)!

        let actualValue = MobileDeviceGroup(json: payload)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.description, "[MobileDeviceGroup][12345 - mobile_devices]")
        XCTAssertEqual(actualValue?.identifier, defaultIdentifier)
        XCTAssertEqual(actualValue?.name, defaultName)
        XCTAssertEqual(actualValue?.isSmart, defaultIsSmart)
        XCTAssertNotNil(actualValue?.criteria)
        XCTAssertEqual(actualValue?.criteria.count, 1)
        XCTAssertNotNil(actualValue?.site)
        XCTAssertNotNil(actualValue?.mobileDevices)
        XCTAssertEqual(actualValue?.mobileDevices.count, 0)
    }

    func testShouldNotInitializeFromEmptyJSON() {
        let actualValue = MobileDeviceGroup(json: [String: Any]())

        XCTAssertNil(actualValue)
    }

    func testShouldEncodeToJSON() {
        let payload = self.payload(for: "mobile_device_group_valid", subfolder: subfolder)!

        let actualValue = MobileDeviceGroup(json: payload)
        let encodedObject = actualValue?.toJSON()

        XCTAssertNotNil(encodedObject)
        XCTAssertEqual(encodedObject?.count, 6)
        XCTAssertNotNil(encodedObject?[BaseObject.IdentifierKey])
        XCTAssertNotNil(encodedObject?[BaseObject.NameKey])
        XCTAssertNotNil(encodedObject?[HardwareGroup.IsSmartKey])
        XCTAssertNotNil(encodedObject?[HardwareGroup.CriteriaKey])
        XCTAssertNotNil(encodedObject?[HardwareGroup.SiteKey])
        XCTAssertNotNil(encodedObject?[MobileDeviceGroup.CodingKeys.mobileDevices.rawValue])
    }

    func testShouldInitializeFromData() {
        let payload = self.payloadData(for: "mobile_device_group_valid", subfolder: subfolder)!

        do {
            let actualValue = try JSONDecoder().decode(MobileDeviceGroup.self, from: payload)

            XCTAssertNotNil(actualValue)
            XCTAssertEqual(actualValue.description, "[MobileDeviceGroup][12345 - mobile_devices]")
            XCTAssertEqual(actualValue.identifier, defaultIdentifier)
            XCTAssertEqual(actualValue.name, defaultName)
            XCTAssertEqual(actualValue.isSmart, defaultIsSmart)
            XCTAssertNotNil(actualValue.criteria)
            XCTAssertEqual(actualValue.criteria.count, 1)
            XCTAssertNotNil(actualValue.site)
            XCTAssertNotNil(actualValue.mobileDevices)
            XCTAssertEqual(actualValue.mobileDevices.count, 1)
        } catch {
            XCTFail("Failed to initialize from data")
        }
    }

    func testShouldEncodeToData() {
        let payload = self.payload(for: "mobile_device_group_valid", subfolder: subfolder)!

        let actualValue = MobileDeviceGroup(json: payload)

        do {
            let encodedObject = try JSONEncoder().encode(actualValue)

            XCTAssertNotNil(encodedObject)
        } catch {
            XCTFail("Failed to encode to data")
        }
    }
}
