//
//  Printer.swift
//  JAMFKit
//
//  Copyright © 2017 JAMFKit. All rights reserved.
//

/// Represents a physical printer, contains information about the printer and it's configuration.
public final class Printer: BaseObject {

    // MARK: - Constants

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

    public var category: String
    public var uri: String
    public var cupsName: String
    public var location: String
    public var model: String
    public var information: String
    public var notes: String
    public var makeDefault: Bool
    public var useGeneric: Bool
    public var ppd: String
    public var ppdPath: String
    public var ppdContents: String

    public override var description: String {
        return "[\(String(describing: Printer.self))][\(identifier). \(self.uri) \(self.location)]"
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
