//
//  Script.swift
//  JAMFKit
//
//  Copyright © 2018 JAMFKit. All rights reserved.
//

/// Represents a logical script that can be executed on one (or more) machine managed by Jamf.
public final class Script: BaseObject {

    // MARK: - Constants

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

    public var category: String
    public var filename: String
    public var information: String
    public var notes: String
    public var priority: String
    public var parameters: [String: String]
    public var osRequirements: String
    public var scriptContents: String
    public var scriptEncodedContents: String

    public override var description: String {
        return "[\(String(describing: Script.self))][\(identifier). \(self.name)]"
    }

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
