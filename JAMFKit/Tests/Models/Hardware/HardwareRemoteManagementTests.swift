//
//  HardwareRemoteManagementTests.swift
//  JAMFKit
//
//  Copyright © 2017 JAMFKit. All rights reserved.
//

import XCTest

@testable import JAMFKit

class HardwareRemoteManagementTests: XCTestCase {

    // MARK: - Constants

    let defaultManaged = true
    let defaultManagementUsername = "username"

    // MARK: - Tests

    func testShouldInitializeFromJSON() {
        let payload = self.payload(for: "hardware_remote_management")!

        let actualValue = HardwareRemoteManagement(json: payload)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.isManaged, defaultManaged)
        XCTAssertEqual(actualValue?.managementUsername, defaultManagementUsername)
    }

    func testShouldInitializeFromEmptyJSON() {
        let actualValue = HardwareRemoteManagement(json: [String: Any]())

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.isManaged, false)
        XCTAssertEqual(actualValue?.managementUsername, "")
    }

    func testShouldEncodeToJSON() {
        let payload = self.payload(for: "hardware_remote_management")!

        let actualValue = HardwareRemoteManagement(json: payload)
        let encodedObject = actualValue?.toJSON()

        XCTAssertNotNil(encodedObject)
        XCTAssertEqual(encodedObject?.count, 2)
        XCTAssertNotNil(encodedObject?[HardwareRemoteManagement.ManagedKey])
        XCTAssertNotNil(encodedObject?[HardwareRemoteManagement.ManagementUsernameKey])
    }
}
