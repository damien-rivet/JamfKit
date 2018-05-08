//
//  ComputerGroupTests.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

import XCTest

@testable import JamfKit

class ComputerGroupTests: XCTestCase {

    // MARK: - Constants

    let subfolder = "ComputerGroup/"
    let defaultIdentifier: UInt = 12345
    let defaultName = "computers"
    let defaultIsSmart = true

    // MARK: - Tests

    func testShouldInstantiate() {
        let actualValue = ComputerGroup(identifier: defaultIdentifier, name: defaultName)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.identifier, defaultIdentifier)
        XCTAssertEqual(actualValue?.name, defaultName)
    }

    func testShouldNotInstantiateWithInvalidParameters() {
        let actualValue = ComputerGroup(identifier: defaultIdentifier, name: "")

        XCTAssertNil(actualValue)
    }

    func testShouldInitializeFromJSON() {
        let payload = self.payload(for: "computer_group_valid", subfolder: subfolder)!

        let actualValue = ComputerGroup(json: payload)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.description, "[ComputerGroup][12345 - computers]")
        XCTAssertEqual(actualValue?.identifier, defaultIdentifier)
        XCTAssertEqual(actualValue?.name, defaultName)
        XCTAssertEqual(actualValue?.isSmart, defaultIsSmart)
        XCTAssertNotNil(actualValue?.criteria)
        XCTAssertEqual(actualValue?.criteria.count, 1)
        XCTAssertNotNil(actualValue?.site)
        XCTAssertNotNil(actualValue?.computers)
        XCTAssertEqual(actualValue?.computers.count, 1)
    }

    func testShouldNotInitializeFromInvalidJSON() {
        let payload = self.payload(for: "computer_group_invalid", subfolder: subfolder)!

        let actualValue = ComputerGroup(json: payload)

        XCTAssertNil(actualValue)
    }

    func testShouldInitializeFromInvalidCriterionJSON() {
        let payload = self.payload(for: "computer_group_invalid_criterion", subfolder: subfolder)!

        let actualValue = ComputerGroup(json: payload)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.description, "[ComputerGroup][12345 - computers]")
        XCTAssertEqual(actualValue?.identifier, defaultIdentifier)
        XCTAssertEqual(actualValue?.name, defaultName)
        XCTAssertEqual(actualValue?.isSmart, defaultIsSmart)
        XCTAssertNotNil(actualValue?.criteria)
        XCTAssertEqual(actualValue?.criteria.count, 0)
        XCTAssertNotNil(actualValue?.site)
        XCTAssertNotNil(actualValue?.computers)
        XCTAssertEqual(actualValue?.computers.count, 1)
    }

    func testShouldInitializeFromInvalidMobileDeviceJSON() {
        let payload = self.payload(for: "computer_group_invalid_computer", subfolder: subfolder)!

        let actualValue = ComputerGroup(json: payload)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.description, "[ComputerGroup][12345 - computers]")
        XCTAssertEqual(actualValue?.identifier, defaultIdentifier)
        XCTAssertEqual(actualValue?.name, defaultName)
        XCTAssertEqual(actualValue?.isSmart, defaultIsSmart)
        XCTAssertNotNil(actualValue?.criteria)
        XCTAssertEqual(actualValue?.criteria.count, 1)
        XCTAssertNotNil(actualValue?.site)
        XCTAssertNotNil(actualValue?.computers)
        XCTAssertEqual(actualValue?.computers.count, 0)
    }

    func testShouldNotInitializeFromEmptyJSON() {
        let actualValue = ComputerGroup(json: [String: Any]())

        XCTAssertNil(actualValue)
    }

    func testShouldEncodeToJSON() {
        let payload = self.payload(for: "computer_group_valid", subfolder: subfolder)!

        let actualValue = ComputerGroup(json: payload)
        let encodedObject = actualValue?.toJSON()

        XCTAssertNotNil(encodedObject)
        XCTAssertEqual(encodedObject?.count, 6)
        XCTAssertNotNil(encodedObject?[BaseObject.IdentifierKey])
        XCTAssertNotNil(encodedObject?[BaseObject.NameKey])
        XCTAssertNotNil(encodedObject?[HardwareGroup.IsSmartKey])
        XCTAssertNotNil(encodedObject?[HardwareGroup.CriteriaKey])
        XCTAssertNotNil(encodedObject?[HardwareGroup.SiteKey])
        XCTAssertNotNil(encodedObject?[ComputerGroup.CodingKeys.computers.rawValue])
    }

    func testShouldInitializeFromData() {
        let payload = self.payloadData(for: "computer_group_valid", subfolder: subfolder)!

        do {
            let actualValue = try JSONDecoder().decode(ComputerGroup.self, from: payload)

            XCTAssertNotNil(actualValue)
            XCTAssertEqual(actualValue.description, "[ComputerGroup][12345 - computers]")
            XCTAssertEqual(actualValue.identifier, defaultIdentifier)
            XCTAssertEqual(actualValue.name, defaultName)
            XCTAssertEqual(actualValue.isSmart, defaultIsSmart)
            XCTAssertNotNil(actualValue.criteria)
            XCTAssertEqual(actualValue.criteria.count, 1)
            XCTAssertNotNil(actualValue.site)
            XCTAssertNotNil(actualValue.computers)
            XCTAssertEqual(actualValue.computers.count, 1)
        } catch {
            XCTFail("Failed to initialize from data")
        }
    }

    func testShouldEncodeToData() {
        let payload = self.payload(for: "computer_group_valid", subfolder: subfolder)!

        let actualValue = ComputerGroup(json: payload)

        do {
            let encodedObject = try JSONEncoder().encode(actualValue)

            XCTAssertNotNil(encodedObject)
        } catch {
            XCTFail("Failed to encode to data")
        }
    }
}
