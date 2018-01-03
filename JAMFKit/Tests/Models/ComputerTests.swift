//
//  ComputerTests.swift
//  JAMFKit
//
//  Copyright © 2018 JAMFKit. All rights reserved.
//

import XCTest

@testable import JAMFKit

class ComputerTests: XCTestCase {

    // MARK: - Tests

    func testShouldInitializeFromJSON() {
        let payload = self.payload(for: "computer")!

        let actualValue = Computer(json: payload)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.description, "[Computer][12345. computer]")
        XCTAssertNotNil(actualValue?.general)
        XCTAssertNotNil(actualValue?.location)
        XCTAssertNotNil(actualValue?.purchasing)
    }

    func testShouldInitializeFromEmptyJSON() {
        let actualValue = Computer(json: [String: Any]())

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.description, "[Computer]")
        XCTAssertNil(actualValue?.general)
        XCTAssertNotNil(actualValue?.location)
        XCTAssertNotNil(actualValue?.purchasing)
    }

    func testShouldEncodeToJSON() {
        let payload = self.payload(for: "computer")!

        let actualValue = Computer(json: payload)
        let encodedObject = actualValue?.toJSON()

        XCTAssertNotNil(encodedObject)
        XCTAssertEqual(encodedObject?.count, 3)
        XCTAssertNotNil(encodedObject?[Computer.GeneralKey])
        XCTAssertNotNil(encodedObject?[Computer.LocationKey])
        XCTAssertNotNil(encodedObject?[Computer.PurchasingKey])
    }
}
