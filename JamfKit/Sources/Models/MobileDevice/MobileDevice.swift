//
//  MobileDevice.swift
//  JamfKit
//
//  Copyright © 2018 JamfKit. All rights reserved.
//

import Foundation

/// Represents a Jamf managed mobile device, contains the general information about the device.
@objc(JMFKMobileDevice)
public final class MobileDevice: NSObject, Identifiable {

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
