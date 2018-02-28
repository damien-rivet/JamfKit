//
//  PrinterTests.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

import XCTest

@testable import JamfKit

class PrinterTests: XCTestCase {

    // MARK: - Constants

    let subfolder = "Printer/"
    let defaultIdentifier: UInt = 12345
    let defaultName = "HP 9th Floor"
    let defaultCategory = "Printers"
    let defaultUri = "lpd://10.1.20.204/"
    let defaultCupsName = "HP_9th_Floor"
    let defaultLocation = "Somewhere"
    let defaultModel = "HP LaserJet 500 color MFP M575"
    let defaultInformation = "None"
    let defaultNotes = "None"
    let defaultMakeDefault = true
    let defaultUseGeneric = true
    let defaultPpd = "9th_Floor_HP.ppd"
    let defaultPpdPath = "/System/Library/Frameworks/ApplicationServices.framework/Versions/A/Frameworks/PrintCore.framework/Resources/Generic.ppd"
    let defaultPpdContents = "string"

    // MARK: - Tests

    func testShouldInstantiate() {
        let actualValue = Printer(identifier: defaultIdentifier, name: defaultName)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.identifier, defaultIdentifier)
        XCTAssertEqual(actualValue?.name, defaultName)
    }

    func testShouldNotInstantiateWithInvalidParameters() {
        let actualValue = Printer(identifier: defaultIdentifier, name: "")

        XCTAssertNil(actualValue)
    }

    func testShouldInitializeFromJSON() {
        let payload = self.payload(for: "printer_valid", subfolder: subfolder)!

        let actualValue = Printer(json: payload)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.identifier, defaultIdentifier)
        XCTAssertEqual(actualValue?.name, defaultName)
        XCTAssertEqual(actualValue?.description, "[Printer][\(defaultIdentifier) - \(defaultName)][\(defaultUri) \(defaultLocation)]")
        XCTAssertEqual(actualValue?.category, defaultCategory)
        XCTAssertEqual(actualValue?.uri, defaultUri)
        XCTAssertEqual(actualValue?.cupsName, defaultCupsName)
        XCTAssertEqual(actualValue?.location, defaultLocation)
        XCTAssertEqual(actualValue?.model, defaultModel)
        XCTAssertEqual(actualValue?.information, defaultInformation)
        XCTAssertEqual(actualValue?.notes, defaultNotes)
        XCTAssertEqual(actualValue?.makeDefault, defaultMakeDefault)
        XCTAssertEqual(actualValue?.useGeneric, defaultUseGeneric)
        XCTAssertEqual(actualValue?.ppd, defaultPpd)
        XCTAssertEqual(actualValue?.ppdPath, defaultPpdPath)
        XCTAssertEqual(actualValue?.ppdContents, defaultPpdContents)
    }

    func testShouldInitializeFromIncompleteJSON() {
        let payload = self.payload(for: "printer_incomplete", subfolder: subfolder)!

        let actualValue = Printer(json: payload)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.identifier, defaultIdentifier)
        XCTAssertEqual(actualValue?.name, defaultName)
        XCTAssertEqual(actualValue?.description, "[Printer][\(defaultIdentifier) - \(defaultName)]")
        XCTAssertEqual(actualValue?.category, "")
        XCTAssertEqual(actualValue?.uri, "")
        XCTAssertEqual(actualValue?.cupsName, "")
        XCTAssertEqual(actualValue?.location, "")
        XCTAssertEqual(actualValue?.model, "")
        XCTAssertEqual(actualValue?.information, "")
        XCTAssertEqual(actualValue?.notes, "")
        XCTAssertEqual(actualValue?.makeDefault, false)
        XCTAssertEqual(actualValue?.useGeneric, false)
        XCTAssertEqual(actualValue?.ppd, "")
        XCTAssertEqual(actualValue?.ppdPath, "")
        XCTAssertEqual(actualValue?.ppdContents, "")
    }

    func testShouldNotInitializeFromInvalidJSON() {
        let payload = self.payload(for: "printer_invalid", subfolder: subfolder)!

        let actualValue = Printer(json: payload)

        XCTAssertNil(actualValue)
    }

    func testShouldEncodeToJSON() {
        let payload = self.payload(for: "printer_valid", subfolder: subfolder)!

        let actualValue = Printer(json: payload)
        let encodedObject = actualValue?.toJSON()

        XCTAssertNotNil(encodedObject)
        XCTAssertEqual(encodedObject?.count, 14)

        XCTAssertNotNil(encodedObject?[BaseObject.IdentifierKey])
        XCTAssertNotNil(encodedObject?[BaseObject.NameKey])
        XCTAssertNotNil(encodedObject?[Printer.CodingKeys.category.rawValue])
        XCTAssertNotNil(encodedObject?[Printer.CodingKeys.uri.rawValue])
        XCTAssertNotNil(encodedObject?[Printer.CodingKeys.cupsName.rawValue])
        XCTAssertNotNil(encodedObject?[Printer.CodingKeys.location.rawValue])
        XCTAssertNotNil(encodedObject?[Printer.CodingKeys.model.rawValue])
        XCTAssertNotNil(encodedObject?[Printer.CodingKeys.information.rawValue])
        XCTAssertNotNil(encodedObject?[Printer.CodingKeys.notes.rawValue])
        XCTAssertNotNil(encodedObject?[Printer.CodingKeys.makeDefault.rawValue])
        XCTAssertNotNil(encodedObject?[Printer.CodingKeys.useGeneric.rawValue])
        XCTAssertNotNil(encodedObject?[Printer.CodingKeys.ppd.rawValue])
        XCTAssertNotNil(encodedObject?[Printer.CodingKeys.ppdPath.rawValue])
        XCTAssertNotNil(encodedObject?[Printer.CodingKeys.ppdContents.rawValue])
    }

    func testShouldInitializeFromData() {
        let payload = self.payloadData(for: "printer_valid", subfolder: subfolder)!

        do {
            let actualValue = try JSONDecoder().decode(Printer.self, from: payload)

            XCTAssertNotNil(actualValue)
            XCTAssertEqual(actualValue.identifier, defaultIdentifier)
            XCTAssertEqual(actualValue.name, defaultName)
            XCTAssertEqual(actualValue.description, "[Printer][\(defaultIdentifier) - \(defaultName)][\(defaultUri) \(defaultLocation)]")
            XCTAssertEqual(actualValue.category, defaultCategory)
            XCTAssertEqual(actualValue.uri, defaultUri)
            XCTAssertEqual(actualValue.cupsName, defaultCupsName)
            XCTAssertEqual(actualValue.location, defaultLocation)
            XCTAssertEqual(actualValue.model, defaultModel)
            XCTAssertEqual(actualValue.information, defaultInformation)
            XCTAssertEqual(actualValue.notes, defaultNotes)
            XCTAssertEqual(actualValue.makeDefault, defaultMakeDefault)
            XCTAssertEqual(actualValue.useGeneric, defaultUseGeneric)
            XCTAssertEqual(actualValue.ppd, defaultPpd)
            XCTAssertEqual(actualValue.ppdPath, defaultPpdPath)
            XCTAssertEqual(actualValue.ppdContents, defaultPpdContents)
        } catch {
            XCTFail("Failed to initialize from data")
        }
    }

    func testShouldEncodeToData() {
        let payload = self.payload(for: "printer_valid", subfolder: subfolder)!

        let actualValue = Printer(json: payload)

        do {
            let encodedObject = try JSONEncoder().encode(actualValue)

            XCTAssertNotNil(encodedObject)
        } catch {
            XCTFail("Failed to encode to data")
        }
    }
}
