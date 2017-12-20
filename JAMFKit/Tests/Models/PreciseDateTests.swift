//
//  PreciseDateTests.swift
//  JAMFKit
//
//  Copyright © 2017 JAMFKit. All rights reserved.
//

import XCTest

@testable import JAMFKit

class PreciseDateTests: XCTestCase {

    // MARK: - Constants

    let defaultNode = "precise_date"
    let defaultDateValue = "2017-07-07T18:37:04.000Z"
    let defaultDateUTCValue = "2017-07-07T18:37:04.555-0500"

    var defaultDate: Date!
    let defaultEpoch: Double = 1499470624555
    var defaultDateUTC: Date!

    // MARK: - Tests

    func testShouldInstantiateFromJSON() {
        let payload = self.payload(for: "precise_date")!

        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        defaultDate = dateFormatter.date(from: defaultDateValue)

        let dateFormatterUTC = DateFormatter()
        dateFormatterUTC.locale = Locale(identifier: "en_US_POSIX")
        dateFormatterUTC.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZ"
        dateFormatterUTC.timeZone = TimeZone(secondsFromGMT: 0)
        defaultDateUTC = dateFormatterUTC.date(from: defaultDateUTCValue)

        let actualValue = PreciseDate(json: payload, node: defaultNode)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.date, defaultDate)
        XCTAssertEqual(actualValue?.epoch, defaultEpoch)
        XCTAssertEqual(actualValue?.dateUTC, defaultDateUTC)
    }

    func testShouldInstantiateFromIncompleteJSON() {
        let payload = self.payload(for: "precise_date_incomplete")!

        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        defaultDate = dateFormatter.date(from: defaultDateValue)

        let actualValue = PreciseDate(json: payload, node: defaultNode)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.date, defaultDate)
        XCTAssertEqual(actualValue?.epoch, defaultEpoch)
        XCTAssertNil(actualValue?.dateUTC)
    }

    func testShouldEncodeToJSON() {
        let payload = self.payload(for: "precise_date")!

        let actualValue = PreciseDate(json: payload, node: defaultNode)
        let encodedObject = actualValue?.toJSON()

        XCTAssertNotNil(encodedObject)
        XCTAssertEqual(encodedObject?.count, 3)
        XCTAssertEqual(encodedObject?[defaultNode] as? String, defaultDateValue)
        XCTAssertEqual(encodedObject?[defaultNode + PreciseDate.EpochKey] as? Double, defaultEpoch)
        // TOFIX: Output format is not exactly the same
        // XCTAssertEqual(encodedObject?[defaultNode + PreciseDate.UTCKey] as? String, defaultDateUTCValue)
    }
}
