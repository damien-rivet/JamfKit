//
//  ComputerConfigurationTests.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

import XCTest

@testable import JamfKit

class ComputerConfigurationTests: XCTestCase {

    // MARK: - Constants

    let subfolder = "ComputerConfiguration/"
    let defaultIdentifier: UInt = 12345
    let defaultName = "High Sierra Base OS"

    // MARK: - Tests

    func testShouldInstantiate() {
        let actualValue = ComputerConfiguration(identifier: defaultIdentifier, name: defaultName)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.general.identifier, defaultIdentifier)
        XCTAssertEqual(actualValue?.general.name, defaultName)
    }

    func testShouldNotInstantiateWithInvalidParameters() {
        let actualValue = ComputerConfiguration(identifier: defaultIdentifier, name: "")

        XCTAssertNil(actualValue)
    }

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
        XCTAssertNotNil(encodedObject?[ComputerConfiguration.CodingKeys.general.rawValue])
    }

    func testShouldInitializeFromData() {
        let payload = self.payloadData(for: "computer_configuration", subfolder: subfolder)!

        do {
            let actualValue = try JSONDecoder().decode(ComputerConfiguration.self, from: payload)

            XCTAssertNotNil(actualValue)
            XCTAssertEqual(actualValue.description, "[ComputerConfiguration][12345. High Sierra Base OS]")
            XCTAssertNotNil(actualValue.general)
        } catch {
            XCTFail("Failed to initialize from data")
        }
    }

    func testShouldEncodeToData() {
        let payload = self.payload(for: "computer_configuration", subfolder: subfolder)!

        let actualValue = ComputerConfiguration(json: payload)

        do {
            let encodedObject = try JSONEncoder().encode(actualValue)

            XCTAssertNotNil(encodedObject)
        } catch {
            XCTFail("Failed to encode to data")
        }
    }
}
