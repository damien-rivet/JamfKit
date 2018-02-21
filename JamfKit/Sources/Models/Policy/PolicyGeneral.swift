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

    static let EnabledKey = "enabled"
    static let TriggerKey = "trigger"
    static let TriggerCheckinKey = "trigger_checkin"
    static let TriggerEnrollmentCompleteKey = "trigger_enrollment_complete"
    static let TriggerLoginKey = "trigger_login"
    static let TriggerLogoutKey = "trigger_logout"
    static let TriggerNetworkStateChangedKey = "trigger_network_state_changed"
    static let TriggerStartupKey = "trigger_startup"
    static let TriggerOtherKey = "trigger_other"
    static let FrequencyKey = "frequency"
    static let LocationUserOnlyKey = "location_user_only"
    static let TargetDriveKey = "target_drive"
    static let OfflineKey = "offline"
    static let CategoryKey = "category"
    static let DateTimeLimitationsKey = "date_time_limitations"
    static let NetworkLimitationsKey = "network_limitations"
    static let OverrideDefaultSettingsKey = "override_default_settings"
    static let NetworkRequirementsKey = "network_requirements"
    static let SiteKey = "site"

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
    public var category: PolicyCategory?

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

    public required init?(json: [String: Any], node: String = "") {
        isEnabled = json[PolicyGeneral.EnabledKey] as? Bool ?? false
        trigger = json[PolicyGeneral.TriggerKey] as? String ?? ""
        triggerCheckin = json[PolicyGeneral.TriggerCheckinKey] as? Bool ?? false
        triggerEnrollmentComplete = json[PolicyGeneral.TriggerEnrollmentCompleteKey] as? Bool ?? false
        triggerLogin = json[PolicyGeneral.TriggerLoginKey] as? Bool ?? false
        triggerLogout = json[PolicyGeneral.TriggerLogoutKey] as? Bool ?? false
        triggerNetworkStateChanged = json[PolicyGeneral.TriggerNetworkStateChangedKey] as? Bool ?? false
        triggerStartup = json[PolicyGeneral.TriggerStartupKey] as? Bool ?? false
        triggerOther = json[PolicyGeneral.TriggerOtherKey] as? String ?? ""
        frequency = json[PolicyGeneral.FrequencyKey] as? String ?? ""
        locationUserOnly = json[PolicyGeneral.LocationUserOnlyKey] as? Bool ?? false
        targetDrive = json[PolicyGeneral.TargetDriveKey] as? String ?? ""
        offline = json[PolicyGeneral.OfflineKey] as? Bool ?? false

        if let categoryNode = json[PolicyGeneral.CategoryKey] as? [String: Any] {
            category = PolicyCategory(json: categoryNode)
        }

        if let dataLimitationsNode = json[PolicyGeneral.DateTimeLimitationsKey] as? [String: Any] {
            dateTimeLimitations = PolicyDateTimeLimitations(json: dataLimitationsNode)
        }

        if let networkLimitationsNode = json[PolicyGeneral.NetworkLimitationsKey] as? [String: Any] {
            networkLimitations = PolicyNetworkLimitations(json: networkLimitationsNode)
        }

        if let overrideDefaultSettingsNode = json[PolicyGeneral.OverrideDefaultSettingsKey] as? [String: Any] {
            overrideDefaultSettings = PolicyOverrideDefaultSettings(json: overrideDefaultSettingsNode)
        }

        networkRequirements = json[PolicyGeneral.NetworkRequirementsKey] as? String ?? ""

        if let siteNode = json[PolicyGeneral.SiteKey] as? [String: Any] {
            site = Site(json: siteNode)
        }

        super.init(json: json)
    }

    public override init?(identifier: UInt, name: String) {
        dateTimeLimitations = PolicyDateTimeLimitations()
        networkLimitations = PolicyNetworkLimitations()
        overrideDefaultSettings = PolicyOverrideDefaultSettings()

        super.init(identifier: identifier, name: name)
    }

    // MARK: - Functions

    public override func toJSON() -> [String: Any] {
        var json = super.toJSON()

        json[PolicyGeneral.EnabledKey] = isEnabled
        json[PolicyGeneral.TriggerKey] = trigger
        json[PolicyGeneral.TriggerCheckinKey] = triggerCheckin
        json[PolicyGeneral.TriggerEnrollmentCompleteKey] = triggerEnrollmentComplete
        json[PolicyGeneral.TriggerLoginKey] = triggerLogin
        json[PolicyGeneral.TriggerLogoutKey] = triggerLogout
        json[PolicyGeneral.TriggerNetworkStateChangedKey] = triggerNetworkStateChanged
        json[PolicyGeneral.TriggerStartupKey] = triggerStartup
        json[PolicyGeneral.TriggerOtherKey] = triggerOther
        json[PolicyGeneral.FrequencyKey] = frequency
        json[PolicyGeneral.LocationUserOnlyKey] = locationUserOnly
        json[PolicyGeneral.TargetDriveKey] = targetDrive
        json[PolicyGeneral.OfflineKey] = offline

        if let category = category {
            json[PolicyGeneral.CategoryKey] = category.toJSON()
        }

        if let dateTimeLimitations = dateTimeLimitations {
            json[PolicyGeneral.DateTimeLimitationsKey] = dateTimeLimitations.toJSON()
        }

        if let networkLimitations = networkLimitations {
            json[PolicyGeneral.NetworkLimitationsKey] = networkLimitations.toJSON()
        }

        if let overrideDefaultSettings = overrideDefaultSettings {
            json[PolicyGeneral.OverrideDefaultSettingsKey] = overrideDefaultSettings.toJSON()
        }

        json[PolicyGeneral.NetworkRequirementsKey] = networkRequirements

        if let site = site {
            json[PolicyGeneral.SiteKey] = site.toJSON()
        }

        return json
    }
}
