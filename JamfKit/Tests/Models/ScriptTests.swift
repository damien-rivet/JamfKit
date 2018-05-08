//
//  ScriptTests.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

import XCTest

@testable import JamfKit

class ScriptTests: XCTestCase {

    // MARK: - Constants

    let subfolder = "Script/"
    let defaultIdentifier: UInt = 12345
    let defaultName = "Script"
    let defaultCategory = "None"
    let defaultFilename = "filename"
    let defaultInformation = "Script information"
    let defaultNotes = "Script to decrypt FV2 encrypted drives"
    let defaultPriority = "Before"
    let defaultParameters: [String: String] = [
        "parameter4": "string",
        "parameter5": "string",
        "parameter6": "string",
        "parameter7": "string",
        "parameter8": "string",
        "parameter9": "string",
        "parameter10": "string",
        "parameter11": "string"
    ]
    let defaultOsRequirements = "requirements"
    let defaultScriptContents = "echo \"Sample script\""
    let defaultScriptEncodedContents = "encoded"

    // MARK: - Tests

    func testShouldInstantiate() {
        let actualValue = Script(identifier: defaultIdentifier, name: defaultName)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.identifier, defaultIdentifier)
        XCTAssertEqual(actualValue?.name, defaultName)
    }

    func testShouldNotInstantiateWithInvalidParameters() {
        let actualValue = Script(identifier: defaultIdentifier, name: "")

        XCTAssertNil(actualValue)
    }

    func testShouldInitializeFromJSON() {
        let payload = self.payload(for: "script_valid", subfolder: subfolder)!

        let actualValue = Script(json: payload)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.identifier, defaultIdentifier)
        XCTAssertEqual(actualValue?.name, defaultName)
        XCTAssertEqual(actualValue?.description, "[Script][\(defaultIdentifier) - \(defaultName)]")
        XCTAssertEqual(actualValue?.category, defaultCategory)
        XCTAssertEqual(actualValue?.filename, defaultFilename)
        XCTAssertEqual(actualValue?.information, defaultInformation)
        XCTAssertEqual(actualValue?.notes, defaultNotes)
        XCTAssertEqual(actualValue?.priority, defaultPriority)
        XCTAssertEqual(actualValue?.parameters.count, defaultParameters.count)
        XCTAssertEqual(actualValue?.osRequirements, defaultOsRequirements)
        XCTAssertEqual(actualValue?.scriptContents, defaultScriptContents)
        XCTAssertEqual(actualValue?.scriptContentsEncoded, defaultScriptEncodedContents)
    }

    func testShouldInitializeFromIncompleteJSON() {
        let payload = self.payload(for: "script_incomplete", subfolder: subfolder)!

        let actualValue = Script(json: payload)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.identifier, defaultIdentifier)
        XCTAssertEqual(actualValue?.name, defaultName)
        XCTAssertEqual(actualValue?.description, "[Script][\(defaultIdentifier) - \(defaultName)]")
        XCTAssertEqual(actualValue?.category, "")
        XCTAssertEqual(actualValue?.filename, "")
        XCTAssertEqual(actualValue?.information, "")
        XCTAssertEqual(actualValue?.notes, "")
        XCTAssertEqual(actualValue?.priority, "")
        XCTAssertEqual(actualValue?.parameters.count, 0)
        XCTAssertEqual(actualValue?.osRequirements, "")
        XCTAssertEqual(actualValue?.scriptContents, "")
        XCTAssertEqual(actualValue?.scriptContentsEncoded, "")
    }

    func testShouldNotInitializeFromInvalidJSON() {
        let payload = self.payload(for: "script_invalid", subfolder: subfolder)!

        let actualValue = Script(json: payload)

        XCTAssertNil(actualValue)
    }

    func testShouldEncodeToJSON() {
        let payload = self.payload(for: "script_valid", subfolder: subfolder)!

        let actualValue = Script(json: payload)
        let encodedObject = actualValue?.toJSON()

        XCTAssertNotNil(encodedObject)
        XCTAssertEqual(encodedObject?.count, 11)

        XCTAssertNotNil(encodedObject?[BaseObject.IdentifierKey])
        XCTAssertNotNil(encodedObject?[BaseObject.NameKey])
        XCTAssertNotNil(encodedObject?[Script.CodingKeys.category.rawValue])
        XCTAssertNotNil(encodedObject?[Script.CodingKeys.filename.rawValue])
        XCTAssertNotNil(encodedObject?[Script.CodingKeys.info.rawValue])
        XCTAssertNotNil(encodedObject?[Script.CodingKeys.notes.rawValue])
        XCTAssertNotNil(encodedObject?[Script.CodingKeys.priority.rawValue])
        XCTAssertNotNil(encodedObject?[Script.CodingKeys.parameters.rawValue])
        XCTAssertNotNil(encodedObject?[Script.CodingKeys.osRequirements.rawValue])
        XCTAssertNotNil(encodedObject?[Script.CodingKeys.scriptContents.rawValue])
        XCTAssertNotNil(encodedObject?[Script.CodingKeys.scriptContentsEncoded.rawValue])
    }

    func testShouldInitializeFromData() {
        let payload = self.payloadData(for: "script_valid", subfolder: subfolder)!

        do {
            let actualValue = try JSONDecoder().decode(Script.self, from: payload)

            XCTAssertNotNil(actualValue)
            XCTAssertEqual(actualValue.identifier, defaultIdentifier)
            XCTAssertEqual(actualValue.name, defaultName)
            XCTAssertEqual(actualValue.description, "[Script][\(defaultIdentifier) - \(defaultName)]")
            XCTAssertEqual(actualValue.category, defaultCategory)
            XCTAssertEqual(actualValue.filename, defaultFilename)
            XCTAssertEqual(actualValue.information, defaultInformation)
            XCTAssertEqual(actualValue.notes, defaultNotes)
            XCTAssertEqual(actualValue.priority, defaultPriority)
            XCTAssertEqual(actualValue.parameters.count, defaultParameters.count)
            XCTAssertEqual(actualValue.osRequirements, defaultOsRequirements)
            XCTAssertEqual(actualValue.scriptContents, defaultScriptContents)
            XCTAssertEqual(actualValue.scriptContentsEncoded, defaultScriptEncodedContents)
        } catch {
            XCTFail("Failed to initialize from data")
        }
    }

    func testShouldEncodeToData() {
        let payload = self.payload(for: "script_valid", subfolder: subfolder)!

        let actualValue = Script(json: payload)

        do {
            let encodedObject = try JSONEncoder().encode(actualValue)

            XCTAssertNotNil(encodedObject)
        } catch {
            XCTFail("Failed to encode to data")
        }
    }
}
