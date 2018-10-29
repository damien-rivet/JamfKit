//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

import XCTest

@testable import JamfKit

class BaseObjectTests: XCTestCase {

    // MARK: - Constants

    let subfolder = "BaseObject/"
    let defaultIdentifier: UInt = 12345
    let defaultName = "Test"

    // MARK: - Tests

    func testShouldInitializeFromJSON() {
        let payload = self.payload(for: "base_object_valid", subfolder: subfolder)!

        let actualValue = BaseObject(json: payload)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.identifier, defaultIdentifier)
        XCTAssertEqual(actualValue?.name, defaultName)
        XCTAssertEqual(actualValue?.description, "[BaseObject][\(defaultIdentifier) - \(defaultName)]")
    }

    func testShouldNotInitializeFromInvalidJSON() {
        let payload = self.payload(for: "base_object_invalid", subfolder: subfolder)!

        let actualValue = BaseObject(json: payload)

        XCTAssertNil(actualValue)
    }

    func testShouldEncodeToJSON() {
        let payload = self.payload(for: "base_object_valid", subfolder: subfolder)!

        let actualValue = BaseObject(json: payload)
        let encodedObject = actualValue?.toJSON()

        XCTAssertNotNil(encodedObject)
        XCTAssertEqual(encodedObject?.count, 2)
    }

}
