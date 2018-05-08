//
//  MobileDevice.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

/// Represents a Jamf managed mobile device, contains the general information about the device.
@objc(JMFKMobileDevice)
public final class MobileDevice: NSObject, Codable, Requestable, Endpoint, Subset {

    // MARK: - Constants

    public static let Endpoint = "mobiledevices"

    enum CodingKeys: String, CodingKey {
        case general
    }

    // MARK: - Properties

    @objc
    public var general: MobileDeviceGeneral

    public override var description: String {
        return "[\(String(describing: type(of: self)))][\(general.identifier) - \(general.name)]"
    }

    // MARK: - Initialization

    public init?(identifier: UInt, name: String) {
        guard let general = MobileDeviceGeneral(identifier: identifier, name: name) else {
            return nil
        }

        self.general = general
    }

    public required init?(json: [String: Any], node: String = "") {
        guard
            let generalNode = json[CodingKeys.general.rawValue] as? [String: Any],
            let general = MobileDeviceGeneral(json: generalNode)
            else {
                return nil
        }

        self.general = general
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        general = try container.decode(MobileDeviceGeneral.self, forKey: .general)
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

extension MobileDevice: Creatable {

    public func createRequest() -> URLRequest? {
        return SessionManager.instance.createRequest(for: self, key: BaseObject.IdentifierKey, value: String(general.identifier))
    }
}

// MARK: - Readable

extension MobileDevice: Readable {

    public static func readAllRequest() -> URLRequest? {
        return getReadAllRequest()
    }

    public static func readRequest(identifier: String) -> URLRequest? {
        return getReadRequest(identifier: identifier)
    }

    public func readRequest() -> URLRequest? {
        return MobileDevice.readRequest(identifier: String(general.identifier))
    }

    /// Returns a GET **URLRequest** based on the supplied name.
    public static func readRequest(name: String) -> URLRequest? {
        return SessionManager.instance.readRequest(for: self, key: BaseObject.NameKey, value: name)
    }

    /// Returns a GET **URLRequest** based on the email.
    public func readRequestWithName() -> URLRequest? {
        return MobileDevice.readRequest(name: general.name)
    }

    /// Returns a GET **URLRequest** based on the supplied udid.
    public static func readRequest(udid: String) -> URLRequest? {
        return SessionManager.instance.readRequest(for: self, key: ComputerGeneral.CodingKeys.udid.rawValue, value: udid)
    }

    /// Returns a GET **URLRequest** based on the supplied udid.
    public func readRequestWithUdid() -> URLRequest? {
        return MobileDevice.readRequest(udid: general.udid)
    }

    /// Returns a GET **URLRequest** based on the supplied udid.
    public static func readRequest(serialNumber: String) -> URLRequest? {
        return SessionManager.instance.readRequest(for: self, key: ComputerGeneral.CodingKeys.serialNumber.rawValue, value: serialNumber)
    }

    /// Returns a GET **URLRequest** based on the supplied serial number.
    public func readRequestWithSerialNumber() -> URLRequest? {
        return MobileDevice.readRequest(serialNumber: general.serialNumber)
    }
}

// MARK: - Updatable

extension MobileDevice: Updatable {

    public func updateRequest() -> URLRequest? {
        return SessionManager.instance.updateRequest(for: self, key: BaseObject.IdentifierKey, value: String(general.identifier))
    }

    /// Returns a PUT **URLRequest** based on the name.
    public func updateRequestWithName() -> URLRequest? {
        return SessionManager.instance.updateRequest(for: self, key: BaseObject.NameKey, value: general.name)
    }

    /// Returns a PUT **URLRequest** based on the udid.
    public func updateRequestWithUdid() -> URLRequest? {
        return SessionManager.instance.updateRequest(for: self, key: MobileDeviceGeneral.UDIDKey, value: general.udid)
    }

    /// Returns a PUT **URLRequest** based on the serial number.
    public func updateRequestWithSerialNumber() -> URLRequest? {
        return SessionManager.instance.updateRequest(for: self, key: MobileDeviceGeneral.SerialNumberKey, value: general.serialNumber)
    }
}

// MARK: - Deletable

extension MobileDevice: Deletable {

    public static func deleteRequest(identifier: String) -> URLRequest? {
        return getDeleteRequest(identifier: identifier)
    }

    public func deleteRequest() -> URLRequest? {
        return MobileDevice.deleteRequest(identifier: String(general.identifier))
    }

    /// Returns a DELETE **URLRequest** based on the supplied name.
    public static func deleteRequest(name: String) -> URLRequest? {
        return SessionManager.instance.deleteRequest(for: self, key: BaseObject.NameKey, value: name)
    }

    /// Returns a DELETE **URLRequest** based on the name.
    public func deleteRequestWithName() -> URLRequest? {
        return MobileDevice.deleteRequest(name: general.name)
    }

    /// Returns a DELETE **URLRequest** based on the supplied udid.
    public static func deleteRequest(udid: String) -> URLRequest? {
        return SessionManager.instance.deleteRequest(for: self, key: ComputerGeneral.CodingKeys.udid.rawValue, value: udid)
    }

    /// Returns a DELETE **URLRequest** based on the udid.
    public func deleteRequestWithUdid() -> URLRequest? {
        return MobileDevice.deleteRequest(udid: general.udid)
    }

    /// Returns a DELETE **URLRequest** based on the supplied serial number.
    public static func deleteRequest(serialNumber: String) -> URLRequest? {
        return SessionManager.instance.deleteRequest(for: self, key: ComputerGeneral.CodingKeys.serialNumber.rawValue, value: serialNumber)
    }

    /// Returns a DELETE **URLRequest** based on the serial number.
    public func deleteRequestWithSerialNumber() -> URLRequest? {
        return MobileDevice.deleteRequest(serialNumber: general.serialNumber)
    }
}
