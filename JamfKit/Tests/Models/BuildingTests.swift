//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

import XCTest

@testable import JamfKit

class BuildingTests: XCTestCase {

    // MARK: - Constants

    let subfolder = "Building/"
    let defaultIdentifier: UInt = 12345
    let defaultName = "Building"
    let defaultStreetAddress1 = "Doe Street"
    let defaultStreetAddress2 = ""
    let defaultCity = "Doeville"
    let defaultStateProvince = "Doe county"
    let defaultZipPostalCode = "012345"
    let defaultCountry = "Doeland"

    // MARK: - Tests

    func testShouldInstantiate() {
        let actualValue = Building(identifier: defaultIdentifier, name: defaultName)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.identifier, defaultIdentifier)
        XCTAssertEqual(actualValue?.name, defaultName)
    }

    func testShouldNotInstantiateWithInvalidParameters() {
        let actualValue = Building(identifier: defaultIdentifier, name: "")

        XCTAssertNil(actualValue)
    }

    func testShouldInitializeFromJSON() {
        let payload = self.payload(for: "building_valid", subfolder: subfolder)!

        let actualValue = Building(json: payload)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.identifier, defaultIdentifier)
        XCTAssertEqual(actualValue?.name, defaultName)
        XCTAssertEqual(actualValue?.description, "[Building][\(defaultIdentifier) - \(defaultName)]")
        XCTAssertEqual(actualValue?.streetAddress1, defaultStreetAddress1)
        XCTAssertEqual(actualValue?.streetAddress2, defaultStreetAddress2)
        XCTAssertEqual(actualValue?.city, defaultCity)
        XCTAssertEqual(actualValue?.stateProvince, defaultStateProvince)
        XCTAssertEqual(actualValue?.zipPostalCode, defaultZipPostalCode)
        XCTAssertEqual(actualValue?.country, defaultCountry)
    }

    func testShouldNotInitializeFromInvalidJSON() {
        let payload = self.payload(for: "building_invalid", subfolder: subfolder)!

        let actualValue = Building(json: payload)

        XCTAssertNil(actualValue)
    }

    func testShouldEncodeToJSON() {
        let payload = self.payload(for: "building_valid", subfolder: subfolder)!

        let actualValue = Building(json: payload)
        let encodedObject = actualValue?.toJSON()

        XCTAssertNotNil(encodedObject)
        XCTAssertEqual(encodedObject?.count, 8)
    }
}
