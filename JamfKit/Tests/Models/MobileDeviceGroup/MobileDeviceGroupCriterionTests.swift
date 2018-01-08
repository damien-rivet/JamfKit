//
//  MobileDeviceGroupCriterionTests.swift
//  JamfKit
//
//  Copyright © 2018 JamfKit. All rights reserved.
//

import XCTest

@testable import JamfKit

class MobileDeviceGroupCriterionTests: XCTestCase {

    // MARK: - Constants

    let subfolder = "MobileDeviceGroup/"
    let defaultName = "Last Inventory Update"
    let defaultPriority: UInt = 0
    let defaultAndOr = "and"
    let defaultSearchType = "more than x days ago"
    let defaultValue: UInt = 7
    let defaultOpeningParen = false
    let defaultClosingParen = false

    // MARK: - Tests

    func testShouldInitializeFromJSON() {
        let payload = self.payload(for: "mobile_device_group_criterion", subfolder: subfolder)!

        let actualValue = MobileDeviceGroupCriterion(json: payload)

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
        let actualValue = MobileDeviceGroupCriterion(json: [String: Any]())

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
        let payload = self.payload(for: "mobile_device_group_criterion", subfolder: subfolder)!

        let actualValue = MobileDeviceGroupCriterion(json: payload)
        let encodedObject = actualValue?.toJSON()

        XCTAssertNotNil(encodedObject)
        XCTAssertEqual(encodedObject?.count, 7)
        XCTAssertNotNil(encodedObject?[MobileDeviceGroupCriterion.NameKey])
        XCTAssertNotNil(encodedObject?[MobileDeviceGroupCriterion.PriorityKey])
        XCTAssertNotNil(encodedObject?[MobileDeviceGroupCriterion.AndOrKey])
        XCTAssertNotNil(encodedObject?[MobileDeviceGroupCriterion.SearchTypeKey])
        XCTAssertNotNil(encodedObject?[MobileDeviceGroupCriterion.ValueKey])
        XCTAssertNotNil(encodedObject?[MobileDeviceGroupCriterion.OpeningParenKey])
        XCTAssertNotNil(encodedObject?[MobileDeviceGroupCriterion.ClosingParenKey])
    }
}
