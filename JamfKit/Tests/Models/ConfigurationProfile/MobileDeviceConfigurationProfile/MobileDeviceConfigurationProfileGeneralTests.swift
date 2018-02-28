//
//  MobileDeviceConfigurationProfileGeneralTests.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

import XCTest

@testable import JamfKit

class MobileDeviceConfigurationProfileGeneralTests: XCTestCase {

    // MARK: - Constants

    let subfolder = "MobileDeviceConfigurationProfile/"
    let defaultIdentifier: UInt = 12345
    let defaultName = "Computer Configuration"
    let defaultDescription = "Description"
    let defaultUuid = "55900BDC-347C-58B1-D249-F32244B11D30"
    let defaultRedeployOnUpdate = "Newly Assigned"
    let defaultPayloads = "Payloads"
    let defaultDeploymentMethod = "Install Automatically"
    let defaultRedeployDaysBeforeCertificateExpires: UInt = 0

    // MARK: - Tests

    func testShouldInstantiate() {
        let actualValue = MobileDeviceConfigurationProfileGeneral(identifier: defaultIdentifier, name: defaultName)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.identifier, defaultIdentifier)
        XCTAssertEqual(actualValue?.name, defaultName)
        XCTAssertNil(actualValue?.site)
        XCTAssertNil(actualValue?.category)
        XCTAssertEqual(actualValue?.deploymentMethod, "")
        XCTAssertEqual(actualValue?.redeployDaysBeforeCertificateExpires, 0)
        XCTAssertEqual(actualValue?.uuid, "")
        XCTAssertEqual(actualValue?.redeployOnUpdate, "")
        XCTAssertEqual(actualValue?.payloads, "")
    }

    func testShouldNotInstantiateWithInvalidParameters() {
        let actualValue = MobileDeviceConfigurationProfileGeneral(identifier: defaultIdentifier, name: "")

        XCTAssertNil(actualValue)
    }

    func testShouldInitializeFromJSON() {
        let payload = self.payload(for: "mobile_device_configuration_profile_general_valid", subfolder: subfolder)!

        let actualValue = MobileDeviceConfigurationProfileGeneral(json: payload)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.desc, defaultDescription)
        XCTAssertNotNil(actualValue?.site)
        XCTAssertNotNil(actualValue?.category)
        XCTAssertEqual(actualValue?.deploymentMethod, defaultDeploymentMethod)
        XCTAssertEqual(actualValue?.redeployDaysBeforeCertificateExpires, defaultRedeployDaysBeforeCertificateExpires)
        XCTAssertEqual(actualValue?.uuid, defaultUuid)
        XCTAssertEqual(actualValue?.redeployOnUpdate, defaultRedeployOnUpdate)
        XCTAssertEqual(actualValue?.payloads, defaultPayloads)
    }

    func testShouldNotInitializeFromInvalidJSON() {
        let payload = self.payload(for: "mobile_device_configuration_profile_general_invalid", subfolder: subfolder)!

        let actualValue = MobileDeviceConfigurationProfileGeneral(json: payload)

        XCTAssertNil(actualValue)
    }

    func testShouldNotInitializeFromEmptyJSON() {
        let actualValue = MobileDeviceConfigurationProfileGeneral(json: [String: Any]())

        XCTAssertNil(actualValue)
    }

    func testShouldEncodeToJSON() {
        let payload = self.payload(for: "mobile_device_configuration_profile_general_valid", subfolder: subfolder)!

        let actualValue = MobileDeviceConfigurationProfileGeneral(json: payload)
        let encodedObject = actualValue?.toJSON()

        XCTAssertNotNil(encodedObject)
        XCTAssertEqual(encodedObject?.count, 10)
        XCTAssertNotNil(encodedObject?[BaseObject.IdentifierKey])
        XCTAssertNotNil(encodedObject?[BaseObject.NameKey])
        XCTAssertNotNil(encodedObject?[ConfigurationProfileGeneral.DescriptionKey])
        XCTAssertNotNil(encodedObject?[ConfigurationProfileGeneral.SiteKey])
        XCTAssertNotNil(encodedObject?[ConfigurationProfileGeneral.CategoryKey])
        XCTAssertNotNil(encodedObject?[ConfigurationProfileGeneral.UuidKey])
        XCTAssertNotNil(encodedObject?[ConfigurationProfileGeneral.RedeployOnUpdateKey])
        XCTAssertNotNil(encodedObject?[ConfigurationProfileGeneral.PayloadsKey])
        XCTAssertNotNil(encodedObject?[MobileDeviceConfigurationProfileGeneral.CodingKeys.deploymentMethod.rawValue])
        XCTAssertNotNil(encodedObject?[MobileDeviceConfigurationProfileGeneral.CodingKeys.redeployDaysBeforeCertificateExpires.rawValue])
    }

    func testShouldInitializeFromData() {
        let payload = self.payloadData(for: "mobile_device_configuration_profile_general_valid", subfolder: subfolder)!

        do {
            let actualValue = try JSONDecoder().decode(MobileDeviceConfigurationProfileGeneral.self, from: payload)

            XCTAssertNotNil(actualValue)
            XCTAssertEqual(actualValue.desc, defaultDescription)
            XCTAssertNotNil(actualValue.site)
            XCTAssertNotNil(actualValue.category)
            XCTAssertEqual(actualValue.deploymentMethod, defaultDeploymentMethod)
            XCTAssertEqual(actualValue.redeployDaysBeforeCertificateExpires, defaultRedeployDaysBeforeCertificateExpires)
            XCTAssertEqual(actualValue.uuid, defaultUuid)
            XCTAssertEqual(actualValue.redeployOnUpdate, defaultRedeployOnUpdate)
            XCTAssertEqual(actualValue.payloads, defaultPayloads)
        } catch {
            XCTFail("Failed to initialize from data")
        }
    }

    func testShouldEncodeToData() {
        let payload = self.payload(for: "mobile_device_configuration_profile_general_valid", subfolder: subfolder)!

        let actualValue = MobileDeviceConfigurationProfileGeneral(json: payload)

        do {
            let encodedObject = try JSONEncoder().encode(actualValue)

            XCTAssertNotNil(encodedObject)
        } catch {
            XCTFail("Failed to encode to data")
        }
    }
}
