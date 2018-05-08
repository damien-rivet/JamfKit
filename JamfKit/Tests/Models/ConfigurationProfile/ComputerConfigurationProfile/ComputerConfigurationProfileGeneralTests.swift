//
//  ComputerConfigurationProfileGeneralTests.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

import XCTest

@testable import JamfKit

class ComputerConfigurationProfileGeneralTests: XCTestCase {

    // MARK: - Constants

    let subfolder = "ComputerConfigurationProfile/"
    let defaultIdentifier: UInt = 12345
    let defaultName = "Computer Configuration"
    let defaultDescription = "Description"
    let defaultUuid = "88F8C1DB-D92A-4D10-95FB-CE7EDE82B93E"
    let defaultRedeployOnUpdate = "Newly Assigned"
    let defaultPayloads = "Payloads"
    let defaultDistributionMethod = "Install Automatically"
    let defaultUserRemovable = true
    let defaultLevel = "computer"

    // MARK: - Tests

    func testShouldInstantiate() {
        let actualValue = ComputerConfigurationProfileGeneral(identifier: defaultIdentifier, name: defaultName)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.identifier, defaultIdentifier)
        XCTAssertEqual(actualValue?.name, defaultName)
        XCTAssertNil(actualValue?.site)
        XCTAssertNil(actualValue?.category)
        XCTAssertEqual(actualValue?.distributionMethod, "")
        XCTAssertEqual(actualValue?.isUserRemovable, false)
        XCTAssertEqual(actualValue?.level, "")
        XCTAssertEqual(actualValue?.uuid, "")
        XCTAssertEqual(actualValue?.redeployOnUpdate, "")
        XCTAssertEqual(actualValue?.payloads, "")
    }

    func testShouldNotInstantiateWithInvalidParameters() {
        let actualValue = ComputerConfigurationProfileGeneral(identifier: defaultIdentifier, name: "")

        XCTAssertNil(actualValue)
    }

    func testShouldInitializeFromJSON() {
        let payload = self.payload(for: "computer_configuration_profile_general_valid", subfolder: subfolder)!

        let actualValue = ComputerConfigurationProfileGeneral(json: payload)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.desc, defaultDescription)
        XCTAssertNotNil(actualValue?.site)
        XCTAssertNotNil(actualValue?.category)
        XCTAssertEqual(actualValue?.distributionMethod, defaultDistributionMethod)
        XCTAssertEqual(actualValue?.isUserRemovable, defaultUserRemovable)
        XCTAssertEqual(actualValue?.level, defaultLevel)
        XCTAssertEqual(actualValue?.uuid, defaultUuid)
        XCTAssertEqual(actualValue?.redeployOnUpdate, defaultRedeployOnUpdate)
        XCTAssertEqual(actualValue?.payloads, defaultPayloads)
    }

    func testShouldNotInitializeFromInvalidJSON() {
        let payload = self.payload(for: "computer_configuration_profile_general_invalid", subfolder: subfolder)!

        let actualValue = ComputerConfigurationProfileGeneral(json: payload)

        XCTAssertNil(actualValue)
    }

    func testShouldNotInitializeFromEmptyJSON() {
        let actualValue = ComputerConfigurationProfileGeneral(json: [String: Any]())

        XCTAssertNil(actualValue)
    }

    func testShouldEncodeToJSON() {
        let payload = self.payload(for: "computer_configuration_profile_general_valid", subfolder: subfolder)!

        let actualValue = ComputerConfigurationProfileGeneral(json: payload)
        let encodedObject = actualValue?.toJSON()

        XCTAssertNotNil(encodedObject)
        XCTAssertEqual(encodedObject?.count, 11)
        XCTAssertNotNil(encodedObject?[BaseObject.IdentifierKey])
        XCTAssertNotNil(encodedObject?[BaseObject.NameKey])
        XCTAssertNotNil(encodedObject?[ConfigurationProfileGeneral.DescriptionKey])
        XCTAssertNotNil(encodedObject?[ConfigurationProfileGeneral.SiteKey])
        XCTAssertNotNil(encodedObject?[ConfigurationProfileGeneral.CategoryKey])
        XCTAssertNotNil(encodedObject?[ConfigurationProfileGeneral.UuidKey])
        XCTAssertNotNil(encodedObject?[ConfigurationProfileGeneral.RedeployOnUpdateKey])
        XCTAssertNotNil(encodedObject?[ConfigurationProfileGeneral.PayloadsKey])
        XCTAssertNotNil(encodedObject?[ComputerConfigurationProfileGeneral.CodingKeys.distributionMethod.rawValue])
        XCTAssertNotNil(encodedObject?[ComputerConfigurationProfileGeneral.CodingKeys.userRemovable.rawValue])
        XCTAssertNotNil(encodedObject?[ComputerConfigurationProfileGeneral.CodingKeys.level.rawValue])
    }

    func testShouldInitializeFromData() {
        let payload = self.payloadData(for: "computer_configuration_profile_general_valid", subfolder: subfolder)!

        do {
            let actualValue = try JSONDecoder().decode(ComputerConfigurationProfileGeneral.self, from: payload)

            XCTAssertNotNil(actualValue)
            XCTAssertEqual(actualValue.desc, defaultDescription)
            XCTAssertNotNil(actualValue.site)
            XCTAssertNotNil(actualValue.category)
            XCTAssertEqual(actualValue.distributionMethod, defaultDistributionMethod)
            XCTAssertEqual(actualValue.isUserRemovable, defaultUserRemovable)
            XCTAssertEqual(actualValue.level, defaultLevel)
            XCTAssertEqual(actualValue.uuid, defaultUuid)
            XCTAssertEqual(actualValue.redeployOnUpdate, defaultRedeployOnUpdate)
            XCTAssertEqual(actualValue.payloads, defaultPayloads)
        } catch {
            XCTFail("Failed to initialize from data")
        }
    }

    func testShouldEncodeToData() {
        let payload = self.payload(for: "computer_configuration_profile_general_valid", subfolder: subfolder)!

        let actualValue = ComputerConfigurationProfileGeneral(json: payload)

        do {
            let encodedObject = try JSONEncoder().encode(actualValue)

            XCTAssertNotNil(encodedObject)
        } catch {
            XCTFail("Failed to encode to data")
        }
    }
}
