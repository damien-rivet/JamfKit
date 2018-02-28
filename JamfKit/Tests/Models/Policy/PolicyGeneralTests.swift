//
//  PolicyGeneralTests.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

import XCTest

@testable import JamfKit

class PolicyGeneralTests: XCTestCase {

    // MARK: - Constants

    let subfolder = "Policy/"
    let defaultIdentifier: UInt = 12345
    let defaultName = "Policy"
    let defaultEnabled = true
    let defaultTrigger = "trigger"
    let defaultTriggerCheckin = false
    let defaultTriggerEnrollmentComplete = false
    let defaultTriggerLogin = false
    let defaultTriggerLogout = false
    let defaultTriggerNetworkStateChanged = false
    let defaultTriggerStartup = false
    let defaultTriggerOther = "trigger_other"
    let defaultFrequency = "Once per computer"
    let defaultLocationUserOnly = true
    let defaultTargetDrive = "/"
    let defaultOffline = true
    let defaultNetworkRequirements = "Any"

    // MARK: - Tests

    func testShouldInstantiate() {
        let actualValue = PolicyGeneral(identifier: defaultIdentifier, name: defaultName)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.identifier, defaultIdentifier)
        XCTAssertEqual(actualValue?.name, defaultName)
    }

    func testShouldNotInstantiateWithInvalidParameters() {
        let actualValue = PolicyGeneral(identifier: defaultIdentifier, name: "")

        XCTAssertNil(actualValue)
    }

    func testShouldInitializeFromJSON() {
        let payload = self.payload(for: "policy_general_valid", subfolder: subfolder)!

        let actualValue = PolicyGeneral(json: payload)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.identifier, defaultIdentifier)
        XCTAssertEqual(actualValue?.name, defaultName)
        XCTAssertEqual(actualValue?.isEnabled, defaultEnabled)
        XCTAssertEqual(actualValue?.trigger, defaultTrigger)
        XCTAssertEqual(actualValue?.triggerCheckin, defaultTriggerCheckin)
        XCTAssertEqual(actualValue?.triggerEnrollmentComplete, defaultTriggerEnrollmentComplete)
        XCTAssertEqual(actualValue?.triggerLogin, defaultTriggerLogin)
        XCTAssertEqual(actualValue?.triggerLogout, defaultTriggerLogout)
        XCTAssertEqual(actualValue?.triggerNetworkStateChanged, defaultTriggerNetworkStateChanged)
        XCTAssertEqual(actualValue?.triggerStartup, defaultTriggerStartup)
        XCTAssertEqual(actualValue?.triggerOther, defaultTriggerOther)
        XCTAssertEqual(actualValue?.frequency, defaultFrequency)
        XCTAssertEqual(actualValue?.locationUserOnly, defaultLocationUserOnly)
        XCTAssertEqual(actualValue?.targetDrive, defaultTargetDrive)
        XCTAssertEqual(actualValue?.offline, defaultOffline)
        XCTAssertEqual(actualValue?.networkRequirements, defaultNetworkRequirements)
        XCTAssertNotNil(actualValue?.category)
        XCTAssertNotNil(actualValue?.dateTimeLimitations)
        XCTAssertNotNil(actualValue?.networkLimitations)
        XCTAssertNotNil(actualValue?.overrideDefaultSettings)
        XCTAssertNotNil(actualValue?.site)
    }

    func testShouldInitializeFromIncompleteJSON() {
        let payload = self.payload(for: "policy_general_incomplete", subfolder: subfolder)!

        let actualValue = PolicyGeneral(json: payload)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.identifier, defaultIdentifier)
        XCTAssertEqual(actualValue?.name, defaultName)
        XCTAssertEqual(actualValue?.isEnabled, false)
        XCTAssertEqual(actualValue?.trigger, "")
        XCTAssertEqual(actualValue?.triggerCheckin, false)
        XCTAssertEqual(actualValue?.triggerEnrollmentComplete, false)
        XCTAssertEqual(actualValue?.triggerLogin, false)
        XCTAssertEqual(actualValue?.triggerLogout, false)
        XCTAssertEqual(actualValue?.triggerNetworkStateChanged, false)
        XCTAssertEqual(actualValue?.triggerStartup, false)
        XCTAssertEqual(actualValue?.triggerOther, "")
        XCTAssertEqual(actualValue?.frequency, "")
        XCTAssertEqual(actualValue?.locationUserOnly, false)
        XCTAssertEqual(actualValue?.targetDrive, "")
        XCTAssertEqual(actualValue?.offline, false)
        XCTAssertEqual(actualValue?.networkRequirements, "")
        XCTAssertNil(actualValue?.category)
        XCTAssertNil(actualValue?.dateTimeLimitations)
        XCTAssertNil(actualValue?.networkLimitations)
        XCTAssertNil(actualValue?.overrideDefaultSettings)
        XCTAssertNil(actualValue?.site)
    }

    func testShouldNotInitializeFromInvalidJSON() {
        let payload = self.payload(for: "policy_general_invalid", subfolder: subfolder)!

        let site = PolicyGeneral(json: payload)

        XCTAssertNil(site)
    }

    func testShouldEncodeToJSON() {
        let payload = self.payload(for: "policy_general_valid", subfolder: subfolder)!

        let actualValue = PolicyGeneral(json: payload)
        let encodedObject = actualValue?.toJSON()

        XCTAssertNotNil(encodedObject)
        XCTAssertEqual(encodedObject?.count, 21)

        XCTAssertNotNil(encodedObject?[BaseObject.IdentifierKey])
        XCTAssertNotNil(encodedObject?[BaseObject.NameKey])
        XCTAssertNotNil(encodedObject?[PolicyGeneral.CodingKeys.enabled.rawValue])
        XCTAssertNotNil(encodedObject?[PolicyGeneral.CodingKeys.trigger.rawValue])
        XCTAssertNotNil(encodedObject?[PolicyGeneral.CodingKeys.triggerCheckin.rawValue])
        XCTAssertNotNil(encodedObject?[PolicyGeneral.CodingKeys.triggerEnrollmentComplete.rawValue])
        XCTAssertNotNil(encodedObject?[PolicyGeneral.CodingKeys.triggerLogin.rawValue])
        XCTAssertNotNil(encodedObject?[PolicyGeneral.CodingKeys.triggerLogout.rawValue])
        XCTAssertNotNil(encodedObject?[PolicyGeneral.CodingKeys.triggerNetworkStateChanged.rawValue])
        XCTAssertNotNil(encodedObject?[PolicyGeneral.CodingKeys.triggerStartup.rawValue])
        XCTAssertNotNil(encodedObject?[PolicyGeneral.CodingKeys.triggerOther.rawValue])
        XCTAssertNotNil(encodedObject?[PolicyGeneral.CodingKeys.frequency.rawValue])
        XCTAssertNotNil(encodedObject?[PolicyGeneral.CodingKeys.locationUserOnly.rawValue])
        XCTAssertNotNil(encodedObject?[PolicyGeneral.CodingKeys.targetDrive.rawValue])
        XCTAssertNotNil(encodedObject?[PolicyGeneral.CodingKeys.offline.rawValue])
        XCTAssertNotNil(encodedObject?[PolicyGeneral.CodingKeys.category.rawValue])
        XCTAssertNotNil(encodedObject?[PolicyGeneral.CodingKeys.dateTimeLimitations.rawValue])
        XCTAssertNotNil(encodedObject?[PolicyGeneral.CodingKeys.networkLimitations.rawValue])
        XCTAssertNotNil(encodedObject?[PolicyGeneral.CodingKeys.overrideDefaultSettings.rawValue])
        XCTAssertNotNil(encodedObject?[PolicyGeneral.CodingKeys.networkRequirements.rawValue])
        XCTAssertNotNil(encodedObject?[PolicyGeneral.CodingKeys.site.rawValue])
    }

    func testShouldInitializeFromData() {
        let payload = self.payloadData(for: "policy_general_valid", subfolder: subfolder)!

        do {
            let actualValue = try JSONDecoder().decode(PolicyGeneral.self, from: payload)

            XCTAssertNotNil(actualValue)
            XCTAssertEqual(actualValue.identifier, defaultIdentifier)
            XCTAssertEqual(actualValue.name, defaultName)
            XCTAssertEqual(actualValue.isEnabled, false)
            XCTAssertEqual(actualValue.trigger, "")
            XCTAssertEqual(actualValue.triggerCheckin, false)
            XCTAssertEqual(actualValue.triggerEnrollmentComplete, false)
            XCTAssertEqual(actualValue.triggerLogin, false)
            XCTAssertEqual(actualValue.triggerLogout, false)
            XCTAssertEqual(actualValue.triggerNetworkStateChanged, false)
            XCTAssertEqual(actualValue.triggerStartup, false)
            XCTAssertEqual(actualValue.triggerOther, "")
            XCTAssertEqual(actualValue.frequency, "")
            XCTAssertEqual(actualValue.locationUserOnly, false)
            XCTAssertEqual(actualValue.targetDrive, "")
            XCTAssertEqual(actualValue.offline, false)
            XCTAssertEqual(actualValue.networkRequirements, "")
            XCTAssertNil(actualValue.category)
            XCTAssertNil(actualValue.dateTimeLimitations)
            XCTAssertNil(actualValue.networkLimitations)
            XCTAssertNil(actualValue.overrideDefaultSettings)
            XCTAssertNil(actualValue.site)
        } catch {
            XCTFail("Failed to initialize from data")
        }
    }

    func testShouldEncodeToData() {
        let payload = self.payload(for: "policy_general_valid", subfolder: subfolder)!

        let actualValue = PolicyGeneral(json: payload)

        do {
            let encodedObject = try JSONEncoder().encode(actualValue)

            XCTAssertNotNil(encodedObject)
        } catch {
            XCTFail("Failed to encode to data")
        }
    }
}
