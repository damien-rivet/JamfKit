//
//  UserTests.swift
//  JAMFKit
//
//  Created by Damien Rivet on 02.11.17.
//  Copyright © 2017 JAMFKit. All rights reserved.
//

import XCTest

@testable import JAMFKit

class UserTests: XCTestCase {

    // MARK: - Constants

    let defaultIdentifier: UInt = 12345
    let defaultName = "JDoe"
    let defaultFullName = "John Doe"
    let defaultEmail = "john.doe@doecorp.com"
    let defaultEmailAddress = "john.doe@doecorp.com"
    let defaultPhoneNumber = "123-444-5678"
    let defaultPosition = "Unknowns"
    let defaultEnableCustomPhotoURL = true
    let defaultCustomPhotoURL = "string"

    // MARK: - Tests

    func testShouldInitializeFromJSON() {
        let payload = self.payload(for: "user_valid")!

        let user = User(json: payload)

        XCTAssertNotNil(user)
        XCTAssertEqual(user?.identifier, defaultIdentifier)
        XCTAssertEqual(user?.name, defaultName)
        XCTAssertEqual(user?.description, "[User][\(defaultIdentifier). \(defaultFullName)]")
        XCTAssertEqual(user?.fullName, defaultFullName)
        XCTAssertEqual(user?.email, defaultEmail)
        XCTAssertEqual(user?.emailAddress, defaultEmailAddress)
        XCTAssertEqual(user?.phoneNumber, defaultPhoneNumber)
        XCTAssertEqual(user?.position, defaultPosition)
        XCTAssertEqual(user?.enableCustomPhotoURL, defaultEnableCustomPhotoURL)
        XCTAssertEqual(user?.customPhotoURL, defaultCustomPhotoURL)
        XCTAssertEqual(user?.sites.count, 1)
    }

    func testShouldInitializeFromIncompleteJSON() {
        let payload = self.payload(for: "user_incomplete")!

        let user = User(json: payload)

        XCTAssertNotNil(user)
        XCTAssertEqual(user?.identifier, defaultIdentifier)
        XCTAssertEqual(user?.name, defaultName)
        XCTAssertEqual(user?.description, "[User][\(defaultIdentifier). ]")
        XCTAssertEqual(user?.fullName, "")
        XCTAssertEqual(user?.email, "")
        XCTAssertEqual(user?.emailAddress, "")
        XCTAssertEqual(user?.phoneNumber, "")
        XCTAssertEqual(user?.position, "")
        XCTAssertEqual(user?.enableCustomPhotoURL, false)
        XCTAssertEqual(user?.customPhotoURL, "")
        XCTAssertEqual(user?.sites.count, 0)
    }

    func testShouldInitializeFromJSONWithMultiples() {
        let payload = self.payload(for: "user_multiple")!

        let user = User(json: payload)

        XCTAssertNotNil(user)
        XCTAssertEqual(user?.identifier, defaultIdentifier)
        XCTAssertEqual(user?.name, defaultName)
        XCTAssertEqual(user?.description, "[User][\(defaultIdentifier). \(defaultFullName)]")
        XCTAssertEqual(user?.fullName, defaultFullName)
        XCTAssertEqual(user?.email, defaultEmail)
        XCTAssertEqual(user?.emailAddress, defaultEmailAddress)
        XCTAssertEqual(user?.phoneNumber, defaultPhoneNumber)
        XCTAssertEqual(user?.position, defaultPosition)
        XCTAssertEqual(user?.enableCustomPhotoURL, defaultEnableCustomPhotoURL)
        XCTAssertEqual(user?.customPhotoURL, defaultCustomPhotoURL)
        XCTAssertEqual(user?.sites.count, 2)
    }

    func testShouldNotInitializeFromInvalidJSON() {
        let payload = self.payload(for: "user_invalid")!

        let user = User(json: payload)

        XCTAssertNil(user)
    }

    func testShouldEncode() {
        let payload = self.payload(for: "user_valid")!

        let user = User(json: payload)
        let encodedObject = user?.toJSON()

        XCTAssertNotNil(encodedObject)
        XCTAssertEqual(encodedObject?.count, 2)
    }
}
