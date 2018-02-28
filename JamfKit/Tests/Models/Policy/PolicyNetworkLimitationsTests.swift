//
//  PolicyNetworkLimitationsTests.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

import XCTest

@testable import JamfKit

class PolicyNetworkLimitationsTests: XCTestCase {

    // MARK: - Constants

    let subfolder = "Policy/"
    let defaultMinimumNetworkConnection = "No Minimum"
    let defaultAnyIpAddress = true

    // MARK: - Tests

    func testShouldInitializeFromJSON() {
        let payload = self.payload(for: "policy_network_limitations", subfolder: subfolder)!

        let actualValue = PolicyNetworkLimitations(json: payload)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.minimumNetworkConnection, defaultMinimumNetworkConnection)
        XCTAssertEqual(actualValue?.anyIpAddress, defaultAnyIpAddress)
    }

    func testShouldInitializeFromEmptyJSON() {
        let actualValue = PolicyNetworkLimitations(json: [String: Any]())

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.minimumNetworkConnection, "")
        XCTAssertEqual(actualValue?.anyIpAddress, false)
    }

    func testShouldEncodeToJSON() {
        let payload = self.payload(for: "policy_network_limitations", subfolder: subfolder)!

        let actualValue = PolicyNetworkLimitations(json: payload)
        let encodedObject = actualValue?.toJSON()

        XCTAssertNotNil(encodedObject)
        XCTAssertEqual(encodedObject?.count, 2)
        XCTAssertNotNil(encodedObject?[PolicyNetworkLimitations.CodingKeys.minimumNetworkConnection.rawValue])
        XCTAssertNotNil(encodedObject?[PolicyNetworkLimitations.CodingKeys.anyIpAddress.rawValue])
    }

    func testShouldInitializeFromData() {
        let payload = self.payloadData(for: "policy_network_limitations", subfolder: subfolder)!

        do {
            let actualValue = try JSONDecoder().decode(PolicyNetworkLimitations.self, from: payload)

            XCTAssertNotNil(actualValue)
            XCTAssertEqual(actualValue.minimumNetworkConnection, defaultMinimumNetworkConnection)
            XCTAssertEqual(actualValue.anyIpAddress, defaultAnyIpAddress)
        } catch {
            XCTFail("Failed to initialize from data")
        }
    }

    func testShouldEncodeToData() {
        let payload = self.payload(for: "policy_network_limitations", subfolder: subfolder)!

        let actualValue = PolicyNetworkLimitations(json: payload)

        do {
            let encodedObject = try JSONEncoder().encode(actualValue)

            XCTAssertNotNil(encodedObject)
        } catch {
            XCTFail("Failed to encode to data")
        }
    }
}
