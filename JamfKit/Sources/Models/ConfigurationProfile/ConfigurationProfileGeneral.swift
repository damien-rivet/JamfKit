//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

@objc(JMFKConfigurationProfileGeneral)
public class ConfigurationProfileGeneral: BaseObject {

    // MARK: - Constants

    static let DescriptionKey = "description"
    static let SiteKey = "site"
    static let CategoryKey = "category"
    static let UuidKey = "uuid"
    static let RedeployOnUpdateKey = "redeploy_on_update"
    static let PayloadsKey = "payloads"

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

    public required init?(json: [String: Any], node: String = "") {
        desc = json[ConfigurationProfileGeneral.DescriptionKey] as? String ?? ""

        if let siteNode = json[ConfigurationProfileGeneral.SiteKey] as? [String: Any] {
            site = Site(json: siteNode)
        }

        if let categoryNode = json[ConfigurationProfileGeneral.CategoryKey] as? [String: Any] {
            category = Category(json: categoryNode)
        }

        uuid = json[ConfigurationProfileGeneral.UuidKey] as? String ?? ""
        redeployOnUpdate = json[ConfigurationProfileGeneral.RedeployOnUpdateKey] as? String ?? ""
        payloads = json[ConfigurationProfileGeneral.PayloadsKey] as? String ?? ""

        super.init(json: json)
    }

    override init?(identifier: UInt, name: String) {
        super.init(identifier: identifier, name: name)
    }

    // MARK: - Functions

    public override func toJSON() -> [String: Any] {
        var json = super.toJSON()

        json[ConfigurationProfileGeneral.DescriptionKey] = desc

        if let site = site {
            json[ConfigurationProfileGeneral.SiteKey] = site.toJSON()
        }

        if let category = category {
            json[ConfigurationProfileGeneral.CategoryKey] = category.toJSON()
        }

        json[ConfigurationProfileGeneral.UuidKey] = uuid
        json[ConfigurationProfileGeneral.RedeployOnUpdateKey] = redeployOnUpdate
        json[ConfigurationProfileGeneral.PayloadsKey] = payloads

        return json
    }
}
