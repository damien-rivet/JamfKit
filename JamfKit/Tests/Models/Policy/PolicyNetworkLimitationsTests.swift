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
        XCTAssertNotNil(encodedObject?[PolicyNetworkLimitations.MinimumNetworkConnectionKey])
        XCTAssertNotNil(encodedObject?[PolicyNetworkLimitations.AnyIpAddressKey])
    }
}
