//
//  MobileDevice.swift
//  JAMFKit
//
//  Copyright © 2018 JAMFKit. All rights reserved.
//

/// Represents a Jamf managed mobile device, contains the general information about the device.
public final class MobileDevice: Identifiable, CustomStringConvertible {

    // MARK: - Constants

    static let GeneralKey = "general"

    // MARK: - Properties

    public var general: MobileDeviceGeneral?

    public var description: String {
        let baseDescription = "[\(String(describing: MobileDevice.self))]"

        if let general = self.general {
            return "\(baseDescription)[\(general.identifier). \(general.name)]"
        }

        return baseDescription
    }

    // MARK: - Initialization

    public required init?(json: [String: Any], node: String = "") {
        if let generalNode = json[MobileDevice.GeneralKey] as? [String: Any] {
            general = MobileDeviceGeneral(json: generalNode)
        }
    }

    // MARK: - Functions

    public func toJSON() -> [String: Any] {
        var json = [String: Any]()

        if let general = general { json[MobileDevice.GeneralKey] = general.toJSON() }

        return json
    }
}
