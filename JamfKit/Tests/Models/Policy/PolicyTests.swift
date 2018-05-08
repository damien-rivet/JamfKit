//
//  PolicyTests.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

import XCTest

@testable import JamfKit

class PolicyTests: XCTestCase {

    // MARK: - Constants

    let subfolder = "Policy/"
    let defaultIdentifier: UInt = 12345
    let defaultName = "Policy"

    // MARK: - Tests

    func testShouldInstantiate() {
        let actualValue = Policy(identifier: defaultIdentifier, name: defaultName)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.general.identifier, defaultIdentifier)
        XCTAssertEqual(actualValue?.general.name, defaultName)
    }

    func testShouldNotInstantiateWithInvalidParameters() {
        let actualValue = Policy(identifier: defaultIdentifier, name: "")

        XCTAssertNil(actualValue)
    }

    func testShouldInitializeFromJSON() {
        let payload = self.payload(for: "policy", subfolder: subfolder)!

        let actualValue = Policy(json: payload)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.description, "[Policy][\(defaultIdentifier) - \(defaultName)]")
        XCTAssertNotNil(actualValue?.general)
    }

    func testShouldInitializeFromIncompleteJSON() {
        let payload = self.payload(for: "policy_incomplete", subfolder: subfolder)!

        let actualValue = Policy(json: payload)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.description, "[Policy][\(defaultIdentifier) - \(defaultName)]")
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
        XCTAssertNotNil(encodedObject?[Policy.CodingKeys.general.rawValue])
    }

    func testShouldInitializeFromData() {
        let payload = self.payloadData(for: "policy", subfolder: subfolder)!

        do {
            let actualValue = try JSONDecoder().decode(Policy.self, from: payload)

            XCTAssertNotNil(actualValue)
            XCTAssertEqual(actualValue.description, "[Policy][\(defaultIdentifier) - \(defaultName)]")
            XCTAssertNotNil(actualValue.general)
        } catch {
            XCTFail("Failed to initialize from data")
        }
    }

    func testShouldEncodeToData() {
        let payload = self.payload(for: "policy", subfolder: subfolder)!

        let actualValue = Policy(json: payload)

        do {
            let encodedObject = try JSONEncoder().encode(actualValue)

            XCTAssertNotNil(encodedObject)
        } catch {
            XCTFail("Failed to encode to data")
        }
    }
}
