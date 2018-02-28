//
//  Script.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

/// Represents a logical script that can be executed on one (or more) hardware element managed by Jamf.
@objc(JMFKScript)
public final class Script: BaseObject, Endpoint {

    // MARK: - Constants

    public static let Endpoint = "scripts"

    enum CodingKeys: String, CodingKey {
        case category = "category"
        case filename = "filename"
        case info = "info"
        case notes = "notes"
        case priority = "priority"
        case parameters = "parameters"
        case osRequirements = "os_requirements"
        case scriptContents = "script_contents"
        case scriptContentsEncoded = "script_contents_encoded"
    }

    // MARK: - Properties

    @objc
    public var category = ""

    @objc
    public var filename = ""

    @objc
    public var information = ""

    @objc
    public var notes = ""

    @objc
    public var priority = ""

    @objc
    public var parameters = [String: String]()

    @objc
    public var osRequirements = ""

    @objc
    public var scriptContents = ""

    @objc
    public var scriptContentsEncoded = ""

    // MARK: - Initialization

    public override init?(identifier: UInt, name: String) {
        super.init(identifier: identifier, name: name)
    }

    public required init?(json: [String: Any], node: String = "") {
        category = json[CodingKeys.category.rawValue] as? String ?? ""
        filename = json[CodingKeys.filename.rawValue] as? String ?? ""
        information = json[CodingKeys.info.rawValue] as? String ?? ""
        notes = json[CodingKeys.notes.rawValue] as? String ?? ""
        priority = json[CodingKeys.priority.rawValue] as? String ?? ""
        parameters = Script.parseParameters(from: json)
        osRequirements = json[CodingKeys.osRequirements.rawValue] as? String ?? ""
        scriptContents = json[CodingKeys.scriptContents.rawValue] as? String ?? ""
        scriptContentsEncoded = json[CodingKeys.scriptContentsEncoded.rawValue] as? String ?? ""

        super.init(json: json)
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        category = try container.decode(String.self, forKey: .category)
        filename = try container.decode(String.self, forKey: .filename)
        information = try container.decode(String.self, forKey: .info)
        notes = try container.decode(String.self, forKey: .notes)
        priority = try container.decode(String.self, forKey: .priority)
        parameters = try container.decode([String: String].self, forKey: .parameters)
        osRequirements = try container.decode(String.self, forKey: .osRequirements)
        scriptContents = try container.decode(String.self, forKey: .scriptContents)
        scriptContentsEncoded = try container.decode(String.self, forKey: .scriptContentsEncoded)

        try super.init(from: decoder)
    }

    // MARK: - Functions

    public override func toJSON() -> [String: Any] {
        var json = super.toJSON()

        json[CodingKeys.category.rawValue] = category
        json[CodingKeys.filename.rawValue] = filename
        json[CodingKeys.info.rawValue] = information
        json[CodingKeys.notes.rawValue] = notes
        json[CodingKeys.priority.rawValue] = priority
        json[CodingKeys.parameters.rawValue] = parameters
        json[CodingKeys.osRequirements.rawValue] = osRequirements
        json[CodingKeys.scriptContents.rawValue] = scriptContents
        json[CodingKeys.scriptContentsEncoded.rawValue] = scriptContentsEncoded

        return json
    }

    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(category, forKey: .category)
        try container.encode(filename, forKey: .filename)
        try container.encode(information, forKey: .info)
        try container.encode(notes, forKey: .notes)
        try container.encode(priority, forKey: .priority)
        try container.encode(parameters, forKey: .parameters)
        try container.encode(osRequirements, forKey: .osRequirements)
        try container.encode(scriptContents, forKey: .scriptContents)
        try container.encode(scriptContentsEncoded, forKey: .scriptContentsEncoded)

        try super.encode(to: encoder)
    }

    private static func parseParameters(from json: [String: Any]) -> [String: String] {
        guard let rawParameters = json[CodingKeys.parameters.rawValue] as? [String: String] else {
            return [String: String]()
        }

        return rawParameters
    }
}

// MARK: - Creatable

extension Script: Creatable {

    public func createRequest() -> URLRequest? {
        return getCreateRequest()
    }
}

// MARK: - Readable

extension Script: Readable {

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

extension Script: Updatable {

    public func updateRequest() -> URLRequest? {
        return getUpdateRequest()
    }

    /// Returns a PUT **URLRequest** based on the name.
    public func updateRequestWithName() -> URLRequest? {
        return getUpdateRequestWithName()
    }
}

// MARK: - Deletable

extension Script: Deletable {

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
