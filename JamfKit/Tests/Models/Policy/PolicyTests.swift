//
//  PolicyTests.swift
//  JAMFKit
//
//  Copyright © 2018 JAMFKit. All rights reserved.
//

import XCTest

@testable import JAMFKit

class PolicyTests: XCTestCase {

    // MARK: - Constants

    let subfolder = "Policy/"

    // MARK: - Tests

    func testShouldInitializeFromJSON() {
        let payload = self.payload(for: "policy", subfolder: subfolder)!

        let actualValue = Policy(json: payload)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.description, "[Policy][12345. policy]")
        XCTAssertNotNil(actualValue?.general)
    }

    func testShouldInitializeFromIncompleteJSON() {
        let payload = self.payload(for: "policy_incomplete", subfolder: subfolder)!

        let actualValue = Policy(json: payload)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.description, "[Policy][12345. policy]")
        XCTAssertNotNil(actualValue?.general)
    }

    func testShouldNotInitializeFromEmptyJSON() {
        let actualValue = Computer(json: [String: Any]())

        XCTAssertNil(actualValue)
    }

    func testShouldNotInitializeFromInvalidJSON() {
        let payload = self.payload(for: "policy_invalid", subfolder: subfolder)!

        let actualValue = Policy(json: payload)

        XCTAssertNil(actualValue)
    }

    func testShouldEncodeToJSON() {
        let payload = self.payload(for: "policy", subfolder: subfolder)!

        let actualValue = Policy(json: payload)
        let encodedObject = actualValue?.toJSON()

        XCTAssertNotNil(encodedObject)
        XCTAssertEqual(encodedObject?.count, 1)
        XCTAssertNotNil(encodedObject?[Policy.GeneralKey])
    }
}
