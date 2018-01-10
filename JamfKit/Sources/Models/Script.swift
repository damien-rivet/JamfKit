//
//  Script.swift
//  JamfKit
//
//  Copyright © 2018 JamfKit. All rights reserved.
//

import Foundation

/// Represents a logical script that can be executed on one (or more) hardware element managed by Jamf.
@objc(JMFKScript)
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

    @objc
    public var category: String

    @objc
    public var filename: String

    @objc
    public var information: String

    @objc
    public var notes: String

    @objc
    public var priority: String

    @objc
    public var parameters: [String: String]

    @objc
    public var osRequirements: String

    @objc
    public var scriptContents: String

    @objc
    public var scriptEncodedContents: String

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
