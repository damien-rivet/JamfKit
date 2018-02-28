//
//  MobileDeviceGroupCriterionTests.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

import XCTest

@testable import JamfKit

class HardwareGroupCriterionTests: XCTestCase {

    // MARK: - Constants

    let subfolder = "HardwareGroup/"
    let defaultName = "Last Inventory Update"
    let defaultPriority: UInt = 0
    let defaultAndOr = "and"
    let defaultSearchType = "more than x days ago"
    let defaultValue: UInt = 7
    let defaultOpeningParen = false
    let defaultClosingParen = false

    // MARK: - Tests

    func testShouldInstantiate() {
        let actualValue = HardwareGroupCriterion(name: defaultName)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.name, defaultName)
    }

    func testShouldNotInstantiateWithInvalidParameters() {
        let actualValue = HardwareGroupCriterion(name: "")

        XCTAssertNil(actualValue)
    }

    func testShouldInitializeFromJSON() {
        let payload = self.payload(for: "hardware_group_criterion", subfolder: subfolder)!

        let actualValue = HardwareGroupCriterion(json: payload)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.name, defaultName)
        XCTAssertEqual(actualValue?.priority, defaultPriority)
        XCTAssertEqual(actualValue?.andOr, defaultAndOr)
        XCTAssertEqual(actualValue?.searchType, defaultSearchType)
        XCTAssertEqual(actualValue?.value, defaultValue)
        XCTAssertEqual(actualValue?.openingParen, defaultOpeningParen)
        XCTAssertEqual(actualValue?.closingParen, defaultClosingParen)
    }

    func testShouldInitializeFromEmptyJSON() {
        let actualValue = HardwareGroupCriterion(json: [String: Any]())

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.name, "")
        XCTAssertEqual(actualValue?.priority, 0)
        XCTAssertEqual(actualValue?.andOr, "")
        XCTAssertEqual(actualValue?.searchType, "")
        XCTAssertEqual(actualValue?.value, 0)
        XCTAssertEqual(actualValue?.openingParen, false)
        XCTAssertEqual(actualValue?.closingParen, false)
    }

    func testShouldEncodeToJSON() {
        let payload = self.payload(for: "hardware_group_criterion", subfolder: subfolder)!

        let actualValue = HardwareGroupCriterion(json: payload)
        let encodedObject = actualValue?.toJSON()

        XCTAssertNotNil(encodedObject)
        XCTAssertEqual(encodedObject?.count, 7)
        XCTAssertNotNil(encodedObject?[HardwareGroupCriterion.CodingKeys.name.rawValue])
        XCTAssertNotNil(encodedObject?[HardwareGroupCriterion.CodingKeys.priority.rawValue])
        XCTAssertNotNil(encodedObject?[HardwareGroupCriterion.CodingKeys.andOr.rawValue])
        XCTAssertNotNil(encodedObject?[HardwareGroupCriterion.CodingKeys.searchType.rawValue])
        XCTAssertNotNil(encodedObject?[HardwareGroupCriterion.CodingKeys.value.rawValue])
        XCTAssertNotNil(encodedObject?[HardwareGroupCriterion.CodingKeys.openingParen.rawValue])
        XCTAssertNotNil(encodedObject?[HardwareGroupCriterion.CodingKeys.closingParen.rawValue])
    }

    func testShouldInitializeFromData() {
        let payload = self.payloadData(for: "hardware_group_criterion", subfolder: subfolder)!

        do {
            let actualValue = try JSONDecoder().decode(HardwareGroupCriterion.self, from: payload)

            XCTAssertNotNil(actualValue)
            XCTAssertEqual(actualValue.name, defaultName)
            XCTAssertEqual(actualValue.priority, defaultPriority)
            XCTAssertEqual(actualValue.andOr, defaultAndOr)
            XCTAssertEqual(actualValue.searchType, defaultSearchType)
            XCTAssertEqual(actualValue.value, defaultValue)
            XCTAssertEqual(actualValue.openingParen, defaultOpeningParen)
            XCTAssertEqual(actualValue.closingParen, defaultClosingParen)
        } catch {
            XCTFail("Failed to initialize from data")
        }
    }

    func testShouldEncodeToData() {
        let payload = self.payload(for: "hardware_group_criterion", subfolder: subfolder)!

        let actualValue = HardwareGroupCriterion(json: payload)

        do {
            let encodedObject = try JSONEncoder().encode(actualValue)

            XCTAssertNotNil(encodedObject)
        } catch {
            XCTFail("Failed to encode to data")
        }
    }
}
