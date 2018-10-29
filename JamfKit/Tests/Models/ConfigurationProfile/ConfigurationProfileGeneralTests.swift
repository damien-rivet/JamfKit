//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

import XCTest

@testable import JamfKit

class ConfigurationProfileGeneralTests: XCTestCase {

    // MARK: - Constants

    let subfolder = "ConfigurationProfileGeneral/"
    let defaultIdentifier: UInt = 12345
    let defaultName = "Configuration Profile"
    let defaultDescription = "Description"
    let defaultUuid = "88F8C1DB-D92A-4D10-95FB-CE7EDE82B93E"
    let defaultRedeployOnUpdate = "Newly Assigned"
    let defaultPayloads = "Payloads"


    // MARK: - Tests

    func testShouldInstantiate() {
        let actualValue = ConfigurationProfileGeneral(identifier: defaultIdentifier, name: defaultName)

        XCTAssertNotNil(actualValue)
        XCTAssertNil(actualValue?.site)
        XCTAssertNil(actualValue?.category)
        XCTAssertEqual(actualValue?.uuid, "")
        XCTAssertEqual(actualValue?.redeployOnUpdate, "")
        XCTAssertEqual(actualValue?.payloads, "")
    }

    func testShouldNotInstantiateWithInvalidParameters() {
        let actualValue = ConfigurationProfileGeneral(identifier: defaultIdentifier, name: "")

        XCTAssertNil(actualValue)
    }

    func testShouldInitializeFromJSON() {
        let payload = self.payload(for: "configuration_profile_general_valid", subfolder: subfolder)!

        let actualValue = ConfigurationProfileGeneral(json: payload)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.desc, defaultDescription)
        XCTAssertNotNil(actualValue?.site)
        XCTAssertNotNil(actualValue?.category)
        XCTAssertEqual(actualValue?.uuid, defaultUuid)
        XCTAssertEqual(actualValue?.redeployOnUpdate, defaultRedeployOnUpdate)
        XCTAssertEqual(actualValue?.payloads, defaultPayloads)
    }

    func testShouldNotInitializeFromInvalidJSON() {
        let payload = self.payload(for: "configuration_profile_general_invalid", subfolder: subfolder)!

        let actualValue = ConfigurationProfileGeneral(json: payload)

        XCTAssertNil(actualValue)
    }

    func testShouldNotInitializeFromEmptyJSON() {
        let actualValue = ConfigurationProfileGeneral(json: [String: Any]())

        XCTAssertNil(actualValue)
    }

    func testShouldEncodeToJSON() {
        let payload = self.payload(for: "configuration_profile_general_valid", subfolder: subfolder)!

        let actualValue = ConfigurationProfileGeneral(json: payload)
        let encodedObject = actualValue?.toJSON()

        XCTAssertNotNil(encodedObject)
        XCTAssertEqual(encodedObject?.count, 8)
        XCTAssertNotNil(encodedObject?[BaseObject.CodingKeys.identifier.rawValue])
        XCTAssertNotNil(encodedObject?[BaseObject.CodingKeys.name.rawValue])
        XCTAssertNotNil(encodedObject?[ConfigurationProfileGeneral.DescriptionKey])
        XCTAssertNotNil(encodedObject?[ConfigurationProfileGeneral.SiteKey])
        XCTAssertNotNil(encodedObject?[ConfigurationProfileGeneral.CategoryKey])
        XCTAssertNotNil(encodedObject?[ConfigurationProfileGeneral.UuidKey])
        XCTAssertNotNil(encodedObject?[ConfigurationProfileGeneral.RedeployOnUpdateKey])
        XCTAssertNotNil(encodedObject?[ConfigurationProfileGeneral.PayloadsKey])
    }
}
