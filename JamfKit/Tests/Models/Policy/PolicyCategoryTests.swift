//
//  PolicyCategoryTests.swift
//  JamfKit
//
//  Copyright © 2018 JamfKit. All rights reserved.
//

import XCTest

@testable import JamfKit

class PolicyCategoryTests: XCTestCase {

    // MARK: - Constants

    let subfolder = "Policy/"
    let defaultIdentifier: UInt = 12345
    let defaultName = "category"
    let defaultPriority: UInt = 10

    // MARK: - Tests

    func testShouldInitializeFromJSON() {
        let payload = self.payload(for: "policy_category_valid", subfolder: subfolder)!

        let actualValue = PolicyCategory(json: payload)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.identifier, defaultIdentifier)
        XCTAssertEqual(actualValue?.name, defaultName)
        XCTAssertEqual(actualValue?.priority, defaultPriority)
    }

    func testNotShouldInitializeFromInvalidJSON() {
        let payload = self.payload(for: "policy_category_invalid", subfolder: subfolder)!

        let actualValue = PolicyCategory(json: payload)

        XCTAssertNil(actualValue)
    }

    func testShouldEncodeToJSON() {
        let payload = self.payload(for: "policy_category_valid", subfolder: subfolder)!

        let actualValue = PolicyCategory(json: payload)
        let encodedObject = actualValue?.toJSON()

        XCTAssertNotNil(encodedObject)
        XCTAssertEqual(encodedObject?.count, 3)
        XCTAssertNotNil(encodedObject?[PolicyCategory.IdentifierKey])
        XCTAssertNotNil(encodedObject?[PolicyCategory.NameKey])
        XCTAssertNotNil(encodedObject?[PolicyCategory.PriorityKey])
    }
}
