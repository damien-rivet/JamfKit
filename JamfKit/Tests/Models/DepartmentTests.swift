//
//  DepartmentTests.swift
//  JamfKit
//
//  Copyright © 2017 JamfKit. All rights reserved.
//

import XCTest

@testable import JamfKit

class DepartmentTests: XCTestCase {

    // MARK: - Constants

    let defaultIdentifier: UInt = 12345
    let defaultName = "Unknown"

    // MARK: - Tests

    func testShouldInitializeFromJSON() {
        let payload = self.payload(for: "department_valid")!

        let actualValue = Department(json: payload)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.identifier, defaultIdentifier)
        XCTAssertEqual(actualValue?.name, defaultName)
        XCTAssertEqual(actualValue?.description, "[Department][\(defaultIdentifier). \(defaultName)]")
    }

    func testShouldNotInitializeFromInvalidJSON() {
        let payload = self.payload(for: "department_invalid")!

        let actualValue = Department(json: payload)

        XCTAssertNil(actualValue)
    }

    func testShouldEncodeToJSON() {
        let payload = self.payload(for: "department_valid")!

        let actualValue = Department(json: payload)
        let encodedObject = actualValue?.toJSON()

        XCTAssertNotNil(encodedObject)
        XCTAssertEqual(encodedObject?.count, 2)
    }
}
