//
//  ComputerConfigurationTests.swift
//  JamfKit
//
//  Copyright © 2018 JamfKit. All rights reserved.
//

import XCTest

@testable import JamfKit

class ComputerConfigurationTests: XCTestCase {

    // MARK: - Constants

    let subfolder = "ComputerConfiguration/"

    // MARK: - Tests

    func testShouldInitializeFromJSON() {
        let payload = self.payload(for: "computer_configuration", subfolder: subfolder)!

        let actualValue = ComputerConfiguration(json: payload)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.description, "[ComputerConfiguration][12345. High Sierra Base OS]")
        XCTAssertNotNil(actualValue?.general)
    }

    func testShouldNotInitializeFromEmptyJSON() {
        let actualValue = ComputerConfiguration(json: [String: Any]())

        XCTAssertNil(actualValue)
    }

    func testShouldEncodeToJSON() {
        let payload = self.payload(for: "computer_configuration", subfolder: subfolder)!

        let actualValue = ComputerConfiguration(json: payload)
        let encodedObject = actualValue?.toJSON()

        XCTAssertNotNil(encodedObject)
        XCTAssertEqual(encodedObject?.count, 1)
        XCTAssertNotNil(encodedObject?[ComputerConfiguration.GeneralKey])
    }
}
