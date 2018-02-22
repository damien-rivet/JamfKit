//
//  Printer.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

/// Represents a physical printer, contains information about the printer and it's configuration.
@objc(JMFKPrinter)
public final class Printer: BaseObject, Endpoint {

    // MARK: - Constants

    public static let Endpoint: String = "printers"
    static let CategoryKey = "category"
    static let UriKey = "uri"
    static let CupsNameKey = "CUPS_name"
    static let LocationKey = "location"
    static let ModelKey = "model"
    static let InformationKey = "info"
    static let NotesKey = "notes"
    static let MakeDefaultKey = "make_default"
    static let UseGenericKey = "use_generic"
    static let PpdKey = "ppd"
    static let PpdPathKey = "ppd_path"
    static let PpdContentsKey = "ppd_contents"

    // MARK: - Properties

    @objc
    public var category = ""

    @objc
    public var uri = ""

    @objc
    public var cupsName = ""

    @objc
    public var location = ""

    @objc
    public var model = ""

    @objc
    public var information = ""

    @objc
    public var notes = ""

    @objc
    public var makeDefault = false

    @objc
    public var useGeneric = false

    @objc
    public var ppd = ""

    @objc
    public var ppdPath = ""

    @objc
    public var ppdContents = ""

    public override var description: String {
        let baseDescription = super.description

        if !uri.isEmpty, !location.isEmpty {
            return "\(baseDescription)[\(self.uri) \(self.location)]"
        }

        return baseDescription
    }

    // MARK: - Initialization

    public required init?(json: [String: Any], node: String = "") {
        category = json[Printer.CategoryKey] as? String ?? ""
        uri = json[Printer.UriKey] as? String ?? ""
        cupsName = json[Printer.CupsNameKey] as? String ?? ""
        location = json[Printer.LocationKey] as? String ?? ""
        model = json[Printer.ModelKey] as? String ?? ""
        information = json[Printer.InformationKey] as? String ?? ""
        notes = json[Printer.NotesKey] as? String ?? ""
        makeDefault = json[Printer.MakeDefaultKey] as? Bool ?? false
        useGeneric = json[Printer.UseGenericKey] as? Bool ?? false
        ppd = json[Printer.PpdKey] as? String ?? ""
        ppdPath = json[Printer.PpdPathKey] as? String ?? ""
        ppdContents = json[Printer.PpdContentsKey] as? String ?? ""

        super.init(json: json)
    }

    public override init?(identifier: UInt, name: String) {
        super.init(identifier: identifier, name: name)
    }

    // MARK: - Functions

    public override func toJSON() -> [String: Any] {
        var json = super.toJSON()

        json[Printer.CategoryKey] = category
        json[Printer.UriKey] = uri
        json[Printer.CupsNameKey] = cupsName
        json[Printer.LocationKey] = location
        json[Printer.ModelKey] = model
        json[Printer.InformationKey] = information
        json[Printer.NotesKey] = notes
        json[Printer.MakeDefaultKey] = makeDefault
        json[Printer.UseGenericKey] = useGeneric
        json[Printer.PpdKey] = ppd
        json[Printer.PpdPathKey] = ppdPath
        json[Printer.PpdContentsKey] = ppdContents

        return json
    }
}

// MARK: - Creatable

extension Printer: Creatable {

    public func create() -> URLRequest? {
        return self.createRequest()
    }
}

// MARK: - Protocols

extension Printer: Readable, Updatable, Deletable { }
