//
//  PolicyDateTimeLimitationsTests.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

import XCTest

@testable import JamfKit

class PolicyDateTimeLimitationsTests: XCTestCase {

    // MARK: - Constants

    let subfolder = "Policy/"
    let defaultNoExecuteOn: [String: String] = [
        "day": "Sun"
    ]
    let defaultNoExecuteStart = "2:00 AM"
    let defaultNoExecuteEnd = "4:00 AM"

    // MARK: - Tests

    func testShouldInitializeFromJSON() {
        let payload = self.payload(for: "policy_date_time_limitations", subfolder: subfolder)!

        let defaultActivationDate = PreciseDate(json: payload, node: PolicyDateTimeLimitations.CodingKeys.activationDate.rawValue)
        let defaultExpirationDate = PreciseDate(json: payload, node: PolicyDateTimeLimitations.CodingKeys.expirationDate.rawValue)

        let actualValue = PolicyDateTimeLimitations(json: payload)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.activationDate?.date, defaultActivationDate?.date)
        XCTAssertEqual(actualValue?.activationDate?.epoch, defaultActivationDate?.epoch)
        XCTAssertEqual(actualValue?.activationDate?.dateUTC, defaultActivationDate?.dateUTC)
        XCTAssertEqual(actualValue?.expirationDate?.date, defaultExpirationDate?.date)
        XCTAssertEqual(actualValue?.expirationDate?.epoch, defaultExpirationDate?.epoch)
        XCTAssertEqual(actualValue?.expirationDate?.dateUTC, defaultExpirationDate?.dateUTC)
        XCTAssertEqual(actualValue?.noExecutionOn.count, defaultNoExecuteOn.count)
        XCTAssertEqual(actualValue?.noExecutionOn["day"], "Sun")
        XCTAssertEqual(actualValue?.noExecutionStart, defaultNoExecuteStart)
        XCTAssertEqual(actualValue?.noExecutionEnd, defaultNoExecuteEnd)
    }

    func testShouldInitializeFromEmptyJSON() {
        let actualValue = PolicyDateTimeLimitations(json: [String: Any]())

        XCTAssertNotNil(actualValue)
        XCTAssertNotNil(actualValue?.activationDate)
        XCTAssertNotNil(actualValue?.expirationDate)
        XCTAssertEqual(actualValue?.noExecutionOn.count, 0)
        XCTAssertEqual(actualValue?.noExecutionStart, "")
        XCTAssertEqual(actualValue?.noExecutionEnd, "")
    }

    func testShouldEncodeToJSON() {
        let payload = self.payload(for: "policy_date_time_limitations", subfolder: subfolder)!

        let actualValue = PolicyDateTimeLimitations(json: payload)
        let encodedObject = actualValue?.toJSON()

        XCTAssertNotNil(encodedObject)
        XCTAssertEqual(encodedObject?.count, 9)

        XCTAssertNotNil(encodedObject?[PolicyDateTimeLimitations.CodingKeys.activationDate.rawValue])
        XCTAssertNotNil(encodedObject?[PolicyDateTimeLimitations.CodingKeys.activationDate.rawValue + PreciseDate.EpochKey])
        XCTAssertNotNil(encodedObject?[PolicyDateTimeLimitations.CodingKeys.activationDate.rawValue + PreciseDate.UTCKey])

        XCTAssertNotNil(encodedObject?[PolicyDateTimeLimitations.CodingKeys.expirationDate.rawValue])
        XCTAssertNotNil(encodedObject?[PolicyDateTimeLimitations.CodingKeys.expirationDate.rawValue + PreciseDate.EpochKey])
        XCTAssertNotNil(encodedObject?[PolicyDateTimeLimitations.CodingKeys.expirationDate.rawValue + PreciseDate.UTCKey])

        XCTAssertNotNil(encodedObject?[PolicyDateTimeLimitations.CodingKeys.noExecuteOn.rawValue])
        let noExecuteOn = encodedObject?[PolicyDateTimeLimitations.CodingKeys.noExecuteOn.rawValue] as! [String: String]
        XCTAssertEqual(noExecuteOn.count, 1)
        XCTAssertNotNil(encodedObject?[PolicyDateTimeLimitations.CodingKeys.noExecuteStart.rawValue])
        XCTAssertNotNil(encodedObject?[PolicyDateTimeLimitations.CodingKeys.noExecuteEnd.rawValue])
    }

    func testShouldInitializeFromData() {
        let payload = self.payload(for: "policy_date_time_limitations", subfolder: subfolder)!

        let defaultActivationDate = PreciseDate(json: payload, node: PolicyDateTimeLimitations.CodingKeys.activationDate.rawValue)
        let defaultExpirationDate = PreciseDate(json: payload, node: PolicyDateTimeLimitations.CodingKeys.expirationDate.rawValue)

        let payloadData = self.payloadData(for: "policy_date_time_limitations", subfolder: subfolder)!

        do {
            let actualValue = try JSONDecoder().decode(PolicyDateTimeLimitations.self, from: payloadData)

            XCTAssertNotNil(actualValue)
            XCTAssertEqual(actualValue.activationDate?.date, defaultActivationDate?.date)
            XCTAssertEqual(actualValue.activationDate?.epoch, defaultActivationDate?.epoch)
            XCTAssertEqual(actualValue.activationDate?.dateUTC, defaultActivationDate?.dateUTC)
            XCTAssertEqual(actualValue.expirationDate?.date, defaultExpirationDate?.date)
            XCTAssertEqual(actualValue.expirationDate?.epoch, defaultExpirationDate?.epoch)
            XCTAssertEqual(actualValue.expirationDate?.dateUTC, defaultExpirationDate?.dateUTC)
            XCTAssertEqual(actualValue.noExecutionOn.count, defaultNoExecuteOn.count)
            XCTAssertEqual(actualValue.noExecutionOn["day"], "Sun")
            XCTAssertEqual(actualValue.noExecutionStart, defaultNoExecuteStart)
            XCTAssertEqual(actualValue.noExecutionEnd, defaultNoExecuteEnd)
        } catch {
            XCTFail("Failed to initialize from data")
        }
    }

    func testShouldEncodeToData() {
        let payload = self.payload(for: "policy_date_time_limitations", subfolder: subfolder)!

        let actualValue = PolicyDateTimeLimitations(json: payload)

        do {
            let encodedObject = try JSONEncoder().encode(actualValue)

            XCTAssertNotNil(encodedObject)
        } catch {
            XCTFail("Failed to encode to data")
        }
    }
}
