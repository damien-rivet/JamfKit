//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

import XCTest

@testable import JamfKit

class ComputerConfigurationProfileTests: XCTestCase {

    // MARK: - Constants

    let subfolder = "ComputerConfigurationProfile/"
    let defaultIdentifier: UInt = 12345
    let defaultName = "Corporate Wireless"

    // MARK: - Tests

    func testShouldInstantiate() {
        let actualValue = ComputerConfigurationProfile(identifier: defaultIdentifier, name: defaultName)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.general.identifier, defaultIdentifier)
        XCTAssertEqual(actualValue?.general.name, defaultName)
    }

    func testShouldNotInstantiateWithInvalidParameters() {
        let actualValue = ComputerConfigurationProfile(identifier: defaultIdentifier, name: "")

        XCTAssertNil(actualValue)
    }

    func testShouldInitializeFromJSON() {
        let payload = self.payload(for: "computer_configuration_profile_valid", subfolder: subfolder)!

        let actualValue = ComputerConfigurationProfile(json: payload)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.description, "[ComputerConfigurationProfile][\(defaultIdentifier) - \(defaultName)]")
        XCTAssertEqual(actualValue?.general.identifier, defaultIdentifier)
        XCTAssertEqual(actualValue?.general.name, defaultName)
    }

    func testShouldNotInitializeFromInvalidJSON() {
        let payload = self.payload(for: "computer_configuration_profile_invalid", subfolder: subfolder)!

        let actualValue = ComputerConfigurationProfile(json: payload)

        XCTAssertNil(actualValue)
    }

    func testShouldEncodeToJSON() {
        let payload = self.payload(for: "computer_configuration_profile_valid", subfolder: subfolder)!

        let actualValue = ComputerConfigurationProfile(json: payload)
        let encodedObject = actualValue?.toJSON()

        XCTAssertNotNil(encodedObject)
        XCTAssertEqual(encodedObject?.count, 1)
        XCTAssertNotNil(encodedObject?[ComputerConfigurationProfile.GeneralKey])

        let generalNode = encodedObject?[ComputerConfigurationProfile.GeneralKey] as! [String: Any]
        XCTAssertNotNil(generalNode[BaseObject.CodingKeys.identifier.rawValue])
        XCTAssertNotNil(generalNode[BaseObject.CodingKeys.name.rawValue])
    }
}
