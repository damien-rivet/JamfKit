//
//  PolicyOverrideDefaultSettingsTests.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

import XCTest

@testable import JamfKit

class PolicyOverrideDefaultSettingsTests: XCTestCase {

    // MARK: - Constants

    let subfolder = "Policy/"
    let defaultTargetDrive = "target_drive"
    let defaultDistributionPoint = "distribution_point"
    let defaultForceAfpSmb = true
    let defaultSus = "sus"
    let defaultNetbootServer = "netboot_server"

    // MARK: - Tests

    func testShouldInitializeFromJSON() {
        let payload = self.payload(for: "policy_override_default_settings", subfolder: subfolder)!

        let actualValue = PolicyOverrideDefaultSettings(json: payload)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.targetDrive, defaultTargetDrive)
        XCTAssertEqual(actualValue?.distributionPoint, defaultDistributionPoint)
        XCTAssertEqual(actualValue?.shouldForceAfpSmb, defaultForceAfpSmb)
        XCTAssertEqual(actualValue?.sus, defaultSus)
        XCTAssertEqual(actualValue?.netbootServer, defaultNetbootServer)
    }

    func testShouldInitializeFromEmptyJSON() {
        let actualValue = PolicyOverrideDefaultSettings(json: [String: Any]())

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.targetDrive, "")
        XCTAssertEqual(actualValue?.distributionPoint, "")
        XCTAssertEqual(actualValue?.shouldForceAfpSmb, false)
        XCTAssertEqual(actualValue?.sus, "")
        XCTAssertEqual(actualValue?.netbootServer, "")
    }

    func testShouldEncodeToJSON() {
        let payload = self.payload(for: "policy_override_default_settings", subfolder: subfolder)!

        let actualValue = PolicyOverrideDefaultSettings(json: payload)
        let encodedObject = actualValue?.toJSON()

        XCTAssertNotNil(encodedObject)
        XCTAssertEqual(encodedObject?.count, 5)
        XCTAssertNotNil(encodedObject?[PolicyOverrideDefaultSettings.TargetDriveKey])
        XCTAssertNotNil(encodedObject?[PolicyOverrideDefaultSettings.DistributionPointKey])
        XCTAssertNotNil(encodedObject?[PolicyOverrideDefaultSettings.ForceAfpSmbKey])
        XCTAssertNotNil(encodedObject?[PolicyOverrideDefaultSettings.SusKey])
        XCTAssertNotNil(encodedObject?[PolicyOverrideDefaultSettings.NetbootServerKey])
    }
}
