//
//  ComputerConfigurationManagementTests.swift
//  JamfKit
//
//  Copyright © 2018 JamfKit. All rights reserved.
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
        XCTAssertNotNil(encodedObject?[ComputerConfigurationManagement.UsernameKey])
        XCTAssertNotNil(encodedObject?[ComputerConfigurationManagement.PasswordKey])
        XCTAssertNotNil(encodedObject?[ComputerConfigurationManagement.CreateAccountKey])
        XCTAssertNotNil(encodedObject?[ComputerConfigurationManagement.HideAccountKey])
        XCTAssertNotNil(encodedObject?[ComputerConfigurationManagement.AllowSSHForManagementOnlyKey])
    }
}
