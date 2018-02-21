//
//  NetworkSegmentTests.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

import XCTest

@testable import JamfKit

class NetworkSegmentTests: XCTestCase {

    // MARK: - Constants

    let subfolder = "NetworkSegment/"
    let defaultIdentifier: UInt = 12345
    let defaultName = "network_segment"
    let defaultStartingAddress = "127.0.0.1"
    let defaultEndingAddress = "127.0.0.255"
    let defaultDistributionServer = "distribution_server"
    let defaultDistributionPoint = "distribution_point"
    let defaultUrl = "url"
    let defaultNetbootServer = "netboot_server"
    let defaultSwuServer = "swu_server"
    let defaultBuilding = "building"
    let defaultDepartment = "department"
    let defaultOverridesBuildings = true
    let defaultOverridesDepartments = false

    // MARK: - Tests

    func testShouldInstantiate() {
        let actualValue = NetworkSegment(identifier: defaultIdentifier, name: defaultName)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.identifier, defaultIdentifier)
        XCTAssertEqual(actualValue?.name, defaultName)
    }

    func testShouldNotInstantiateWithInvalidParameters() {
        let actualValue = NetworkSegment(identifier: defaultIdentifier, name: "")

        XCTAssertNil(actualValue)
    }

    func testShouldInitializeFromJSON() {
        let payload = self.payload(for: "network_segment_valid", subfolder: subfolder)!

        let actualValue = NetworkSegment(json: payload)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.description, "[NetworkSegment][\(defaultIdentifier) - \(defaultName)]")
        XCTAssertEqual(actualValue?.identifier, defaultIdentifier)
        XCTAssertEqual(actualValue?.name, defaultName)
        XCTAssertEqual(actualValue?.startingAddress, defaultStartingAddress)
        XCTAssertEqual(actualValue?.endingAddress, defaultEndingAddress)
        XCTAssertEqual(actualValue?.distributionServer, defaultDistributionServer)
        XCTAssertEqual(actualValue?.distributionPoint, defaultDistributionPoint)
        XCTAssertEqual(actualValue?.url, defaultUrl)
        XCTAssertEqual(actualValue?.netbootServer, defaultNetbootServer)
        XCTAssertEqual(actualValue?.swuServer, defaultSwuServer)
        XCTAssertEqual(actualValue?.building, defaultBuilding)
        XCTAssertEqual(actualValue?.department, defaultDepartment)
        XCTAssertEqual(actualValue?.overridesBuildings, defaultOverridesBuildings)
        XCTAssertEqual(actualValue?.overridesDepartments, defaultOverridesDepartments)
    }

    func testShouldInitializeFromIncompleteJSON() {
        let payload = self.payload(for: "network_segment_incomplete", subfolder: subfolder)!

        let actualValue = NetworkSegment(json: payload)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.description, "[NetworkSegment][\(defaultIdentifier) - \(defaultName)]")
    }

    func testShouldNotInitializeFromInvalidJSON() {
        let payload = self.payload(for: "network_segment_invalid", subfolder: subfolder)!

        let actualValue = NetworkSegment(json: payload)

        XCTAssertNil(actualValue)
    }

    func testShouldEncodeToJSON() {
        let payload = self.payload(for: "network_segment_valid", subfolder: subfolder)!

        let actualValue = NetworkSegment(json: payload)
        let encodedObject = actualValue?.toJSON()

        XCTAssertNotNil(encodedObject)
        XCTAssertEqual(encodedObject?.count, 13)
        XCTAssertNotNil(encodedObject?[BaseObject.CodingKeys.identifier.rawValue])
        XCTAssertNotNil(encodedObject?[BaseObject.CodingKeys.name.rawValue])
        XCTAssertNotNil(encodedObject?[NetworkSegment.StartingAddressKey])
        XCTAssertNotNil(encodedObject?[NetworkSegment.EndingAddressKey])
        XCTAssertNotNil(encodedObject?[NetworkSegment.DistributionServerKey])
        XCTAssertNotNil(encodedObject?[NetworkSegment.DistributionPointKey])
        XCTAssertNotNil(encodedObject?[NetworkSegment.UrlKey])
        XCTAssertNotNil(encodedObject?[NetworkSegment.NetbootServerKey])
        XCTAssertNotNil(encodedObject?[NetworkSegment.SwuServerKey])
        XCTAssertNotNil(encodedObject?[NetworkSegment.BuildingKey])
        XCTAssertNotNil(encodedObject?[NetworkSegment.DepartmentKey])
        XCTAssertNotNil(encodedObject?[NetworkSegment.OverrideBuildingsKey])
        XCTAssertNotNil(encodedObject?[NetworkSegment.OverrideDepartmentsKey])
    }
}
