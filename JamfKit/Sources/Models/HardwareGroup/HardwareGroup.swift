//
//  HardwareGroup.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

@objc(JMFKHardwareGroup)
public class HardwareGroup: BaseObject {

    // MARK: - Constants

    private enum CodingKeys: String, CodingKey {
        case isSmart = "is_smart"
        case criteria = "criteria"
        case site = "site"
    }

    public static let IsSmartKey = CodingKeys.isSmart.rawValue
    public static let CriteriaKey = CodingKeys.criteria.rawValue
    public static let SiteKey = CodingKeys.site.rawValue

    // MARK: - Properties

    @objc
    public var isSmart = false

    @objc
    public var criteria = [HardwareGroupCriterion]()

    @objc
    public var site: Site?

    // MARK: - Initialization

    override init?(identifier: UInt, name: String) {
        super.init(identifier: identifier, name: name)
    }

    public required init?(json: [String: Any], node: String = "") {
        isSmart = json[CodingKeys.isSmart.rawValue] as? Bool ?? false
        criteria = HardwareGroup.parseCriteria(json: json)

        if let siteNode = json[CodingKeys.site.rawValue] as? [String: Any] {
            site = Site(json: siteNode)
        }

        super.init(json: json)
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        isSmart = try container.decode(Bool.self, forKey: .isSmart)
        site = try container.decode(Site.self, forKey: .site)

        let rawCriterions = try? container.decode([HardwareGroupCriterion].self, forKey: .criteria)
        let rawCriterion = try? container.decode(HardwareGroupCriterion.self, forKey: .criteria)

        if let rawCriterions = rawCriterions {
            self.criteria = rawCriterions
        } else if let criterion = rawCriterion {
            self.criteria = [criterion]
        }

        try super.init(from: decoder)
    }

    // MARK: - Functions

    public override func toJSON() -> [String: Any] {
        var json = super.toJSON()

        json[CodingKeys.isSmart.rawValue] = isSmart

        if !criteria.isEmpty {
            let criterions = criteria.map { criterion -> [String: [String: Any]] in
                return ["criterion": criterion.toJSON()]
            }

            json[CodingKeys.criteria.rawValue] = criterions
        }

        if let site = site {
            json[CodingKeys.site.rawValue] = site.toJSON()
        }

        return json
    }

    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(isSmart, forKey: .isSmart)
        try container.encode(criteria, forKey: .criteria)
        try container.encode(site, forKey: .site)

        try super.encode(to: encoder)
    }

    private static func parseCriteria(json: [String: Any]) -> [HardwareGroupCriterion] {
        return BaseObject.parseElements(from: json, nodeKey: CodingKeys.criteria.rawValue, singleNodeKey: "criterion")
    }
}
