//
//  Computer.swift
//  JAMFKit
//
//  Copyright © 2018 JAMFKit. All rights reserved.
//

/// Represents a Jamf managed computer, contains the general / location / purchasing information about the hardware.
public final class Computer: Identifiable, CustomStringConvertible {

    // MARK: - Constants

    static let GeneralKey = "general"
    static let LocationKey = "location"
    static let PurchasingKey = "purchasing"

    // MARK: - Properties

    public var general: ComputerGeneral
    public var location: ComputerLocation?
    public var purchasing: ComputerPurchasing?

    public var description: String {
        return "[\(String(describing: Computer.self))][\(general.identifier). \(general.name)]"
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

    // MARK: - Functions

    public func toJSON() -> [String: Any] {
        var json = [String: Any]()

        json[Computer.GeneralKey] = general.toJSON()

        if let location = location { json[Computer.LocationKey] = location.toJSON() }
        if let purchasing = purchasing { json[Computer.PurchasingKey] = purchasing.toJSON() }

        return json
    }
}
