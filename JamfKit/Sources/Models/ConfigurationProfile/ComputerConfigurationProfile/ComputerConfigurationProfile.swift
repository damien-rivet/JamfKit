//
//  ComputerConfigurationProfile.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

/// Represents a logical configuration profile that can be applied to any computer managed by Jamf.
@objc(JMFKComputerConfigurationProfile)
public final class ComputerConfigurationProfile: NSObject, Codable, Requestable, Endpoint, Subset {

    // MARK: - Constants

    public static let Endpoint = "osxconfigurationprofiles"

    enum CodingKeys: String, CodingKey {
        case general
    }

    // MARK: - Properties

    public var general: ComputerConfigurationProfileGeneral

    public override var description: String {
        return "[\(String(describing: type(of: self)))][\(general.identifier) - \(general.name)]"
    }

    // MARK: - Initialization

    public init?(json: [String: Any], node: String = "") {
        guard
            let generalNode = json[CodingKeys.general.rawValue] as? [String: Any],
            let general = ComputerConfigurationProfileGeneral(json: generalNode)
            else {
                return nil
        }

        self.general = general
    }

    public init?(identifier: UInt, name: String) {
        guard let general = ComputerConfigurationProfileGeneral(identifier: identifier, name: name) else {
            return nil
        }

        self.general = general
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        general = try container.decode(ComputerConfigurationProfileGeneral.self, forKey: .general)
    }

    // MARK: - Functions

    public func toJSON() -> [String: Any] {
        var json = [String: Any]()

        json[CodingKeys.general.rawValue] = general.toJSON()

        return json
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(general, forKey: .general)
    }
}

// MARK: - Creatable

extension ComputerConfigurationProfile: Creatable {

    public func createRequest() -> URLRequest? {
        return SessionManager.instance.createRequest(for: self, key: BaseObject.IdentifierKey, value: String(general.identifier))
    }
}

// MARK: - Readable

extension ComputerConfigurationProfile: Readable {

    public static func readAllRequest() -> URLRequest? {
        return getReadAllRequest()
    }

    public static func readRequest(identifier: String) -> URLRequest? {
        return getReadRequest(identifier: identifier)
    }

    public func readRequest() -> URLRequest? {
        return ComputerConfigurationProfile.readRequest(identifier: String(general.identifier))
    }

    public func readRequestWithName() -> URLRequest? {
        return SessionManager.instance.readRequest(for: self, key: BaseObject.NameKey, value: general.name)
    }
}

// MARK: - Updatable

extension ComputerConfigurationProfile: Updatable {

    public func updateRequest() -> URLRequest? {
        return SessionManager.instance.updateRequest(for: self, key: BaseObject.IdentifierKey, value: String(general.identifier))
    }

    /// Returns a PUT **URLRequest** based on the name.
    public func updateRequestWithName() -> URLRequest? {
        return SessionManager.instance.updateRequest(for: self, key: BaseObject.NameKey, value: general.name)
    }
}

// MARK: - Deletable

extension ComputerConfigurationProfile: Deletable {

    public static func deleteRequest(identifier: String) -> URLRequest? {
        return getDeleteRequest(identifier: identifier)
    }

    public func deleteRequest() -> URLRequest? {
        return ComputerConfigurationProfile.deleteRequest(identifier: String(general.identifier))
    }

    /// Returns a DELETE **URLRequest** based on the supplied name.
    public static func deleteRequest(name: String) -> URLRequest? {
        return getDeleteRequest(name: name)
    }

    /// Returns a DELETE **URLRequest** based on the name.
    public func deleteRequestWithName() -> URLRequest? {
        return ComputerConfigurationProfile.deleteRequest(name: general.name)
    }
}
