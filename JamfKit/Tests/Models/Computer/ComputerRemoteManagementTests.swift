//
//  ComputerRemoteManagementTests.swift
//  JamfKit
//
//  Copyright © 2017 JamfKit. All rights reserved.
//

import XCTest

@testable import JamfKit

class ComputerRemoteManagementTests: XCTestCase {

    // MARK: - Constants

    let subfolder = "Computer/"
    let defaultManaged = true
    let defaultManagementUsername = "username"

    // MARK: - Tests

    func testShouldInitializeFromJSON() {
        let payload = self.payload(for: "computer_remote_management", subfolder: subfolder)!

        let actualValue = ComputerRemoteManagement(json: payload)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.isManaged, defaultManaged)
        XCTAssertEqual(actualValue?.managementUsername, defaultManagementUsername)
    }

    func testShouldInitializeFromEmptyJSON() {
        let actualValue = ComputerRemoteManagement(json: [String: Any]())

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.isManaged, false)
        XCTAssertEqual(actualValue?.managementUsername, "")
    }

    func testShouldEncodeToJSON() {
        let payload = self.payload(for: "computer_remote_management", subfolder: subfolder)!

        let actualValue = ComputerRemoteManagement(json: payload)
        let encodedObject = actualValue?.toJSON()

        XCTAssertNotNil(encodedObject)
        XCTAssertEqual(encodedObject?.count, 2)
        XCTAssertNotNil(encodedObject?[ComputerRemoteManagement.ManagedKey])
        XCTAssertNotNil(encodedObject?[ComputerRemoteManagement.ManagementUsernameKey])
    }
}
