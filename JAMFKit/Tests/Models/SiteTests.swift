//
//  SiteTests.swift
//  JAMFKit
//
//  Created by Damien Rivet on 02.11.17.
//  Copyright © 2017 JAMFKit. All rights reserved.
//

import XCTest

@testable import JAMFKit

class SiteTests: XCTestCase {

    // MARK: - Constants

    let defaultIdentifier: UInt = 12345
    let defaultName = "Nowhere"

    // MARK: - Tests

    func testShouldInitializeFromJSON() {
        let payload = self.payload(for: "site_valid")!

        let site = Site(json: payload)

        XCTAssertNotNil(site)
        XCTAssertEqual(site?.identifier, defaultIdentifier)
        XCTAssertEqual(site?.name, defaultName)
        XCTAssertEqual(site?.description, "[Site][\(defaultIdentifier). \(defaultName)]")
    }

    func testShouldNotInitializeFromInvalidJSON() {
        let payload = self.payload(for: "site_invalid")!

        let site = Site(json: payload)

        XCTAssertNil(site)
    }

    func testShouldEncode() {
        let payload = self.payload(for: "site_valid")!

        let site = Site(json: payload)
        let encodedObject = site?.toJSON()

        XCTAssertNotNil(encodedObject)
        XCTAssertEqual(encodedObject?.count, 2)
    }
}
