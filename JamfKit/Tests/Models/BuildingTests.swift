//
//  BuildingTests.swift
//  JamfKit
//
//  Copyright © 2017 JamfKit. All rights reserved.
//

import XCTest

@testable import JamfKit

class BuildingTests: XCTestCase {

    // MARK: - Constants

    let subfolder = "Building/"
    let defaultIdentifier: UInt = 12345
    let defaultName = "Building"

    // MARK: - Tests

    func testShouldInitializeFromJSON() {
        let payload = self.payload(for: "building_valid", subfolder: subfolder)!

        let actualValue = Building(json: payload)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.identifier, defaultIdentifier)
        XCTAssertEqual(actualValue?.name, defaultName)
        XCTAssertEqual(actualValue?.description, "[Building][\(defaultIdentifier). \(defaultName)]")
    }

    func testShouldNotInitializeFromInvalidJSON() {
        let payload = self.payload(for: "building_invalid", subfolder: subfolder)!

        let actualValue = Building(json: payload)

        XCTAssertNil(actualValue)
    }

    func testShouldEncodeToJSON() {
        let payload = self.payload(for: "building_valid", subfolder: subfolder)!

        let actualValue = Building(json: payload)
        let encodedObject = actualValue?.toJSON()

        XCTAssertNotNil(encodedObject)
        XCTAssertEqual(encodedObject?.count, 2)
    }
}
