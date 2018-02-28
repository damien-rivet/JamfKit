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

    public static let Endpoint = "printers"

    enum CodingKeys: String, CodingKey {
        case category = "category"
        case uri = "uri"
        case cupsName = "CUPS_name"
        case location = "location"
        case model = "model"
        case information = "info"
        case notes = "notes"
        case makeDefault = "make_default"
        case useGeneric = "use_generic"
        case ppd = "ppd"
        case ppdPath = "ppd_path"
        case ppdContents = "ppd_contents"
    }

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

    public override init?(identifier: UInt, name: String) {
        super.init(identifier: identifier, name: name)
    }

    public required init?(json: [String: Any], node: String = "") {
        category = json[CodingKeys.category.rawValue] as? String ?? ""
        uri = json[CodingKeys.uri.rawValue] as? String ?? ""
        cupsName = json[CodingKeys.cupsName.rawValue] as? String ?? ""
        location = json[CodingKeys.location.rawValue] as? String ?? ""
        model = json[CodingKeys.model.rawValue] as? String ?? ""
        information = json[CodingKeys.information.rawValue] as? String ?? ""
        notes = json[CodingKeys.notes.rawValue] as? String ?? ""
        makeDefault = json[CodingKeys.makeDefault.rawValue] as? Bool ?? false
        useGeneric = json[CodingKeys.useGeneric.rawValue] as? Bool ?? false
        ppd = json[CodingKeys.ppd.rawValue] as? String ?? ""
        ppdPath = json[CodingKeys.ppdPath.rawValue] as? String ?? ""
        ppdContents = json[CodingKeys.ppdContents.rawValue] as? String ?? ""

        super.init(json: json)
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        category = try container.decode(String.self, forKey: .category)
        uri = try container.decode(String.self, forKey: .uri)
        cupsName = try container.decode(String.self, forKey: .cupsName)
        location = try container.decode(String.self, forKey: .location)
        model = try container.decode(String.self, forKey: .model)
        information = try container.decode(String.self, forKey: .information)
        notes = try container.decode(String.self, forKey: .notes)
        makeDefault = try container.decode(Bool.self, forKey: .makeDefault)
        useGeneric = try container.decode(Bool.self, forKey: .useGeneric)
        ppd = try container.decode(String.self, forKey: .ppd)
        ppdPath = try container.decode(String.self, forKey: .ppdPath)
        ppdContents = try container.decode(String.self, forKey: .ppdContents)

        try super.init(from: decoder)
    }

    // MARK: - Functions

    public override func toJSON() -> [String: Any] {
        var json = super.toJSON()

        json[CodingKeys.category.rawValue] = category
        json[CodingKeys.uri.rawValue] = uri
        json[CodingKeys.cupsName.rawValue] = cupsName
        json[CodingKeys.location.rawValue] = location
        json[CodingKeys.model.rawValue] = model
        json[CodingKeys.information.rawValue] = information
        json[CodingKeys.notes.rawValue] = notes
        json[CodingKeys.makeDefault.rawValue] = makeDefault
        json[CodingKeys.useGeneric.rawValue] = useGeneric
        json[CodingKeys.ppd.rawValue] = ppd
        json[CodingKeys.ppdPath.rawValue] = ppdPath
        json[CodingKeys.ppdContents.rawValue] = ppdContents

        return json
    }

    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(category, forKey: .category)
        try container.encode(uri, forKey: .uri)
        try container.encode(cupsName, forKey: .cupsName)
        try container.encode(location, forKey: .location)
        try container.encode(model, forKey: .model)
        try container.encode(information, forKey: .information)
        try container.encode(notes, forKey: .notes)
        try container.encode(makeDefault, forKey: .makeDefault)
        try container.encode(useGeneric, forKey: .useGeneric)
        try container.encode(ppd, forKey: .ppd)
        try container.encode(ppdPath, forKey: .ppdPath)
        try container.encode(ppdContents, forKey: .ppdContents)

        try super.encode(to: encoder)
    }
}

// MARK: - Creatable

extension Printer: Creatable {

    public func createRequest() -> URLRequest? {
        return getCreateRequest()
    }
}

// MARK: - Readable

extension Printer: Readable {

    public static func readAllRequest() -> URLRequest? {
        return getReadAllRequest()
    }

    public static func readRequest(identifier: String) -> URLRequest? {
        return getReadRequest(identifier: identifier)
    }

    public func readRequest() -> URLRequest? {
        return getReadRequest()
    }

    /// Returns a GET **URLRequest** based on the supplied name.
    public static func readRequest(name: String) -> URLRequest? {
        return getReadRequest(name: name)
    }

    /// Returns a GET **URLRequest** based on the email.
    public func readRequestWithName() -> URLRequest? {
        return getReadRequestWithName()
    }
}

// MARK: - Updatable

extension Printer: Updatable {

    public func updateRequest() -> URLRequest? {
        return getUpdateRequest()
    }

    /// Returns a PUT **URLRequest** based on the name.
    public func updateRequestWithName() -> URLRequest? {
        return getUpdateRequestWithName()
    }
}

// MARK: - Deletable

extension Printer: Deletable {

    public static func deleteRequest(identifier: String) -> URLRequest? {
        return getDeleteRequest(identifier: identifier)
    }

    public func deleteRequest() -> URLRequest? {
        return getDeleteRequest()
    }

    /// Returns a DELETE **URLRequest** based on the supplied name.
    public static func deleteRequest(name: String) -> URLRequest? {
        return getDeleteRequest(name: name)
    }

    /// Returns a DELETE **URLRequest** based on the name.
    public func deleteRequestWithName() -> URLRequest? {
        return getDeleteRequestWithName()
    }
}
