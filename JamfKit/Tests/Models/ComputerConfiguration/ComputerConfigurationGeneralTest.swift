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

        XCTAssertNotNil(encodedObject?[BaseObject.CodingKeys.identifier.rawValue])
        XCTAssertNotNil(encodedObject?[BaseObject.CodingKeys.name.rawValue])
        XCTAssertNotNil(encodedObject?[ComputerConfigurationGeneral.DescriptionKey])
        XCTAssertNotNil(encodedObject?[ComputerConfigurationGeneral.TypeKey])
        XCTAssertNotNil(encodedObject?[ComputerConfigurationGeneral.ParentKey])
        XCTAssertNotNil(encodedObject?[ComputerConfigurationGeneral.PackagesKey])
        XCTAssertNotNil(encodedObject?[ComputerConfigurationGeneral.ScriptsKey])
        XCTAssertNotNil(encodedObject?[ComputerConfigurationGeneral.PrintersKey])
        XCTAssertNotNil(encodedObject?[ComputerConfigurationGeneral.DirectoryBindingsKey])
        XCTAssertNotNil(encodedObject?[ComputerConfigurationGeneral.ManagementKey])
        XCTAssertNotNil(encodedObject?[ComputerConfigurationGeneral.HomepageKey])
        XCTAssertNotNil(encodedObject?[ComputerConfigurationGeneral.PartitionsKey])
    }
}
