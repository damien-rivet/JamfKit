//
//  Computer.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

/// Represents a Jamf managed computer, contains the general / location / purchasing information about the hardware.
@objc(JMFKComputer)
public final class Computer: NSObject, Requestable, Endpoint, Subset {

    // MARK: - Constants

    public static let Endpoint: String = "computers"
    static let GeneralKey = "general"
    static let LocationKey = "location"
    static let PurchasingKey = "purchasing"

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

    public required init?(json: [String: Any], node: String = "") {
        guard
            let generalNode = json[Computer.GeneralKey] as? [String: Any],
            let general = ComputerGeneral(json: generalNode)
            else {
                return nil
        }

        self.general = general

        if let locationNode = json[Computer.LocationKey] as? [String: Any] {
            location = ComputerLocation(json: locationNode)
        }

        if let purchasingNode = json[Computer.PurchasingKey] as? [String: Any] {
            purchasing = ComputerPurchasing(json: purchasingNode)
        }
    }

    public init?(identifier: UInt, name: String) {
        guard let general = ComputerGeneral(identifier: identifier, name: name) else {
            return nil
        }

        self.general = general
        location = ComputerLocation()
        purchasing = ComputerPurchasing()

        super.init()
    }

    // MARK: - Functions

    public func toJSON() -> [String: Any] {
        var json = [String: Any]()

        json[Computer.GeneralKey] = general.toJSON()

        if let location = location { json[Computer.LocationKey] = location.toJSON() }
        if let purchasing = purchasing { json[Computer.PurchasingKey] = purchasing.toJSON() }

        return json
    }
}

// MARK: - Creatable

extension Computer: Creatable {

    public func create() -> URLRequest? {
        return SessionManager.instance.createRequest(for: self, key: BaseObject.CodingKeys.identifier.rawValue, value: String(general.identifier))
    }
}

// MARK: - Readable

extension Computer: Readable {

    public func read() -> URLRequest? {
        return Computer.read(identifier: String(general.identifier))
    }

    public func readWithName() -> URLRequest? {
        return SessionManager.instance.readRequest(for: self, key: BaseObject.CodingKeys.name.rawValue, value: general.name)
    }

    public func readWithUdid() -> URLRequest? {
        return SessionManager.instance.readRequest(for: self, key: ComputerGeneral.UDIDKey, value: general.udid)
    }

    public func readWithSerialNumber() -> URLRequest? {
        return SessionManager.instance.readRequest(for: self, key: ComputerGeneral.SerialNumberKey, value: general.serialNumber)
    }

    public func readWithMacAddress() -> URLRequest? {
        return SessionManager.instance.readRequest(for: self, key: ComputerGeneral.MacAddressKey, value: general.macAddress)
    }
}

// MARK: - Updatable

extension Computer: Updatable {

    public func update() -> URLRequest? {
        return SessionManager.instance.updateRequest(for: self, key: BaseObject.CodingKeys.identifier.rawValue, value: String(general.identifier))
    }

    public func updateWithName() -> URLRequest? {
        return SessionManager.instance.updateRequest(for: self, key: BaseObject.CodingKeys.name.rawValue, value: general.name)
    }

    public func updateWithUdid() -> URLRequest? {
        return SessionManager.instance.updateRequest(for: self, key: ComputerGeneral.UDIDKey, value: general.udid)
    }

    public func updateWithSerialNumber() -> URLRequest? {
        return SessionManager.instance.updateRequest(for: self, key: ComputerGeneral.SerialNumberKey, value: general.serialNumber)
    }

    public func updateWithMacAddress() -> URLRequest? {
        return SessionManager.instance.updateRequest(for: self, key: ComputerGeneral.MacAddressKey, value: general.macAddress)
    }
}

// MARK: - Deletable

extension Computer: Deletable {

    public func delete() -> URLRequest? {
        return Computer.delete(identifier: String(general.identifier))
    }

    public func deleteWithName() -> URLRequest? {
        return SessionManager.instance.deleteRequest(for: self, key: BaseObject.CodingKeys.name.rawValue, value: general.name)
    }

    public func deleteWithUdid() -> URLRequest? {
        return SessionManager.instance.deleteRequest(for: self, key: ComputerGeneral.UDIDKey, value: general.udid)
    }

    public func deleteWithSerialNumber() -> URLRequest? {
        return SessionManager.instance.deleteRequest(for: self, key: ComputerGeneral.SerialNumberKey, value: general.serialNumber)
    }

    public func deleteWithMacAddress() -> URLRequest? {
        return SessionManager.instance.deleteRequest(for: self, key: ComputerGeneral.MacAddressKey, value: general.macAddress)
    }
}
