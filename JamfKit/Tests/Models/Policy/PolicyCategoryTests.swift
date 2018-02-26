//
//  PolicyCategoryTests.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
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

    func testShouldInstantiate() {
        let actualValue = PolicyCategory(identifier: defaultIdentifier, name: defaultName)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.identifier, defaultIdentifier)
        XCTAssertEqual(actualValue?.name, defaultName)
    }

    func testShouldNotInstantiateWithInvalidParameters() {
        let actualValue = PolicyCategory(identifier: defaultIdentifier, name: "")

        XCTAssertNil(actualValue)
    }

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

        XCTAssertNotNil(encodedObject?[BaseObject.CodingKeys.identifier.rawValue])
        XCTAssertNotNil(encodedObject?[BaseObject.CodingKeys.name.rawValue])
        XCTAssertNotNil(encodedObject?[PolicyCategory.PriorityKey])
    }
}
