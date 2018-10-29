//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

@objc(JMFKHardwareGroup)
public class HardwareGroup: BaseObject {

    // MARK: - Constants

    static let IsSmartKey = "is_smart"
    static let CriteriaKey = "criteria"
    static let SiteKey = "site"

    // MARK: - Properties

    @objc
    public var isSmart = false

    @objc
    public var criteria = [HardwareGroupCriterion]()

    @objc
    public var site: Site?

    // MARK: - Initialization

    public required init?(json: [String: Any], node: String = "") {
        isSmart = json[HardwareGroup.IsSmartKey] as? Bool ?? false
        criteria = HardwareGroup.parseCriteria(json: json)

        if let siteNode = json[HardwareGroup.SiteKey] as? [String: Any] {
            site = Site(json: siteNode)
        }

        super.init(json: json)
    }

    override init?(identifier: UInt, name: String) {
        super.init(identifier: identifier, name: name)
    }

    // MARK: - Functions

    public override func toJSON() -> [String: Any] {
        var json = super.toJSON()

        json[MobileDeviceGroup.IsSmartKey] = isSmart

        if !criteria.isEmpty {
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
}
