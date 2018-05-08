//
//  ComputerConfigurationManagementTests.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

import XCTest

@testable import JamfKit

class ComputerConfigurationManagementTests: XCTestCase {

    // MARK: - Constants

    let subfolder = "ComputerConfiguration/"
    let defaultUsername = "administrator"
    let defaultPassword = "password"
    let defaultShouldCreateAccount = true
    let defaultShouldHideAccount = true
    let defaultIsSSHAllowedOnlyForManagement = true

    // MARK: - Tests

    func testShouldInitializeFromJSON() {
        let payload = self.payload(for: "computer_configuration_management", subfolder: subfolder)!

        let actualValue = ComputerConfigurationManagement(json: payload)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.username, defaultUsername)
        XCTAssertEqual(actualValue?.password, defaultPassword)
        XCTAssertEqual(actualValue?.shouldCreateAccount, defaultShouldCreateAccount)
        XCTAssertEqual(actualValue?.shouldHideAccount, defaultShouldHideAccount)
        XCTAssertEqual(actualValue?.isSSHAllowedForManagementOnly, defaultIsSSHAllowedOnlyForManagement)
    }

    func testShouldInitializeFromEmptyJSON() {
        let actualValue = ComputerConfigurationManagement(json: [String: Any]())

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.username, "")
        XCTAssertEqual(actualValue?.password, "")
        XCTAssertEqual(actualValue?.shouldCreateAccount, false)
        XCTAssertEqual(actualValue?.shouldHideAccount, false)
        XCTAssertEqual(actualValue?.isSSHAllowedForManagementOnly, false)
    }

    func testShouldEncodeToJSON() {
        let payload = self.payload(for: "computer_configuration_management", subfolder: subfolder)!

        let actualValue = ComputerConfigurationManagement(json: payload)
        let encodedObject = actualValue?.toJSON()

        XCTAssertNotNil(encodedObject)
        XCTAssertEqual(encodedObject?.count, 5)
        XCTAssertNotNil(encodedObject?[ComputerConfigurationManagement.CodingKeys.username.rawValue])
        XCTAssertNotNil(encodedObject?[ComputerConfigurationManagement.CodingKeys.password.rawValue])
        XCTAssertNotNil(encodedObject?[ComputerConfigurationManagement.CodingKeys.createAccount.rawValue])
        XCTAssertNotNil(encodedObject?[ComputerConfigurationManagement.CodingKeys.hideAccount.rawValue])
        XCTAssertNotNil(encodedObject?[ComputerConfigurationManagement.CodingKeys.allowSshForManagementOnly.rawValue])
    }

    func testShouldInitializeFromData() {
        let payload = self.payloadData(for: "computer_configuration_management", subfolder: subfolder)!

        do {
            let actualValue = try JSONDecoder().decode(ComputerConfigurationManagement.self, from: payload)

            XCTAssertNotNil(actualValue)
            XCTAssertEqual(actualValue.username, defaultUsername)
            XCTAssertEqual(actualValue.password, defaultPassword)
            XCTAssertEqual(actualValue.shouldCreateAccount, defaultShouldCreateAccount)
            XCTAssertEqual(actualValue.shouldHideAccount, defaultShouldHideAccount)
            XCTAssertEqual(actualValue.isSSHAllowedForManagementOnly, defaultIsSSHAllowedOnlyForManagement)
        } catch {
            XCTFail("Failed to initialize from data")
        }
    }

    func testShouldEncodeToData() {
        let payload = self.payload(for: "computer_configuration_management", subfolder: subfolder)!

        let actualValue = ComputerConfigurationManagement(json: payload)

        do {
            let encodedObject = try JSONEncoder().encode(actualValue)

            XCTAssertNotNil(encodedObject)
        } catch {
            XCTFail("Failed to encode to data")
        }
    }
}
