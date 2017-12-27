//
//  Hardware.swift
//  JamfKit
//
//  Copyright © 2017 JamfKit. All rights reserved.
//

public class Hardware: Identifiable {

    // MARK: - Constants

    static let GeneralKey = "general"
    static let LocationKey = "location"
    static let PurchasingKey = "purchasing"

    // MARK: - Properties

    public var general: HardwareGeneral?
    public var location: HardwareLocation?
    public var purchasing: HardwarePurchasing?

    // MARK: - Initialization

    public required init?(json: [String : Any], node: String = "") {
        self.general = HardwareGeneral(json: json, node: Hardware.GeneralKey)
        self.location = HardwareLocation(json: json, node: Hardware.LocationKey)
        self.purchasing = HardwarePurchasing(json: json, node: Hardware.PurchasingKey)
    }

    // MARK: - Functions

    func toJSON() -> [String : Any] {
        var json = [String: Any]()

        if let general = general { json[Hardware.GeneralKey] = general.toJSON() }
        if let location = location { json[Hardware.LocationKey] = location.toJSON() }
        if let purchasing = purchasing { json[Hardware.PurchasingKey] = purchasing.toJSON() }

        return json
    }
}
