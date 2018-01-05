//
//  MobileDeviceGroup.swift
//  JamfKit
//
//  Copyright © 2018 JamfKit. All rights reserved.
//

public final class MobileDeviceGroup: BaseObject {

    // MARK: - Constants

    static let IsSmartKey = "is_smart"
    static let CriteriaKey = "criteria"
    static let SiteKey = "site"
    static let MobileDevicesKey = "mobile_devices"

    // MARK: - Properties

    public var isSmart: Bool
    public var criteria: [MobileDeviceGroupCriterion]
    public var site: Site?
    public var mobileDevices: [MobileDevice]

    public override var description: String {
        return "[\(String(describing: MobileDeviceGroup.self))]\(super.description)"
    }

    // MARK: - Initialization

    public required init?(json: [String: Any], node: String = "") {
        isSmart = json[MobileDeviceGroup.IsSmartKey] as? Bool ?? false
        criteria = MobileDeviceGroup.parseCriteria(json: json)
        site = MobileDeviceGroup.parseSite(from: json)
        mobileDevices = MobileDeviceGroup.parseMobileDevices(json: json)

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

        if mobileDevices.count > 0 {
            json[MobileDeviceGroup.MobileDevicesKey] = mobileDevices.map { mobileDevice -> [String: [String: Any]] in
                return ["mobile_device": mobileDevice.toJSON()]
            }
        }

        return json
    }

    private static func parseCriteria(json: [String: Any]) -> [MobileDeviceGroupCriterion] {
        var criterions = [MobileDeviceGroupCriterion]()

        guard let criteriaNode = json[MobileDeviceGroup.CriteriaKey] as? [[String: [String: Any]]] else {
            return criterions
        }

        let newCriterions = criteriaNode.map { $0["criterion"] }.flatMap { rawCriterionNode -> MobileDeviceGroupCriterion? in
            guard let rawCriterion = rawCriterionNode else {
                return nil
            }

            return MobileDeviceGroupCriterion(json: rawCriterion)
        }

        criterions.append(contentsOf: newCriterions)

        return criterions
    }

    private static func parseSite(from json: [String: Any]) -> Site? {
        guard
            let rawSite = json[MobileDeviceGroup.SiteKey] as? [String: Any],
            let site = Site(json: rawSite) else {
                return nil
        }

        return site
    }

    static func parseMobileDevices(json: [String: Any]) -> [MobileDevice] {
        var mobileDevices = [MobileDevice]()

        guard let mobileDevicesNode = json[MobileDeviceGroup.MobileDevicesKey] as? [[String: [String: Any]]] else {
            return mobileDevices
        }

        let newMobileDevices = mobileDevicesNode.map { $0["mobile_device"] }.flatMap { rawMobileDeviceNode -> MobileDevice? in
            guard let rawMobileDevice = rawMobileDeviceNode else {
                return nil
            }

            return MobileDevice(json: rawMobileDevice)
        }

        mobileDevices.append(contentsOf: newMobileDevices)

        return mobileDevices
    }
}
