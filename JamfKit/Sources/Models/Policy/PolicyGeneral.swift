//
//  PolicyGeneral.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

@objc(JMFKPolicyGeneral)
public final class PolicyGeneral: BaseObject {

    // MARK: - Constants

    enum CodingKeys: String, CodingKey {
        case enabled = "enabled"
        case trigger = "trigger"
        case triggerCheckin = "trigger_checkin"
        case triggerEnrollmentComplete = "trigger_enrollment_complete"
        case triggerLogin = "trigger_login"
        case triggerLogout = "trigger_logout"
        case triggerNetworkStateChanged = "trigger_network_state_changed"
        case triggerStartup = "trigger_startup"
        case triggerOther = "trigger_other"
        case frequency = "frequency"
        case locationUserOnly = "location_user_only"
        case targetDrive = "target_drive"
        case offline = "offline"
        case category = "category"
        case dateTimeLimitations = "date_time_limitations"
        case networkLimitations = "network_limitations"
        case overrideDefaultSettings = "override_default_settings"
        case networkRequirements = "network_requirements"
        case site = "site"
    }

    // MARK: - Properties

    @objc
    public var isEnabled = false

    @objc
    public var trigger = ""

    @objc
    public var triggerCheckin = false

    @objc
    public var triggerEnrollmentComplete = false

    @objc
    public var triggerLogin = false

    @objc
    public var triggerLogout = false

    @objc
    public var triggerNetworkStateChanged = false

    @objc
    public var triggerStartup = false

    @objc
    public var triggerOther = ""

    @objc
    public var frequency = ""

    @objc
    public var locationUserOnly = false

    @objc
    public var targetDrive = ""

    @objc
    public var offline = false

    @objc
    public var category: Category?

    @objc
    public var dateTimeLimitations: PolicyDateTimeLimitations?

    @objc
    public var networkLimitations: PolicyNetworkLimitations?

    @objc
    public var overrideDefaultSettings: PolicyOverrideDefaultSettings?

    @objc
    public var networkRequirements = ""

    @objc
    public var site: Site?

    // MARK: - Initialization

    public override init?(identifier: UInt, name: String) {
        dateTimeLimitations = PolicyDateTimeLimitations()
        networkLimitations = PolicyNetworkLimitations()
        overrideDefaultSettings = PolicyOverrideDefaultSettings()

        super.init(identifier: identifier, name: name)
    }

    public required init?(json: [String: Any], node: String = "") {
        isEnabled = json[CodingKeys.enabled.rawValue] as? Bool ?? false
        trigger = json[CodingKeys.trigger.rawValue] as? String ?? ""
        triggerCheckin = json[CodingKeys.triggerCheckin.rawValue] as? Bool ?? false
        triggerEnrollmentComplete = json[CodingKeys.triggerEnrollmentComplete.rawValue] as? Bool ?? false
        triggerLogin = json[CodingKeys.triggerLogin.rawValue] as? Bool ?? false
        triggerLogout = json[CodingKeys.triggerLogout.rawValue] as? Bool ?? false
        triggerNetworkStateChanged = json[CodingKeys.triggerNetworkStateChanged.rawValue] as? Bool ?? false
        triggerStartup = json[CodingKeys.triggerStartup.rawValue] as? Bool ?? false
        triggerOther = json[CodingKeys.triggerOther.rawValue] as? String ?? ""
        frequency = json[CodingKeys.frequency.rawValue] as? String ?? ""
        locationUserOnly = json[CodingKeys.locationUserOnly.rawValue] as? Bool ?? false
        targetDrive = json[CodingKeys.targetDrive.rawValue] as? String ?? ""
        offline = json[CodingKeys.offline.rawValue] as? Bool ?? false

        if let categoryNode = json[CodingKeys.category.rawValue] as? [String: Any] {
            category = Category(json: categoryNode)
        }

        if let dataLimitationsNode = json[CodingKeys.dateTimeLimitations.rawValue] as? [String: Any] {
            dateTimeLimitations = PolicyDateTimeLimitations(json: dataLimitationsNode)
        }

        if let networkLimitationsNode = json[CodingKeys.networkLimitations.rawValue] as? [String: Any] {
            networkLimitations = PolicyNetworkLimitations(json: networkLimitationsNode)
        }

        if let overrideDefaultSettingsNode = json[CodingKeys.overrideDefaultSettings.rawValue] as? [String: Any] {
            overrideDefaultSettings = PolicyOverrideDefaultSettings(json: overrideDefaultSettingsNode)
        }

        networkRequirements = json[CodingKeys.networkRequirements.rawValue] as? String ?? ""

        if let siteNode = json[CodingKeys.site.rawValue] as? [String: Any] {
            site = Site(json: siteNode)
        }

        super.init(json: json)
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        isEnabled = try container.decode(Bool.self, forKey: .enabled)
        trigger = try container.decode(String.self, forKey: .trigger)
        triggerCheckin = try container.decode(Bool.self, forKey: .triggerCheckin)
        triggerEnrollmentComplete = try container.decode(Bool.self, forKey: .triggerEnrollmentComplete)
        triggerLogin = try container.decode(Bool.self, forKey: .triggerLogin)
        triggerLogout = try container.decode(Bool.self, forKey: .triggerLogout)
        triggerNetworkStateChanged = try container.decode(Bool.self, forKey: .triggerNetworkStateChanged)
        triggerStartup = try container.decode(Bool.self, forKey: .triggerStartup)
        triggerOther = try container.decode(String.self, forKey: .triggerOther)
        frequency = try container.decode(String.self, forKey: .frequency)
        locationUserOnly = try container.decode(Bool.self, forKey: .locationUserOnly)
        targetDrive = try container.decode(String.self, forKey: .targetDrive)
        offline = try container.decode(Bool.self, forKey: .offline)
        category = try container.decode(Category.self, forKey: .category)
        dateTimeLimitations = try container.decode(PolicyDateTimeLimitations.self, forKey: .dateTimeLimitations)
        networkLimitations = try container.decode(PolicyNetworkLimitations.self, forKey: .networkLimitations)
        overrideDefaultSettings = try container.decode(PolicyOverrideDefaultSettings.self, forKey: .overrideDefaultSettings)
        networkRequirements = try container.decode(String.self, forKey: .networkRequirements)
        site = try container.decode(Site.self, forKey: .site)

        try super.init(from: decoder)
    }

    // MARK: - Functions

    public override func toJSON() -> [String: Any] {
        var json = super.toJSON()

        json[CodingKeys.enabled.rawValue] = isEnabled
        json[CodingKeys.trigger.rawValue] = trigger
        json[CodingKeys.triggerCheckin.rawValue] = triggerCheckin
        json[CodingKeys.triggerEnrollmentComplete.rawValue] = triggerEnrollmentComplete
        json[CodingKeys.triggerLogin.rawValue] = triggerLogin
        json[CodingKeys.triggerLogout.rawValue] = triggerLogout
        json[CodingKeys.triggerNetworkStateChanged.rawValue] = triggerNetworkStateChanged
        json[CodingKeys.triggerStartup.rawValue] = triggerStartup
        json[CodingKeys.triggerOther.rawValue] = triggerOther
        json[CodingKeys.frequency.rawValue] = frequency
        json[CodingKeys.locationUserOnly.rawValue] = locationUserOnly
        json[CodingKeys.targetDrive.rawValue] = targetDrive
        json[CodingKeys.offline.rawValue] = offline

        if let category = category {
            json[CodingKeys.category.rawValue] = category.toJSON()
        }

        if let dateTimeLimitations = dateTimeLimitations {
            json[CodingKeys.dateTimeLimitations.rawValue] = dateTimeLimitations.toJSON()
        }

        if let networkLimitations = networkLimitations {
            json[CodingKeys.networkLimitations.rawValue] = networkLimitations.toJSON()
        }

        if let overrideDefaultSettings = overrideDefaultSettings {
            json[CodingKeys.overrideDefaultSettings.rawValue] = overrideDefaultSettings.toJSON()
        }

        json[CodingKeys.networkRequirements.rawValue] = networkRequirements

        if let site = site {
            json[CodingKeys.site.rawValue] = site.toJSON()
        }

        return json
    }

    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(isEnabled, forKey: .enabled)
        try container.encode(trigger, forKey: .trigger)
        try container.encode(triggerCheckin, forKey: .triggerCheckin)
        try container.encode(triggerEnrollmentComplete, forKey: .triggerEnrollmentComplete)
        try container.encode(triggerLogin, forKey: .triggerLogin)
        try container.encode(triggerLogout, forKey: .triggerLogout)
        try container.encode(triggerNetworkStateChanged, forKey: .triggerNetworkStateChanged)
        try container.encode(triggerStartup, forKey: .triggerStartup)
        try container.encode(triggerOther, forKey: .triggerOther)
        try container.encode(frequency, forKey: .frequency)
        try container.encode(locationUserOnly, forKey: .locationUserOnly)
        try container.encode(targetDrive, forKey: .targetDrive)
        try container.encode(offline, forKey: .offline)
        try container.encode(category, forKey: .category)
        try container.encode(dateTimeLimitations, forKey: .dateTimeLimitations)
        try container.encode(networkLimitations, forKey: .networkLimitations)
        try container.encode(overrideDefaultSettings, forKey: .overrideDefaultSettings)
        try container.encode(networkRequirements, forKey: .networkRequirements)
        try container.encode(site, forKey: .site)

        try super.encode(to: encoder)
    }
}
