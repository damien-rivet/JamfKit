//
//  MobileDevice.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

/// Represents a Jamf managed mobile device, contains the general information about the device.
@objc(JMFKMobileDevice)
public final class MobileDevice: NSObject, Requestable, Endpoint, Subset {

    // MARK: - Constants

    public static let Endpoint: String = "mobiledevices"
    static let GeneralKey = "general"

    // MARK: - Properties

    @objc
    public var general: MobileDeviceGeneral

    public override var description: String {
        return "[\(String(describing: type(of: self)))][\(general.identifier) - \(general.name)]"
    }

    // MARK: - Initialization

    public required init?(json: [String: Any], node: String = "") {
        guard
            let generalNode = json[MobileDevice.GeneralKey] as? [String: Any],
            let general = MobileDeviceGeneral(json: generalNode)
            else {
                return nil
        }

        self.general = general
    }

    public init?(identifier: UInt, name: String) {
        guard let general = MobileDeviceGeneral(identifier: identifier, name: name) else {
            return nil
        }

        self.general = general
    }

    // MARK: - Functions

    public func toJSON() -> [String: Any] {
        var json = [String: Any]()

        json[MobileDevice.GeneralKey] = general.toJSON()

        return json
    }
}

// MARK: - Creatable

extension MobileDevice: Creatable {

    public func create() -> URLRequest? {
        return SessionManager.instance.createRequest(for: self, key: BaseObject.CodingKeys.identifier.rawValue, value: String(general.identifier))
    }
}

// MARK: - Readable

extension MobileDevice: Readable {

    public func read() -> URLRequest? {
        return MobileDevice.read(identifier: String(general.identifier))
    }

    public func readWithName() -> URLRequest? {
        return SessionManager.instance.readRequest(for: self, key: BaseObject.CodingKeys.name.rawValue, value: general.name)
    }

    public func readWithUdid() -> URLRequest? {
        return SessionManager.instance.readRequest(for: self, key: MobileDeviceGeneral.UDIDKey, value: general.udid)
    }

    public func readWithSerialNumber() -> URLRequest? {
        return SessionManager.instance.readRequest(for: self, key: MobileDeviceGeneral.SerialNumberKey, value: general.serialNumber)
    }
}

// MARK: - Updatable

extension MobileDevice: Updatable {

    public func update() -> URLRequest? {
        return SessionManager.instance.updateRequest(for: self, key: BaseObject.CodingKeys.identifier.rawValue, value: String(general.identifier))
    }

    public func updateWithName() -> URLRequest? {
        return SessionManager.instance.updateRequest(for: self, key: BaseObject.CodingKeys.name.rawValue, value: general.name)
    }

    public func updateWithUdid() -> URLRequest? {
        return SessionManager.instance.updateRequest(for: self, key: MobileDeviceGeneral.UDIDKey, value: general.udid)
    }

    public func updateWithSerialNumber() -> URLRequest? {
        return SessionManager.instance.updateRequest(for: self, key: MobileDeviceGeneral.SerialNumberKey, value: general.serialNumber)
    }
}

// MARK: - Deletable

extension MobileDevice: Deletable {

    public func delete() -> URLRequest? {
        return MobileDevice.delete(identifier: String(general.identifier))
    }

    public func deleteWithName() -> URLRequest? {
        return SessionManager.instance.deleteRequest(for: self, key: BaseObject.CodingKeys.name.rawValue, value: general.name)
    }

    public func deleteWithUdid() -> URLRequest? {
        return SessionManager.instance.deleteRequest(for: self, key: MobileDeviceGeneral.UDIDKey, value: general.udid)
    }

    public func deleteWithSerialNumber() -> URLRequest? {
        return SessionManager.instance.deleteRequest(for: self, key: MobileDeviceGeneral.SerialNumberKey, value: general.serialNumber)
    }
}
