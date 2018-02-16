//
//  UserTests.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

import XCTest

@testable import JamfKit

class UserTests: XCTestCase {

    // MARK: - Constants

    let subfolder = "User/"
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
        let payload = self.payload(for: "user_valid", subfolder: subfolder)!

        let actualValue = User(json: payload)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.identifier, defaultIdentifier)
        XCTAssertEqual(actualValue?.name, defaultName)
        XCTAssertEqual(actualValue?.description, "[User][\(defaultIdentifier) - \(defaultFullName)]")
        XCTAssertEqual(actualValue?.fullName, defaultFullName)
        XCTAssertEqual(actualValue?.email, defaultEmail)
        XCTAssertEqual(actualValue?.emailAddress, defaultEmailAddress)
        XCTAssertEqual(actualValue?.phoneNumber, defaultPhoneNumber)
        XCTAssertEqual(actualValue?.position, defaultPosition)
        XCTAssertEqual(actualValue?.enableCustomPhotoURL, defaultEnableCustomPhotoURL)
        XCTAssertEqual(actualValue?.customPhotoURL, defaultCustomPhotoURL)
        XCTAssertEqual(actualValue?.sites.count, 1)
    }

    func testShouldInitializeFromIncompleteJSON() {
        let payload = self.payload(for: "user_incomplete", subfolder: subfolder)!

        let actualValue = User(json: payload)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.identifier, defaultIdentifier)
        XCTAssertEqual(actualValue?.name, defaultName)
        XCTAssertEqual(actualValue?.description, "[User][\(defaultIdentifier) - ]")
        XCTAssertEqual(actualValue?.fullName, "")
        XCTAssertEqual(actualValue?.email, "")
        XCTAssertEqual(actualValue?.emailAddress, "")
        XCTAssertEqual(actualValue?.phoneNumber, "")
        XCTAssertEqual(actualValue?.position, "")
        XCTAssertEqual(actualValue?.enableCustomPhotoURL, false)
        XCTAssertEqual(actualValue?.customPhotoURL, "")
        XCTAssertEqual(actualValue?.sites.count, 0)
    }

    func testShouldInitializeFromJSONWithMultiples() {
        let payload = self.payload(for: "user_multiple", subfolder: subfolder)!

        let actualValue = User(json: payload)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.identifier, defaultIdentifier)
        XCTAssertEqual(actualValue?.name, defaultName)
        XCTAssertEqual(actualValue?.description, "[User][\(defaultIdentifier) - \(defaultFullName)]")
        XCTAssertEqual(actualValue?.fullName, defaultFullName)
        XCTAssertEqual(actualValue?.email, defaultEmail)
        XCTAssertEqual(actualValue?.emailAddress, defaultEmailAddress)
        XCTAssertEqual(actualValue?.phoneNumber, defaultPhoneNumber)
        XCTAssertEqual(actualValue?.position, defaultPosition)
        XCTAssertEqual(actualValue?.enableCustomPhotoURL, defaultEnableCustomPhotoURL)
        XCTAssertEqual(actualValue?.customPhotoURL, defaultCustomPhotoURL)
        XCTAssertEqual(actualValue?.sites.count, 2)
    }

    func testShouldNotInitializeFromInvalidJSON() {
        let payload = self.payload(for: "user_invalid", subfolder: subfolder)!

        let actualValue = User(json: payload)

        XCTAssertNil(actualValue)
    }

    func testShouldEncodeToJSON() {
        let payload = self.payload(for: "user_valid", subfolder: subfolder)!

        let actualValue = User(json: payload)
        let encodedObject = actualValue?.toJSON()

        XCTAssertNotNil(encodedObject)
        XCTAssertEqual(encodedObject?.count, 10)
        
        XCTAssertNotNil(encodedObject?[BaseObject.CodingKeys.identifier.rawValue])
        XCTAssertNotNil(encodedObject?[BaseObject.CodingKeys.name.rawValue])
        XCTAssertNotNil(encodedObject?[User.FullNameKey])
        XCTAssertNotNil(encodedObject?[User.EmailKey])
        XCTAssertNotNil(encodedObject?[User.EmailAddressKey])
        XCTAssertNotNil(encodedObject?[User.PhoneNumberKey])
        XCTAssertNotNil(encodedObject?[User.PositionKey])
        XCTAssertNotNil(encodedObject?[User.EnableCustomPhotoURLKey])
        XCTAssertNotNil(encodedObject?[User.CustomPhotoURLKey])
        XCTAssertNotNil(encodedObject?[User.SitesKey])
    }
}
