//
//  MobileDeviceGroup.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

/// Represents a group of mobile devices managed by Jamf, contains grouping information.
@objc(JMFKMobileDeviceGroup)
public final class MobileDeviceGroup: HardwareGroup, Endpoint {

    // MARK: - Constants

    public static let Endpoint: String = "mobiledevicegroups"
    static let MobileDevicesKey = "mobile_devices"

    // MARK: - Properties

    @objc
    public var mobileDevices = [MobileDeviceGeneral]()

    // MARK: - Initialization

    public required init?(json: [String: Any], node: String = "") {
        mobileDevices = MobileDeviceGroup.parseMobileDevices(json: json)

        super.init(json: json)
    }

    public override init?(identifier: UInt, name: String) {
        super.init(identifier: identifier, name: name)
    }

    // MARK: - Functions

    public override func toJSON() -> [String: Any] {
        var json = super.toJSON()

        if !mobileDevices.isEmpty {
            json[MobileDeviceGroup.MobileDevicesKey] = mobileDevices.map { mobileDevice -> [String: [String: Any]] in
                return ["mobile_device": mobileDevice.toJSON()]
            }
        }

        return json
    }

    private static func parseMobileDevices(json: [String: Any]) -> [MobileDeviceGeneral] {
        return BaseObject.parseElements(from: json, nodeKey: MobileDeviceGroup.MobileDevicesKey, singleNodeKey: "mobile_device")
    }
}

// MARK: - Creatable

extension MobileDeviceGroup: Creatable {

    public func create() -> URLRequest? {
        return self.createRequest()
    }
}

// MARK: - Protocols

extension MobileDeviceGroup: Readable, Updatable, Deletable { }
