//
//  ComputerConfiguration.swift
//  JamfKit
//
//  Copyright © 2018 JamfKit. All rights reserved.
//

/// Represents a logical configuration that can be applied to any hardware element managed by Jamf.
public final class ComputerConfiguration: Identifiable, CustomStringConvertible {

    // MARK: - Constants

    static let GeneralKey = "general"

    // MARK: - Properties

    public var general: ComputerConfigurationGeneral

    public var description: String {
        return "[\(String(describing: ComputerConfiguration.self))][\(general.identifier). \(general.name)]"
    }

    // MARK: - Initialization

    public required init?(json: [String: Any], node: String = "") {
        guard
            let generalNode = json[ComputerConfiguration.GeneralKey] as? [String: Any],
            let general = ComputerConfigurationGeneral(json: generalNode)
            else {
                return nil
        }

        self.general = general
    }

    // MARK: - Functions

    public func toJSON() -> [String: Any] {
        var json = [String: Any]()

        json[ComputerConfiguration.GeneralKey] = general.toJSON()

        return json
    }
}
