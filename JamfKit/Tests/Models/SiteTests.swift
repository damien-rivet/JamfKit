//
//  SiteTests.swift
//  JamfKit
//
//  Copyright © 2017 JamfKit. All rights reserved.
//

import XCTest

@testable import JamfKit

class SiteTests: XCTestCase {

    // MARK: - Constants

    let defaultIdentifier: UInt = 12345
    let defaultName = "Nowhere"

    // MARK: - Tests

    func testShouldInitializeFromJSON() {
        let payload = self.payload(for: "site_valid")!

        let actualValue = Site(json: payload)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.identifier, defaultIdentifier)
        XCTAssertEqual(actualValue?.name, defaultName)
        XCTAssertEqual(actualValue?.description, "[Site][\(defaultIdentifier). \(defaultName)]")
    }

    func testShouldNotInitializeFromInvalidJSON() {
        let payload = self.payload(for: "site_invalid")!

        let actualValue = Site(json: payload)

        XCTAssertNil(actualValue)
    }

    func testShouldEncodeToJSON() {
        let payload = self.payload(for: "site_valid")!

        let actualValue = Site(json: payload)
        let encodedObject = actualValue?.toJSON()

        XCTAssertNotNil(encodedObject)
        XCTAssertEqual(encodedObject?.count, 2)
    }
}
