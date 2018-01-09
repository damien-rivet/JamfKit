//
//  ComputerConfiguration.swift
//  JamfKit
//
//  Copyright © 2018 JamfKit. All rights reserved.
//

import Foundation

/// Represents a logical configuration that can be applied to any hardware element managed by Jamf.
@objc(JMFKComputerConfiguration)
public final class ComputerConfiguration: NSObject, Identifiable {

    // MARK: - Constants

    static let GeneralKey = "general"

    // MARK: - Properties

    @objc
    public var general: ComputerConfigurationGeneral

    public override var description: String {
        return "[\(String(describing: type(of: self)))][\(general.identifier). \(general.name)]"
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
