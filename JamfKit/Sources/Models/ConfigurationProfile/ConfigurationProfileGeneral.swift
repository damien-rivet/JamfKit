//
//  ConfigurationProfileGeneral.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

@objc(JMFKConfigurationProfileGeneral)
public class ConfigurationProfileGeneral: BaseObject {

    // MARK: - Constants

    private enum CodingKeys: String, CodingKey {
        case description = "description"
        case site = "site"
        case category = "category"
        case uuid = "uuid"
        case redeployOnUpdate = "redeploy_on_update"
        case payloads = "payloads"
    }

    public static let DescriptionKey = CodingKeys.description.rawValue
    public static let SiteKey = CodingKeys.site.rawValue
    public static let CategoryKey = CodingKeys.category.rawValue
    public static let UuidKey = CodingKeys.uuid.rawValue
    public static let RedeployOnUpdateKey = CodingKeys.redeployOnUpdate.rawValue
    public static let PayloadsKey = CodingKeys.payloads.rawValue

    // MARK: - Properties

    @objc
    public var desc: String = ""

    @objc
    public var site: Site?

    @objc
    public var category: Category?

    @objc
    public var uuid: String = ""

    @objc
    public var redeployOnUpdate: String = ""

    @objc
    public var payloads: String = ""

    // MARK: - Initialization

    override init?(identifier: UInt, name: String) {
        super.init(identifier: identifier, name: name)
    }

    public required init?(json: [String: Any], node: String = "") {
        desc = json[CodingKeys.description.rawValue] as? String ?? ""

        if let siteNode = json[CodingKeys.site.rawValue] as? [String: Any] {
            site = Site(json: siteNode)
        }

        if let categoryNode = json[CodingKeys.category.rawValue] as? [String: Any] {
            category = Category(json: categoryNode)
        }

        uuid = json[CodingKeys.uuid.rawValue] as? String ?? ""
        redeployOnUpdate = json[CodingKeys.redeployOnUpdate.rawValue] as? String ?? ""
        payloads = json[CodingKeys.payloads.rawValue] as? String ?? ""

        super.init(json: json)
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        desc = try container.decode(String.self, forKey: .description)
        site = try container.decode(Site.self, forKey: .site)
        category = try container.decode(Category.self, forKey: .category)
        uuid = try container.decode(String.self, forKey: .uuid)
        redeployOnUpdate = try container.decode(String.self, forKey: .redeployOnUpdate)
        payloads = try container.decode(String.self, forKey: .payloads)

        try super.init(from: decoder)
    }

    // MARK: - Functions

    public override func toJSON() -> [String: Any] {
        var json = super.toJSON()

        json[CodingKeys.description.rawValue] = desc

        if let site = site {
            json[CodingKeys.site.rawValue] = site.toJSON()
        }

        if let category = category {
            json[CodingKeys.category.rawValue] = category.toJSON()
        }

        json[CodingKeys.uuid.rawValue] = uuid
        json[CodingKeys.redeployOnUpdate.rawValue] = redeployOnUpdate
        json[CodingKeys.payloads.rawValue] = payloads

        return json
    }

    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(desc, forKey: .description)
        try container.encode(site, forKey: .site)
        try container.encode(category, forKey: .category)
        try container.encode(uuid, forKey: .uuid)
        try container.encode(redeployOnUpdate, forKey: .redeployOnUpdate)
        try container.encode(payloads, forKey: .payloads)

        try super.encode(to: encoder)
    }
}
