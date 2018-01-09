//
//  HardwareGroup.swift
//  JamfKit
//
//  Copyright © 2018 JamfKit. All rights reserved.
//

public class HardwareGroup: BaseObject {
    // MARK: - Constants

    static let IsSmartKey = "is_smart"
    static let CriteriaKey = "criteria"
    static let SiteKey = "site"

    // MARK: - Properties

    public var isSmart: Bool
    public var criteria: [HardwareGroupCriterion]
    public var site: Site?

    // MARK: - Initialization

    public required init?(json: [String: Any], node: String = "") {
        isSmart = json[HardwareGroup.IsSmartKey] as? Bool ?? false
        criteria = HardwareGroup.parseCriteria(json: json)
        site = HardwareGroup.parseSite(from: json)

        super.init(json: json)
    }

    // MARK: - Functions

    public override func toJSON() -> [String: Any] {
        var json = super.toJSON()

        json[MobileDeviceGroup.IsSmartKey] = isSmart

        if criteria.count > 0 {
            let criterions = criteria.map { criterion -> [String: [String: Any]] in
                return ["criterion": criterion.toJSON()]
            }

            json[MobileDeviceGroup.CriteriaKey] = criterions
        }

        if let site = site {
            json[MobileDeviceGroup.SiteKey] = site.toJSON()
        }

        return json
    }

    private static func parseCriteria(json: [String: Any]) -> [HardwareGroupCriterion] {
        return BaseObject.parseElements(from: json, nodeKey: MobileDeviceGroup.CriteriaKey, singleNodeKey: "criterion")
    }

    private static func parseSite(from json: [String: Any]) -> Site? {
        guard
            let rawSite = json[MobileDeviceGroup.SiteKey] as? [String: Any],
            let site = Site(json: rawSite) else {
                return nil
        }

        return site
    }
}
