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

    public static let Endpoint: String = "scripts"
    static let CategoryKey = "category"
    static let FilenameKey = "filename"
    static let InfoKey = "info"
    static let NotesKey = "notes"
    static let PriorityKey = "priority"
    static let ParametersKey = "parameters"
    static let OSRequirementsKey = "os_requirements"
    static let ScriptContentsKey = "script_contents"
    static let ScriptContentsEncodedKey = "script_contents_encoded"

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
    public var scriptEncodedContents = ""

    // MARK: - Initialization

    public required init?(json: [String: Any], node: String = "") {
        category = json[Script.CategoryKey] as? String ?? ""
        filename = json[Script.FilenameKey] as? String ?? ""
        information = json[Script.InfoKey] as? String ?? ""
        notes = json[Script.NotesKey] as? String ?? ""
        priority = json[Script.PriorityKey] as? String ?? ""
        parameters = Script.parseParameters(from: json)
        osRequirements = json[Script.OSRequirementsKey] as? String ?? ""
        scriptContents = json[Script.ScriptContentsKey] as? String ?? ""
        scriptEncodedContents = json[Script.ScriptContentsEncodedKey] as? String ?? ""

        super.init(json: json)
    }

    public override init?(identifier: UInt, name: String) {
        super.init(identifier: identifier, name: name)
    }

    // MARK: - Functions

    public override func toJSON() -> [String: Any] {
        var json = super.toJSON()

        json[Script.CategoryKey] = category
        json[Script.FilenameKey] = filename
        json[Script.InfoKey] = information
        json[Script.NotesKey] = notes
        json[Script.PriorityKey] = priority
        json[Script.ParametersKey] = parameters
        json[Script.OSRequirementsKey] = osRequirements
        json[Script.ScriptContentsKey] = scriptContents
        json[Script.ScriptContentsEncodedKey] = scriptEncodedContents

        return json
    }

    private static func parseParameters(from json: [String: Any]) -> [String: String] {
        guard let rawParameters = json[Script.ParametersKey] as? [String: String] else {
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
