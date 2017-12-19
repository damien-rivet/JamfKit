//
//  HardwareTests.swift
//  JAMFKit
//
//  Created by Damien Rivet on 08.11.17.
//  Copyright © 2017 JAMFKit. All rights reserved.
//

import XCTest

@testable import JAMFKit

class HardwareTests: XCTestCase {

    // MARK: - Tests

    func testShouldInitializeFromJSON() {
        let payload = self.payload(for: "hardware")!

        let actualValue = Hardware(json: payload)

        XCTAssertNotNil(actualValue)
        XCTAssertNotNil(actualValue?.general)
        XCTAssertNotNil(actualValue?.location)
        XCTAssertNotNil(actualValue?.purchasing)
    }

    func testShouldEncodeToJSON() {
        let payload = self.payload(for: "hardware")!

        let actualValue = Hardware(json: payload)
        let encodedObject = actualValue?.toJSON()

        XCTAssertNotNil(encodedObject)
        XCTAssertEqual(encodedObject?.count, 3)
        XCTAssertNotNil(encodedObject?[Hardware.GeneralKey])
        XCTAssertNotNil(encodedObject?[Hardware.LocationKey])
        XCTAssertNotNil(encodedObject?[Hardware.PurchasingKey])
    }
}
