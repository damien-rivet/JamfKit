//
//  Computer.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

/// Represents a Jamf managed computer, contains the general / location / purchasing information about the hardware.
@objc(JMFKComputer)
public final class Computer: NSObject, Codable, Requestable, Endpoint, Subset {

    // MARK: - Constants

    public static let Endpoint = "computers"

    enum CodingKeys: String, CodingKey {
        case general
        case location
        case purchasing
    }

    // MARK: - Properties

    @objc
    public var general: ComputerGeneral

    @objc
    public var location: ComputerLocation?

    @objc
    public var purchasing: ComputerPurchasing?

    public override var description: String {
        return "[\(String(describing: type(of: self)))][\(general.identifier) - \(general.name)]"
    }

    // MARK: - Initialization

    public init?(identifier: UInt, name: String) {
        guard let general = ComputerGeneral(identifier: identifier, name: name) else {
            return nil
        }

        self.general = general
        location = ComputerLocation()
        purchasing = ComputerPurchasing()

        super.init()
    }

    public required init?(json: [String: Any], node: String = "") {
        guard
            let generalNode = json[CodingKeys.general.rawValue] as? [String: Any],
            let general = ComputerGeneral(json: generalNode)
            else {
                return nil
        }

        self.general = general

        if let locationNode = json[CodingKeys.location.rawValue] as? [String: Any] {
            location = ComputerLocation(json: locationNode)
        }

        if let purchasingNode = json[CodingKeys.purchasing.rawValue] as? [String: Any] {
            purchasing = ComputerPurchasing(json: purchasingNode)
        }
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        general = try container.decode(ComputerGeneral.self, forKey: .general)
        location = try container.decode(ComputerLocation.self, forKey: .location)
        purchasing = try container.decode(ComputerPurchasing.self, forKey: .purchasing)
    }

    // MARK: - Functions

    public func toJSON() -> [String: Any] {
        var json = [String: Any]()

        json[CodingKeys.general.rawValue] = general.toJSON()

        if let location = location { json[CodingKeys.location.rawValue] = location.toJSON() }
        if let purchasing = purchasing { json[CodingKeys.purchasing.rawValue] = purchasing.toJSON() }

        return json
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(general, forKey: .general)
        try container.encode(location, forKey: .location)
        try container.encode(purchasing, forKey: .purchasing)
    }
}

// MARK: - Creatable

extension Computer: Creatable {

    public func createRequest() -> URLRequest? {
        return SessionManager.instance.createRequest(for: self, key: BaseObject.IdentifierKey, value: String(general.identifier))
    }
}

// MARK: - Readable

extension Computer: Readable {

    public static func readAllRequest() -> URLRequest? {
        return getReadAllRequest()
    }

    public static func readRequest(identifier: String) -> URLRequest? {
        return getReadRequest(identifier: identifier)
    }

    public func readRequest() -> URLRequest? {
        return Computer.readRequest(identifier: String(general.identifier))
    }

    /// Returns a GET **URLRequest** based on the supplied name.
    public static func readRequest(name: String) -> URLRequest? {
        return SessionManager.instance.readRequest(for: self, key: BaseObject.NameKey, value: name)
    }

    /// Returns a GET **URLRequest** based on the email.
    public func readRequestWithName() -> URLRequest? {
        return Computer.readRequest(name: general.name)
    }

    /// Returns a GET **URLRequest** based on the supplied udid.
    public static func readRequest(udid: String) -> URLRequest? {
        return SessionManager.instance.readRequest(for: self, key: ComputerGeneral.CodingKeys.udid.rawValue, value: udid)
    }

    /// Returns a GET **URLRequest** based on the supplied udid.
    public func readRequestWithUdid() -> URLRequest? {
        return Computer.readRequest(udid: general.udid)
    }

    /// Returns a GET **URLRequest** based on the supplied udid.
    public static func readRequest(serialNumber: String) -> URLRequest? {
        return SessionManager.instance.readRequest(for: self, key: ComputerGeneral.CodingKeys.serialNumber.rawValue, value: serialNumber)
    }

    /// Returns a GET **URLRequest** based on the supplied serial number.
    public func readRequestWithSerialNumber() -> URLRequest? {
        return Computer.readRequest(serialNumber: general.serialNumber)
    }

    /// Returns a GET **URLRequest** based on the supplied udid.
    public static func readRequest(macAddress: String) -> URLRequest? {
        return SessionManager.instance.readRequest(for: self, key: ComputerGeneral.CodingKeys.macAddress.rawValue, value: macAddress)
    }

    /// Returns a GET **URLRequest** based on the supplied mac address.
    public func readRequestWithMacAddress() -> URLRequest? {
        return Computer.readRequest(macAddress: general.macAddress)
    }
}

// MARK: - Updatable

extension Computer: Updatable {

    public func updateRequest() -> URLRequest? {
        return SessionManager.instance.updateRequest(for: self, key: BaseObject.IdentifierKey, value: String(general.identifier))
    }

    /// Returns a PUT **URLRequest** based on the name.
    public func updateRequestWithName() -> URLRequest? {
        return SessionManager.instance.updateRequest(for: self, key: BaseObject.NameKey, value: general.name)
    }

    /// Returns a PUT **URLRequest** based on the udid.
    public func updateRequestWithUdid() -> URLRequest? {
        return SessionManager.instance.updateRequest(for: self, key: ComputerGeneral.CodingKeys.udid.rawValue, value: general.udid)
    }

    /// Returns a PUT **URLRequest** based on the serial number.
    public func updateRequestWithSerialNumber() -> URLRequest? {
        return SessionManager.instance.updateRequest(for: self, key: ComputerGeneral.CodingKeys.serialNumber.rawValue, value: general.serialNumber)
    }

    /// Returns a PUT **URLRequest** based on the mac address.
    public func updateRequestWithMacAddress() -> URLRequest? {
        return SessionManager.instance.updateRequest(for: self, key: ComputerGeneral.CodingKeys.macAddress.rawValue, value: general.macAddress)
    }
}

// MARK: - Deletable

extension Computer: Deletable {

    public static func deleteRequest(identifier: String) -> URLRequest? {
        return getDeleteRequest(identifier: identifier)
    }

    public func deleteRequest() -> URLRequest? {
        return Computer.deleteRequest(identifier: String(general.identifier))
    }

    /// Returns a DELETE **URLRequest** based on the supplied name.
    public static func deleteRequest(name: String) -> URLRequest? {
        return SessionManager.instance.deleteRequest(for: self, key: BaseObject.NameKey, value: name)
    }

    /// Returns a DELETE **URLRequest** based on the name.
    public func deleteRequestWithName() -> URLRequest? {
        return Computer.deleteRequest(name: general.name)
    }

    /// Returns a DELETE **URLRequest** based on the supplied udid.
    public static func deleteRequest(udid: String) -> URLRequest? {
        return SessionManager.instance.deleteRequest(for: self, key: ComputerGeneral.CodingKeys.udid.rawValue, value: udid)
    }

    /// Returns a DELETE **URLRequest** based on the udid.
    public func deleteRequestWithUdid() -> URLRequest? {
        return Computer.deleteRequest(udid: general.udid)
    }

    /// Returns a DELETE **URLRequest** based on the supplied serial number.
    public static func deleteRequest(serialNumber: String) -> URLRequest? {
        return SessionManager.instance.deleteRequest(for: self, key: ComputerGeneral.CodingKeys.serialNumber.rawValue, value: serialNumber)
    }

    /// Returns a DELETE **URLRequest** based on the serial number.
    public func deleteRequestWithSerialNumber() -> URLRequest? {
        return Computer.deleteRequest(serialNumber: general.serialNumber)
    }

    /// Returns a DELETE **URLRequest** based on the supplied mac address.
    public static func deleteRequest(macAddress: String) -> URLRequest? {
        return SessionManager.instance.deleteRequest(for: self, key: ComputerGeneral.CodingKeys.macAddress.rawValue, value: macAddress)
    }

    /// Returns a DELETE **URLRequest** based on the mac address.
    public func deleteRequestWithMacAddress() -> URLRequest? {
        return Computer.deleteRequest(macAddress: general.macAddress)
    }
}
