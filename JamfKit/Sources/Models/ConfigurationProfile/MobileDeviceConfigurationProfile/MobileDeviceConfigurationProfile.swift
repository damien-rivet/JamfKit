//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

/// Represents a logical configuration profile that can be applied to any mobile device managed by Jamf.
@objc(JMFKMobileDeviceConfigurationProfile)
public final class MobileDeviceConfigurationProfile: NSObject, Requestable, Endpoint, Subset {

    // MARK: - Constants

    public static let Endpoint = "mobiledeviceconfigurationprofiles"
    static let GeneralKey = "general"

    // MARK: - Properties

    public var general: MobileDeviceConfigurationProfileGeneral

    public override var description: String {
        return "[\(String(describing: type(of: self)))][\(general.identifier) - \(general.name)]"
    }

    // MARK: - Initialization

    public init?(json: [String: Any], node: String = "") {
        guard
            let generalNode = json[MobileDeviceConfigurationProfile.GeneralKey] as? [String: Any],
            let general = MobileDeviceConfigurationProfileGeneral(json: generalNode)
            else {
                return nil
        }

        self.general = general
    }

    public init?(identifier: UInt, name: String) {
        guard let general = MobileDeviceConfigurationProfileGeneral(identifier: identifier, name: name) else {
            return nil
        }

        self.general = general
    }

    // MARK: - Functions

    public func toJSON() -> [String: Any] {
        var json = [String: Any]()

        json[MobileDeviceConfigurationProfile.GeneralKey] = general.toJSON()

        return json
    }
}

// MARK: - Creatable

extension MobileDeviceConfigurationProfile: Creatable {

    public func createRequest() -> URLRequest? {
        return SessionManager.instance.createRequest(for: self, key: BaseObject.CodingKeys.identifier.rawValue, value: String(general.identifier))
    }
}

// MARK: - Readable

extension MobileDeviceConfigurationProfile: Readable {

    public static func readAllRequest() -> URLRequest? {
        return getReadAllRequest()
    }

    public static func readRequest(identifier: String) -> URLRequest? {
        return getReadRequest(identifier: identifier)
    }

    public func readRequest() -> URLRequest? {
        return MobileDeviceConfigurationProfile.readRequest(identifier: String(general.identifier))
    }

    public func readRequestWithName() -> URLRequest? {
        return SessionManager.instance.readRequest(for: self, key: BaseObject.CodingKeys.name.rawValue, value: general.name)
    }
}

// MARK: - Updatable

extension MobileDeviceConfigurationProfile: Updatable {

    public func updateRequest() -> URLRequest? {
        return SessionManager.instance.updateRequest(for: self, key: BaseObject.CodingKeys.identifier.rawValue, value: String(general.identifier))
    }

    /// Returns a PUT **URLRequest** based on the name.
    public func updateRequestWithName() -> URLRequest? {
        return SessionManager.instance.updateRequest(for: self, key: BaseObject.CodingKeys.name.rawValue, value: general.name)
    }
}

// MARK: - Deletable

extension MobileDeviceConfigurationProfile: Deletable {

    public static func deleteRequest(identifier: String) -> URLRequest? {
        return getDeleteRequest(identifier: identifier)
    }

    public func deleteRequest() -> URLRequest? {
        return MobileDeviceConfigurationProfile.deleteRequest(identifier: String(general.identifier))
    }

    /// Returns a DELETE **URLRequest** based on the supplied name.
    public static func deleteRequest(name: String) -> URLRequest? {
        return getDeleteRequest(name: name)
    }

    /// Returns a DELETE **URLRequest** based on the name.
    public func deleteRequestWithName() -> URLRequest? {
        return MobileDeviceConfigurationProfile.deleteRequest(name: general.name)
    }
}
