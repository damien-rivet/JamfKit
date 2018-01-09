//
//  MobileDevice.swift
//  JamfKit
//
//  Copyright © 2018 JamfKit. All rights reserved.
//

/// Represents a Jamf managed mobile device, contains the general information about the device.
public final class MobileDevice: Identifiable, CustomStringConvertible {

    // MARK: - Constants

    static let GeneralKey = "general"

    // MARK: - Properties

    public var general: MobileDeviceGeneral

    public var description: String {
        return "[\(String(describing: MobileDevice.self))][\(general.identifier). \(general.name)]"
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
