//
//  Policy.swift
//  JamfKit
//
//  Copyright © 2018 JamfKit. All rights reserved.
//

/// Reprents as logical policy that can be applied to any hardware element managed by Jamf.
public final class Policy: Identifiable {

    // MARK: - Constants

    static let GeneralKey = "general"

    // MARK: - Properties

    public var general: PolicyGeneral

    public var description: String {
        return "[\(String(describing: Policy.self))][\(general.identifier). \(general.name)]"
    }

    // MARK: - Initialization

    public init?(json: [String: Any], node: String = "") {
        guard
            let generalNode = json[Policy.GeneralKey] as? [String: Any],
            let general = PolicyGeneral(json: generalNode)
            else {
                return nil
        }

        self.general = general
    }

    // MARK: - Functions

    public func toJSON() -> [String: Any] {
        var json = [String: Any]()

        json[Policy.GeneralKey] = general.toJSON()

        return json
    }
}
