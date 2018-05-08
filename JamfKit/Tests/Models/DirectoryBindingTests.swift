//
//  DirectoryBindingTests.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

import XCTest

@testable import JamfKit

class DirectoryBindingTests: XCTestCase {

    // MARK: - Constants

    let subfolder = "DirectoryBinding/"
    let defaultIdentifier: UInt = 12345
    let defaultName = "AD Binding"
    let defaultPriority: UInt = 1
    let defaultDomain = "ad.company.com"
    let defaultUsername = "AD\\Administrator"
    let defaultPassword = "password"
    let defaultComputerOrganisationalUnit = "CN=Computers,DC=ad,DC=company,DC=com"
    let defaultType = "Active Directory"

    // MARK: - Tests

    func testShouldInstantiate() {
        let actualValue = DirectoryBinding(identifier: defaultIdentifier, name: defaultName)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.identifier, defaultIdentifier)
        XCTAssertEqual(actualValue?.name, defaultName)
    }

    func testShouldNotInstantiateWithInvalidParameters() {
        let actualValue = DirectoryBinding(identifier: defaultIdentifier, name: "")

        XCTAssertNil(actualValue)
    }

    func testShouldInitializeFromJSON() {
        let payload = self.payload(for: "directory_binding_valid", subfolder: subfolder)!

        let actualValue = DirectoryBinding(json: payload)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.identifier, defaultIdentifier)
        XCTAssertEqual(actualValue?.name, defaultName)
        XCTAssertEqual(actualValue?.description, "[DirectoryBinding][\(defaultIdentifier) - \(defaultName)]")
        XCTAssertEqual(actualValue?.priority, defaultPriority)
        XCTAssertEqual(actualValue?.domain, defaultDomain)
        XCTAssertEqual(actualValue?.username, defaultUsername)
        XCTAssertEqual(actualValue?.password, defaultPassword)
        XCTAssertEqual(actualValue?.computerOrganisationalUnit, defaultComputerOrganisationalUnit)
        XCTAssertEqual(actualValue?.type, defaultType)
    }

    func testShouldInitializeFromIncompleteJSON() {
        let payload = self.payload(for: "directory_binding_incomplete", subfolder: subfolder)!

        let actualValue = DirectoryBinding(json: payload)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.identifier, defaultIdentifier)
        XCTAssertEqual(actualValue?.name, defaultName)
        XCTAssertEqual(actualValue?.description, "[DirectoryBinding][\(defaultIdentifier) - \(defaultName)]")
        XCTAssertEqual(actualValue?.priority, 0)
        XCTAssertEqual(actualValue?.domain, "")
        XCTAssertEqual(actualValue?.username, "")
        XCTAssertEqual(actualValue?.password, "")
        XCTAssertEqual(actualValue?.computerOrganisationalUnit, "")
        XCTAssertEqual(actualValue?.type, "")
    }

    func testShouldNotInitializeFromInvalidJSON() {
        let payload = self.payload(for: "directory_binding_invalid", subfolder: subfolder)!

        let actualValue = DirectoryBinding(json: payload)

        XCTAssertNil(actualValue)
    }

    func testShouldEncodeToJSON() {
        let payload = self.payload(for: "directory_binding_valid", subfolder: subfolder)!

        let actualValue = DirectoryBinding(json: payload)
        let encodedObject = actualValue?.toJSON()

        XCTAssertNotNil(encodedObject)
        XCTAssertEqual(encodedObject?.count, 8)

        XCTAssertNotNil(encodedObject?[BaseObject.IdentifierKey])
        XCTAssertNotNil(encodedObject?[BaseObject.NameKey])
        XCTAssertNotNil(encodedObject?[DirectoryBinding.CodingKeys.priority.rawValue])
        XCTAssertNotNil(encodedObject?[DirectoryBinding.CodingKeys.domain.rawValue])
        XCTAssertNotNil(encodedObject?[DirectoryBinding.CodingKeys.username.rawValue])
        XCTAssertNotNil(encodedObject?[DirectoryBinding.CodingKeys.password.rawValue])
        XCTAssertNotNil(encodedObject?[DirectoryBinding.CodingKeys.computerOrganisationalUnit.rawValue])
        XCTAssertNotNil(encodedObject?[DirectoryBinding.CodingKeys.type.rawValue])
    }

    func testShouldInitializeFromData() {
        let payload = self.payloadData(for: "directory_binding_valid", subfolder: subfolder)!

        do {
            let actualValue = try JSONDecoder().decode(DirectoryBinding.self, from: payload)

            XCTAssertNotNil(actualValue)
            XCTAssertEqual(actualValue.identifier, defaultIdentifier)
            XCTAssertEqual(actualValue.name, defaultName)
            XCTAssertEqual(actualValue.description, "[DirectoryBinding][\(defaultIdentifier) - \(defaultName)]")
            XCTAssertEqual(actualValue.priority, defaultPriority)
            XCTAssertEqual(actualValue.domain, defaultDomain)
            XCTAssertEqual(actualValue.username, defaultUsername)
            XCTAssertEqual(actualValue.password, defaultPassword)
            XCTAssertEqual(actualValue.computerOrganisationalUnit, defaultComputerOrganisationalUnit)
            XCTAssertEqual(actualValue.type, defaultType)
        } catch {
            XCTFail("Failed to initialize from data")
        }
    }

    func testShouldEncodeToData() {
        let payload = self.payload(for: "directory_binding_valid", subfolder: subfolder)!

        let actualValue = DirectoryBinding(json: payload)

        do {
            let encodedObject = try JSONEncoder().encode(actualValue)

            XCTAssertNotNil(encodedObject)
        } catch {
            XCTFail("Failed to encode to data")
        }
    }
}
