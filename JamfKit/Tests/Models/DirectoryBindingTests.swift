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

        XCTAssertNotNil(encodedObject?[BaseObject.CodingKeys.identifier.rawValue])
        XCTAssertNotNil(encodedObject?[BaseObject.CodingKeys.name.rawValue])
        XCTAssertNotNil(encodedObject?[DirectoryBinding.PriorityKey])
        XCTAssertNotNil(encodedObject?[DirectoryBinding.DomainKey])
        XCTAssertNotNil(encodedObject?[DirectoryBinding.UsernameKey])
        XCTAssertNotNil(encodedObject?[DirectoryBinding.PasswordKey])
        XCTAssertNotNil(encodedObject?[DirectoryBinding.ComputerOrganisationalUnitKey])
        XCTAssertNotNil(encodedObject?[DirectoryBinding.TypeKey])
    }
}
