//
//  Package.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

/// Represents a logical application package, contains information about the application requirements and capabilities.
@objc(JMFKPackage)
public final class Package: BaseObject {

    // MARK: - Constants

    enum CodingKeys: String, CodingKey {
        case category = "category"
        case filename = "filename"
        case information = "info"
        case notes = "notes"
        case priority = "priority"
        case rebootRequired = "reboot_required"
        case fillUserTemplate = "fill_user_template"
        case fillExistingUsers = "fill_existing_users"
        case bootVolumeRequired = "boot_volume_required"
        case allowUninstalled = "allow_uninstalled"
        case osRequirements = "os_requirements"
        case requiredProcessor = "required_processor"
        case switchWithPackage = "switch_with_package"
        case installIfReportedUnavailable = "install_if_reported_available"
        case reinstallOption = "reinstall_option"
        case triggeringFiles = "triggering_files"
        case sendNotification = "send_notification"
    }

    // MARK: - Properties

    @objc
    public var category = ""

    @objc
    public var filename = ""

    @objc
    public var information = ""

    @objc
    public var notes = ""

    @objc
    public var priority: UInt = 0

    @objc
    public var isRebootRequired = false

    @objc
    public var shouldFillUserTemplate = false

    @objc
    public var shouldFillExistingUsers = false

    @objc
    public var isBootVolumeRequired = false

    @objc
    public var allowsUninstallation = false

    @objc
    public var osRequirements = ""

    @objc
    public var requiredProcessor = ""

    @objc
    public var switchWithPackage = ""

    @objc
    public var shouldInstallIfReportedAvailable = false

    @objc
    public var reinstallOption = ""

    @objc
    public var triggeringFiles = ""

    @objc
    public var shouldSendNotificaton = false

    // MARK: - Initialization

    public override init?(identifier: UInt, name: String) {
        super.init(identifier: identifier, name: name)
    }

    public required init?(json: [String: Any], node: String = "") {
        category = json[CodingKeys.category.rawValue] as? String ?? ""
        filename = json[CodingKeys.filename.rawValue] as? String ?? ""
        information = json[CodingKeys.information.rawValue] as? String ?? ""
        notes = json[CodingKeys.notes.rawValue] as? String ?? ""
        priority = json[CodingKeys.priority.rawValue] as? UInt ?? 0
        isRebootRequired = json[CodingKeys.rebootRequired.rawValue] as? Bool ?? false
        shouldFillUserTemplate = json[CodingKeys.fillUserTemplate.rawValue] as? Bool ?? false
        shouldFillExistingUsers = json[CodingKeys.fillExistingUsers.rawValue] as? Bool ?? false
        isBootVolumeRequired = json[CodingKeys.bootVolumeRequired.rawValue] as? Bool ?? false
        allowsUninstallation = json[CodingKeys.allowUninstalled.rawValue] as? Bool ?? false
        osRequirements = json[CodingKeys.osRequirements.rawValue] as? String ?? ""
        requiredProcessor = json[CodingKeys.requiredProcessor.rawValue] as? String ?? ""
        switchWithPackage = json[CodingKeys.switchWithPackage.rawValue] as? String ?? ""
        shouldInstallIfReportedAvailable = json[CodingKeys.installIfReportedUnavailable.rawValue] as? Bool ?? false
        reinstallOption = json[CodingKeys.reinstallOption.rawValue] as? String ?? ""
        triggeringFiles = json[CodingKeys.triggeringFiles.rawValue] as? String ?? ""
        shouldSendNotificaton = json[CodingKeys.sendNotification.rawValue] as? Bool ?? false

        super.init(json: json)
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        category = try container.decode(String.self, forKey: .category)
        filename = try container.decode(String.self, forKey: .filename)
        information = try container.decode(String.self, forKey: .information)
        notes = try container.decode(String.self, forKey: .notes)
        priority = try container.decode(UInt.self, forKey: .priority)
        isRebootRequired = try container.decode(Bool.self, forKey: .rebootRequired)
        shouldFillUserTemplate = try container.decode(Bool.self, forKey: .fillUserTemplate)
        shouldFillExistingUsers = try container.decode(Bool.self, forKey: .fillExistingUsers)
        isBootVolumeRequired = try container.decode(Bool.self, forKey: .bootVolumeRequired)
        allowsUninstallation = try container.decode(Bool.self, forKey: .allowUninstalled)
        osRequirements = try container.decode(String.self, forKey: .osRequirements)
        requiredProcessor = try container.decode(String.self, forKey: .requiredProcessor)
        switchWithPackage = try container.decode(String.self, forKey: .switchWithPackage)
        shouldInstallIfReportedAvailable = try container.decode(Bool.self, forKey: .installIfReportedUnavailable)
        reinstallOption = try container.decode(String.self, forKey: .reinstallOption)
        triggeringFiles = try container.decode(String.self, forKey: .triggeringFiles)
        shouldSendNotificaton = try container.decode(Bool.self, forKey: .sendNotification)

        try super.init(from: decoder)
    }

    // MARK: - Functions

    public override func toJSON() -> [String: Any] {
        var json = super.toJSON()

        json[CodingKeys.category.rawValue] = category
        json[CodingKeys.filename.rawValue] = filename
        json[CodingKeys.information.rawValue] = information
        json[CodingKeys.notes.rawValue] = notes
        json[CodingKeys.priority.rawValue] = priority
        json[CodingKeys.rebootRequired.rawValue] = isRebootRequired
        json[CodingKeys.fillUserTemplate.rawValue] = shouldFillUserTemplate
        json[CodingKeys.fillExistingUsers.rawValue] = shouldFillExistingUsers
        json[CodingKeys.bootVolumeRequired.rawValue] = isBootVolumeRequired
        json[CodingKeys.allowUninstalled.rawValue] = allowsUninstallation
        json[CodingKeys.osRequirements.rawValue] = osRequirements
        json[CodingKeys.requiredProcessor.rawValue] = requiredProcessor
        json[CodingKeys.switchWithPackage.rawValue] = switchWithPackage
        json[CodingKeys.installIfReportedUnavailable.rawValue] = shouldInstallIfReportedAvailable
        json[CodingKeys.reinstallOption.rawValue] = reinstallOption
        json[CodingKeys.triggeringFiles.rawValue] = triggeringFiles
        json[CodingKeys.sendNotification.rawValue] = shouldSendNotificaton

        return json
    }

    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(category, forKey: .category)
        try container.encode(filename, forKey: .filename)
        try container.encode(information, forKey: .information)
        try container.encode(notes, forKey: .notes)
        try container.encode(priority, forKey: .priority)
        try container.encode(isRebootRequired, forKey: .rebootRequired)
        try container.encode(shouldFillUserTemplate, forKey: .fillUserTemplate)
        try container.encode(shouldFillExistingUsers, forKey: .fillExistingUsers)
        try container.encode(isBootVolumeRequired, forKey: .bootVolumeRequired)
        try container.encode(allowsUninstallation, forKey: .allowUninstalled)
        try container.encode(osRequirements, forKey: .osRequirements)
        try container.encode(requiredProcessor, forKey: .requiredProcessor)
        try container.encode(switchWithPackage, forKey: .switchWithPackage)
        try container.encode(shouldInstallIfReportedAvailable, forKey: .installIfReportedUnavailable)
        try container.encode(reinstallOption, forKey: .reinstallOption)
        try container.encode(triggeringFiles, forKey: .triggeringFiles)
        try container.encode(shouldSendNotificaton, forKey: .sendNotification)

        try super.encode(to: encoder)
    }
}
