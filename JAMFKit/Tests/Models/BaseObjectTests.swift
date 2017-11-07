//
//  IdentifiableTests.swift
//  JAMFKit
//
//  Created by Damien Rivet on 25.10.17.
//  Copyright © 2017 JAMFKit. All rights reserved.
//

import XCTest

@testable import JAMFKit

class BaseObjectTests: XCTestCase {

    // MARK: - Constants

    let defaultIdentifier: UInt = 12345
    let defaultName = "Test"

    // MARK: - Tests

    func testShouldInitializeFromJSON() {
        let payload = self.payload(for: "base_object_valid")!

        let actualValue = BaseObject(json: payload)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.identifier, defaultIdentifier)
        XCTAssertEqual(actualValue?.name, defaultName)
        XCTAssertEqual(actualValue?.description, "[\(defaultIdentifier). \(defaultName)]")
    }

    func testShouldNotInitializeFromInvalidJSON() {
        let payload = self.payload(for: "base_object_invalid")!

        let actualValue = BaseObject(json: payload)

        XCTAssertNil(actualValue)
    }

    func testShouldEncodeToJSON() {
        let payload = self.payload(for: "base_object_valid")!

        let actualValue = BaseObject(json: payload)
        let encodedObject = actualValue?.toJSON()

        XCTAssertNotNil(encodedObject)
        XCTAssertEqual(encodedObject?.count, 2)
    }
}
