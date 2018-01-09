//
//  MobileDeviceGroup.swift
//  JamfKit
//
//  Copyright © 2018 JamfKit. All rights reserved.
//

public final class MobileDeviceGroup: HardwareGroup {

    // MARK: - Constants

    static let MobileDevicesKey = "mobile_devices"

    // MARK: - Properties

    public var mobileDevices: [MobileDeviceGeneral]

    public override var description: String {
        return "[\(String(describing: MobileDeviceGroup.self))]\(super.description)"
    }

    // MARK: - Initialization

    public required init?(json: [String: Any], node: String = "") {
        mobileDevices = MobileDeviceGroup.parseMobileDevices(json: json)

        super.init(json: json)
    }

    // MARK: - Functions

    public override func toJSON() -> [String: Any] {
        var json = super.toJSON()

        if mobileDevices.count > 0 {
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
