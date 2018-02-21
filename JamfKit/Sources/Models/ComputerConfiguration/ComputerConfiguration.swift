//
//  ComputerConfiguration.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

/// Represents a logical configuration that can be applied to any hardware element managed by Jamf.
@objc(JMFKComputerConfiguration)
public final class ComputerConfiguration: NSObject, Requestable, Endpoint, Subset {

    // MARK: - Constants

    public static let Endpoint: String = "computerconfigurations"
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

    public init?(identifier: UInt, name: String) {
        guard let general = ComputerConfigurationGeneral(identifier: identifier, name: name) else {
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

// MARK: - Creatable

extension ComputerConfiguration: Creatable {

    public func create() -> URLRequest? {
        return SessionManager.instance.createRequest(for: self, key: BaseObject.CodingKeys.identifier.rawValue, value: String(general.identifier))
    }
}

// MARK: - Readable

extension ComputerConfiguration: Readable {

    public func read() -> URLRequest? {
        return SessionManager.instance.readRequest(for: self, key: BaseObject.CodingKeys.identifier.rawValue, value: String(general.identifier))
    }

    public func readWithName() -> URLRequest? {
        return SessionManager.instance.readRequest(for: self, key: BaseObject.CodingKeys.name.rawValue, value: general.name)
    }
}

// MARK: - Updatable

extension ComputerConfiguration: Updatable {

    public func update() -> URLRequest? {
        return SessionManager.instance.updateRequest(for: self, key: BaseObject.CodingKeys.identifier.rawValue, value: String(general.identifier))
    }

    public func updateWithName() -> URLRequest? {
        return SessionManager.instance.updateRequest(for: self, key: BaseObject.CodingKeys.name.rawValue, value: general.name)
    }
}

// MARK: - Deletable

extension ComputerConfiguration: Deletable {

    public func delete() -> URLRequest? {
        return ComputerConfiguration.delete(identifier: String(general.identifier))
    }

    public func deleteWithName() -> URLRequest? {
        return SessionManager.instance.deleteRequest(for: self, key: BaseObject.CodingKeys.name.rawValue, value: general.name)
    }
}
