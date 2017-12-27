//
//  PrinterTests.swift
//  JamfKit
//
//  Copyright © 2017 JamfKit. All rights reserved.
//

import XCTest

@testable import JamfKit

class PrinterTests: XCTestCase {

    // MARK: - Constants

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

    func testShouldInitializeFromJSON() {
        let payload = self.payload(for: "printer_valid")!

        let actualValue = Printer(json: payload)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.identifier, defaultIdentifier)
        XCTAssertEqual(actualValue?.name, defaultName)
        XCTAssertEqual(actualValue?.description, "[Printer][\(defaultIdentifier). \(defaultUri) \(defaultLocation)]")
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
        let payload = self.payload(for: "printer_incomplete")!

        let actualValue = Printer(json: payload)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.identifier, defaultIdentifier)
        XCTAssertEqual(actualValue?.name, defaultName)
        XCTAssertEqual(actualValue?.description, "[Printer][\(defaultIdentifier).  ]")
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
        let payload = self.payload(for: "printer_invalid")!

        let actualValue = Printer(json: payload)

        XCTAssertNil(actualValue)
    }

    func testShouldEncodeToJSON() {
        let payload = self.payload(for: "printer_valid")!

        let actualValue = Printer(json: payload)
        let encodedObject = actualValue?.toJSON()

        XCTAssertNotNil(encodedObject)
        XCTAssertEqual(encodedObject?.count, 14)

        XCTAssertNotNil(encodedObject?[Printer.IdentifierKey])
        XCTAssertNotNil(encodedObject?[Printer.NameKey])
        XCTAssertNotNil(encodedObject?[Printer.CategoryKey])
        XCTAssertNotNil(encodedObject?[Printer.UriKey])
        XCTAssertNotNil(encodedObject?[Printer.CupsNameKey])
        XCTAssertNotNil(encodedObject?[Printer.LocationKey])
        XCTAssertNotNil(encodedObject?[Printer.ModelKey])
        XCTAssertNotNil(encodedObject?[Printer.InformationKey])
        XCTAssertNotNil(encodedObject?[Printer.NotesKey])
        XCTAssertNotNil(encodedObject?[Printer.MakeDefaultKey])
        XCTAssertNotNil(encodedObject?[Printer.UseGenericKey])
        XCTAssertNotNil(encodedObject?[Printer.PpdKey])
        XCTAssertNotNil(encodedObject?[Printer.PpdPathKey])
        XCTAssertNotNil(encodedObject?[Printer.PpdContentsKey])
    }
}
