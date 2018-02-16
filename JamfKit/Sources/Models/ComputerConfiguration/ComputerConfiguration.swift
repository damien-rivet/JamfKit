//
//  ComputerConfiguration.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

/// Represents a logical configuration that can be applied to any hardware element managed by Jamf.
@objc(JMFKComputerConfiguration)
public final class ComputerConfiguration: NSObject, Requestable {

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

// MARK: - Requestable

extension ComputerConfiguration: Endpoint, Creatable {

    // MARK: - Constants

    public static var Endpoint: String = "computerconfigurations"

    // MARK: - Functions

    public func create() -> URLRequest? {
        return SessionManager.instance.createRequest(for: self, key: BaseObject.CodingKeys.identifier.rawValue, value: String(general.identifier))
    }
}
