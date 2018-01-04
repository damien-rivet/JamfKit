//
//  ScriptTests.swift
//  JAMFKit
//
//  Copyright © 2018 JAMFKit. All rights reserved.
//

import XCTest

@testable import JAMFKit

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

    func testShouldInitializeFromJSON() {
        let payload = self.payload(for: "script_valid", subfolder: subfolder)!

        let actualValue = Script(json: payload)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.identifier, defaultIdentifier)
        XCTAssertEqual(actualValue?.name, defaultName)
        XCTAssertEqual(actualValue?.description, "[Script][\(defaultIdentifier). \(defaultName)]")
        XCTAssertEqual(actualValue?.category, defaultCategory)
        XCTAssertEqual(actualValue?.filename, defaultFilename)
        XCTAssertEqual(actualValue?.information, defaultInformation)
        XCTAssertEqual(actualValue?.notes, defaultNotes)
        XCTAssertEqual(actualValue?.priority, defaultPriority)
        XCTAssertEqual(actualValue?.parameters.count, defaultParameters.count)
        XCTAssertEqual(actualValue?.osRequirements, defaultOsRequirements)
        XCTAssertEqual(actualValue?.scriptContents, defaultScriptContents)
        XCTAssertEqual(actualValue?.scriptEncodedContents, defaultScriptEncodedContents)
    }

    func testShouldInitializeFromIncompleteJSON() {
        let payload = self.payload(for: "script_incomplete", subfolder: subfolder)!

        let actualValue = Script(json: payload)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.identifier, defaultIdentifier)
        XCTAssertEqual(actualValue?.name, defaultName)
        XCTAssertEqual(actualValue?.description, "[Script][\(defaultIdentifier). \(defaultName)]")
        XCTAssertEqual(actualValue?.category, "")
        XCTAssertEqual(actualValue?.filename, "")
        XCTAssertEqual(actualValue?.information, "")
        XCTAssertEqual(actualValue?.notes, "")
        XCTAssertEqual(actualValue?.priority, "")
        XCTAssertEqual(actualValue?.parameters.count, 0)
        XCTAssertEqual(actualValue?.osRequirements, "")
        XCTAssertEqual(actualValue?.scriptContents, "")
        XCTAssertEqual(actualValue?.scriptEncodedContents, "")
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

        XCTAssertNotNil(encodedObject?[Script.IdentifierKey])
        XCTAssertNotNil(encodedObject?[Script.NameKey])
        XCTAssertNotNil(encodedObject?[Script.CategoryKey])
        XCTAssertNotNil(encodedObject?[Script.FilenameKey])
        XCTAssertNotNil(encodedObject?[Script.InfoKey])
        XCTAssertNotNil(encodedObject?[Script.NotesKey])
        XCTAssertNotNil(encodedObject?[Script.PriorityKey])
        XCTAssertNotNil(encodedObject?[Script.ParametersKey])
        XCTAssertNotNil(encodedObject?[Script.OSRequirementsKey])
        XCTAssertNotNil(encodedObject?[Script.ScriptContentsKey])
        XCTAssertNotNil(encodedObject?[Script.ScriptContentsEncodedKey])
    }
}
