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

        let baseObject = BaseObject(json: payload)

        XCTAssertNotNil(baseObject)
        XCTAssertEqual(baseObject?.identifier, defaultIdentifier)
        XCTAssertEqual(baseObject?.name, defaultName)
        XCTAssertEqual(baseObject?.description, "[\(defaultIdentifier). \(defaultName)]")
    }

    func testShouldNotInitializeFromInvalidJSON() {
        let payload = self.payload(for: "base_object_invalid")!

        let baseObject = BaseObject(json: payload)

        XCTAssertNil(baseObject)
    }

    func testShouldEncode() {
        let payload = self.payload(for: "base_object_valid")!

        let baseObject = BaseObject(json: payload)
        let encodedObject = baseObject?.toJSON()

        XCTAssertNotNil(encodedObject)
        XCTAssertEqual(encodedObject?.count, 2)
    }
}
