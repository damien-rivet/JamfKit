//
//  ComputerTests.swift
//  JamfKit
//
//  Copyright © 2018 JamfKit. All rights reserved.
//

import XCTest

@testable import JamfKit

class ComputerTests: XCTestCase {

    // MARK: - Constants

    let subfolder = "Computer/"

    // MARK: - Tests

    func testShouldInitializeFromJSON() {
        let payload = self.payload(for: "computer", subfolder: subfolder)!

        let actualValue = Computer(json: payload)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.description, "[Computer][12345 - computer]")
        XCTAssertNotNil(actualValue?.general)
        XCTAssertNotNil(actualValue?.location)
        XCTAssertNotNil(actualValue?.purchasing)
    }

    func testShouldInitializeFromIncompleteJSON() {
        let payload = self.payload(for: "computer_incomplete", subfolder: subfolder)!

        let actualValue = Computer(json: payload)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.description, "[Computer][12345 - computer]")
        XCTAssertNotNil(actualValue?.general)
        XCTAssertNil(actualValue?.location)
        XCTAssertNil(actualValue?.purchasing)
    }

    func testShouldNotInitializeFromEmptyJSON() {
        let actualValue = Computer(json: [String: Any]())

        XCTAssertNil(actualValue)
    }

    func testShouldEncodeToJSON() {
        let payload = self.payload(for: "computer", subfolder: subfolder)!

        let actualValue = Computer(json: payload)
        let encodedObject = actualValue?.toJSON()

        XCTAssertNotNil(encodedObject)
        XCTAssertEqual(encodedObject?.count, 3)
        XCTAssertNotNil(encodedObject?[Computer.GeneralKey])
        XCTAssertNotNil(encodedObject?[Computer.LocationKey])
        XCTAssertNotNil(encodedObject?[Computer.PurchasingKey])
    }
}
