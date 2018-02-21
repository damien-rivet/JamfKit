//
//  HardwareGroupTests.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

import XCTest

@testable import JamfKit

class HardwareGroupTests: XCTestCase {
    
    // MARK: - Constants

    let subfolder = "ComputerGroup/"
    let defaultIdentifier: UInt = 12345
    let defaultName = "computers"
    let defaultIsSmart = true

    // MARK: - Tests

    func testShouldInstantiate() {
        let actualValue = HardwareGroup(identifier: defaultIdentifier, name: defaultName)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.identifier, defaultIdentifier)
        XCTAssertEqual(actualValue?.name, defaultName)
    }

    func testShouldNotInstantiateWithInvalidParameters() {
        let actualValue = HardwareGroup(identifier: defaultIdentifier, name: "")

        XCTAssertNil(actualValue)
    }
}
