//
//  ComputerConfigurationGeneralTest.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

import XCTest

@testable import JamfKit

class ComputerConfigurationGeneralTest: XCTestCase {

    // MARK: - Constants

    let subfolder = "ComputerConfiguration/"
    let defaultIdentifier: UInt = 12345
    let defaultName = "High Sierra Base OS"
    let defaultDesc = "description"
    let defaultType = "Standard"
    let defaultParent = "parent"
    let defaultHomepage = "https://www.jamf.com"

    // MARK: - Tests

    func testShouldInstantiate() {
        let actualValue = ComputerConfigurationGeneral(identifier: defaultIdentifier, name: defaultName)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.identifier, defaultIdentifier)
        XCTAssertEqual(actualValue?.name, defaultName)
    }

    func testShouldNotInstantiateWithInvalidParameters() {
        let actualValue = ComputerConfigurationGeneral(identifier: defaultIdentifier, name: "")

        XCTAssertNil(actualValue)
    }

    func testShouldInitializeFromJSON() {
        let payload = self.payload(for: "computer_configuration_general_valid", subfolder: subfolder)!

        let actualValue = ComputerConfigurationGeneral(json: payload)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.identifier, defaultIdentifier)
        XCTAssertEqual(actualValue?.name, defaultName)
        XCTAssertEqual(actualValue?.desc, defaultDesc)
        XCTAssertEqual(actualValue?.type, defaultType)
        XCTAssertEqual(actualValue?.parent, defaultParent)
        XCTAssertEqual(actualValue?.homepage, defaultHomepage)
    }

    func testShouldNotInitializeFromInvalidJSON() {
        let payload = self.payload(for: "computer_configuration_general_invalid", subfolder: subfolder)!

        let actualValue = ComputerConfigurationGeneral(json: payload)

        XCTAssertNil(actualValue)
    }

    func testShouldNotInitializeFromEmptyJSON() {
        let actualValue = ComputerConfigurationGeneral(json: [String: Any]())

        XCTAssertNil(actualValue)
    }

    func testShouldEncodeToJSON() {
        let payload = self.payload(for: "computer_configuration_general_valid", subfolder: subfolder)!

        let actualValue = ComputerConfigurationGeneral(json: payload)
        let encodedObject = actualValue?.toJSON()

        XCTAssertNotNil(encodedObject)
        XCTAssertEqual(encodedObject?.count, 12)

        XCTAssertNotNil(encodedObject?[BaseObject.IdentifierKey])
        XCTAssertNotNil(encodedObject?[BaseObject.NameKey])
        XCTAssertNotNil(encodedObject?[ComputerConfigurationGeneral.CodingKeys.description.rawValue])
        XCTAssertNotNil(encodedObject?[ComputerConfigurationGeneral.CodingKeys.type.rawValue])
        XCTAssertNotNil(encodedObject?[ComputerConfigurationGeneral.CodingKeys.parent.rawValue])
        XCTAssertNotNil(encodedObject?[ComputerConfigurationGeneral.CodingKeys.packages.rawValue])
        XCTAssertNotNil(encodedObject?[ComputerConfigurationGeneral.CodingKeys.scripts.rawValue])
        XCTAssertNotNil(encodedObject?[ComputerConfigurationGeneral.CodingKeys.printers.rawValue])
        XCTAssertNotNil(encodedObject?[ComputerConfigurationGeneral.CodingKeys.directoryBindings.rawValue])
        XCTAssertNotNil(encodedObject?[ComputerConfigurationGeneral.CodingKeys.management.rawValue])
        XCTAssertNotNil(encodedObject?[ComputerConfigurationGeneral.CodingKeys.homepage.rawValue])
        XCTAssertNotNil(encodedObject?[ComputerConfigurationGeneral.CodingKeys.partitions.rawValue])
    }

    func testShouldInitializeFromData() {
        let payload = self.payloadData(for: "computer_configuration_general_valid", subfolder: subfolder)!

        do {
            let actualValue = try JSONDecoder().decode(ComputerConfigurationGeneral.self, from: payload)

            XCTAssertNotNil(actualValue)
            XCTAssertEqual(actualValue.identifier, defaultIdentifier)
            XCTAssertEqual(actualValue.name, defaultName)
            XCTAssertEqual(actualValue.desc, defaultDesc)
            XCTAssertEqual(actualValue.type, defaultType)
            XCTAssertEqual(actualValue.parent, defaultParent)
            XCTAssertEqual(actualValue.homepage, defaultHomepage)
        } catch {
            XCTFail("Failed to initialize from data")
        }
    }

    func testShouldEncodeToData() {
        let payload = self.payload(for: "computer_configuration_general_valid", subfolder: subfolder)!

        let actualValue = ComputerConfigurationGeneral(json: payload)

        do {
            let encodedObject = try JSONEncoder().encode(actualValue)

            XCTAssertNotNil(encodedObject)
        } catch {
            XCTFail("Failed to encode to data")
        }
    }
}
