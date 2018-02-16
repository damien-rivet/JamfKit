//
//  MobileDevice.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

/// Represents a Jamf managed mobile device, contains the general information about the device.
@objc(JMFKMobileDevice)
public final class MobileDevice: NSObject, Requestable {

    // MARK: - Constants

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

    // MARK: - Functions

    public func toJSON() -> [String: Any] {
        var json = [String: Any]()

        json[MobileDevice.GeneralKey] = general.toJSON()

        return json
    }
}

// MARK: - Protocols

extension MobileDevice: Endpoint, Creatable {

    // MARK: - Constants

    public static var Endpoint: String = "mobiledevices"

    // MARK: - Functions

    public func create() -> URLRequest? {
        return SessionManager.instance.createRequest(for: self, key: BaseObject.CodingKeys.identifier.rawValue, value: String(general.identifier))
    }
}
