//
//  MobileDeviceConfigurationProfileTests.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

import XCTest

@testable import JamfKit

class MobileDeviceConfigurationProfileTests: XCTestCase {

    // MARK: - Constants

    let subfolder = "MobileDeviceConfigurationProfile/"
    let defaultIdentifier: UInt = 12345
    let defaultName = "Corporate Wireless"

    // MARK: - Tests

    func testShouldInstantiate() {
        let actualValue = MobileDeviceConfigurationProfile(identifier: defaultIdentifier, name: defaultName)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.general.identifier, defaultIdentifier)
        XCTAssertEqual(actualValue?.general.name, defaultName)
    }

    func testShouldNotInstantiateWithInvalidParameters() {
        let actualValue = MobileDeviceConfigurationProfile(identifier: defaultIdentifier, name: "")

        XCTAssertNil(actualValue)
    }

    func testShouldInitializeFromJSON() {
        let payload = self.payload(for: "mobile_device_configuration_profile_valid", subfolder: subfolder)!

        let actualValue = MobileDeviceConfigurationProfile(json: payload)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.description, "[MobileDeviceConfigurationProfile][\(defaultIdentifier) - \(defaultName)]")
        XCTAssertEqual(actualValue?.general.identifier, defaultIdentifier)
        XCTAssertEqual(actualValue?.general.name, defaultName)
    }

    func testShouldNotInitializeFromInvalidJSON() {
        let payload = self.payload(for: "mobile_device_configuration_profile_invalid", subfolder: subfolder)!

        let actualValue = MobileDeviceConfigurationProfile(json: payload)

        XCTAssertNil(actualValue)
    }

    func testShouldEncodeToJSON() {
        let payload = self.payload(for: "mobile_device_configuration_profile_valid", subfolder: subfolder)!

        let actualValue = MobileDeviceConfigurationProfile(json: payload)
        let encodedObject = actualValue?.toJSON()

        XCTAssertNotNil(encodedObject)
        XCTAssertEqual(encodedObject?.count, 1)
        XCTAssertNotNil(encodedObject?[MobileDeviceConfigurationProfile.CodingKeys.general.rawValue])

        let generalNode = encodedObject?[MobileDeviceConfigurationProfile.CodingKeys.general.rawValue] as! [String: Any]
        XCTAssertNotNil(generalNode[BaseObject.IdentifierKey])
        XCTAssertNotNil(generalNode[BaseObject.NameKey])
    }

    func testShouldInitializeFromData() {
        let payload = self.payloadData(for: "mobile_device_configuration_profile_valid", subfolder: subfolder)!

        do {
            let actualValue = try JSONDecoder().decode(MobileDeviceConfigurationProfile.self, from: payload)

            XCTAssertNotNil(actualValue)
            XCTAssertEqual(actualValue.description, "[MobileDeviceConfigurationProfile][\(defaultIdentifier) - \(defaultName)]")
            XCTAssertEqual(actualValue.general.identifier, defaultIdentifier)
            XCTAssertEqual(actualValue.general.name, defaultName)
        } catch {
            XCTFail("Failed to initialize from data")
        }
    }

    func testShouldEncodeToData() {
        let payload = self.payload(for: "mobile_device_configuration_profile_valid", subfolder: subfolder)!

        let actualValue = MobileDeviceConfigurationProfile(json: payload)

        do {
            let encodedObject = try JSONEncoder().encode(actualValue)

            XCTAssertNotNil(encodedObject)
        } catch {
            XCTFail("Failed to encode to data")
        }
    }
}
