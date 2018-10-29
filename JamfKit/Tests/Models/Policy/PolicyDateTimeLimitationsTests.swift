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

        let defaultActivationDate = PreciseDate(json: payload, node: PolicyDateTimeLimitations.ActivationDateKey)
        let defaultExpirationDate = PreciseDate(json: payload, node: PolicyDateTimeLimitations.ExpirationDateKey)

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

        XCTAssertNotNil(encodedObject?[PolicyDateTimeLimitations.ActivationDateKey])
        XCTAssertNotNil(encodedObject?[PolicyDateTimeLimitations.ActivationDateKey + PreciseDate.EpochKey])
        XCTAssertNotNil(encodedObject?[PolicyDateTimeLimitations.ActivationDateKey + PreciseDate.UTCKey])

        XCTAssertNotNil(encodedObject?[PolicyDateTimeLimitations.ExpirationDateKey])
        XCTAssertNotNil(encodedObject?[PolicyDateTimeLimitations.ExpirationDateKey + PreciseDate.EpochKey])
        XCTAssertNotNil(encodedObject?[PolicyDateTimeLimitations.ExpirationDateKey + PreciseDate.UTCKey])

        XCTAssertNotNil(encodedObject?[PolicyDateTimeLimitations.NoExecuteOnKey])
        let noExecuteOn = encodedObject?[PolicyDateTimeLimitations.NoExecuteOnKey] as! [String: String]
        XCTAssertEqual(noExecuteOn.count, 1)
        XCTAssertNotNil(encodedObject?[PolicyDateTimeLimitations.NoExecuteStartKey])
        XCTAssertNotNil(encodedObject?[PolicyDateTimeLimitations.NoExecuteEndKey])
    }
}
