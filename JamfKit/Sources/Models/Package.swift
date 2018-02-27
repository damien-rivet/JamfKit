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

    static let CategoryKey = "category"
    static let FilenameKey = "filename"
    static let InformationKey = "info"
    static let NotesKey = "notes"
    static let PriorityKey = "priority"
    static let RebootRequiredKey = "reboot_required"
    static let FillUserTemplateKey = "fill_user_template"
    static let FillExistingUsersKey = "fill_existing_users"
    static let BootVolumeRequiredKey = "boot_volume_required"
    static let AllowUninstalledKey = "allow_uninstalled"
    static let OsRequirementsKey = "os_requirements"
    static let RequiredProcessorKey = "required_processor"
    static let SwitchWithPackageKey = "switch_with_package"
    static let InstallIfReportedAvailableKey = "install_if_reported_available"
    static let ReinstallOptionKey = "reinstall_option"
    static let TriggeringFilesKey = "triggering_files"
    static let SendNotificationKey = "send_notification"

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

    public required init?(json: [String: Any], node: String = "") {
        category = json[Package.CategoryKey] as? String ?? ""
        filename = json[Package.FilenameKey] as? String ?? ""
        information = json[Package.InformationKey] as? String ?? ""
        notes = json[Package.NotesKey] as? String ?? ""
        priority = json[Package.PriorityKey] as? UInt ?? 0
        isRebootRequired = json[Package.RebootRequiredKey] as? Bool ?? false
        shouldFillUserTemplate = json[Package.FillUserTemplateKey] as? Bool ?? false
        shouldFillExistingUsers = json[Package.FillExistingUsersKey] as? Bool ?? false
        isBootVolumeRequired = json[Package.BootVolumeRequiredKey] as? Bool ?? false
        allowsUninstallation = json[Package.AllowUninstalledKey] as? Bool ?? false
        osRequirements = json[Package.OsRequirementsKey] as? String ?? ""
        requiredProcessor = json[Package.RequiredProcessorKey] as? String ?? ""
        switchWithPackage = json[Package.SwitchWithPackageKey] as? String ?? ""
        shouldInstallIfReportedAvailable = json[Package.InstallIfReportedAvailableKey] as? Bool ?? false
        reinstallOption = json[Package.ReinstallOptionKey] as? String ?? ""
        triggeringFiles = json[Package.TriggeringFilesKey] as? String ?? ""
        shouldSendNotificaton = json[Package.SendNotificationKey] as? Bool ?? false

        super.init(json: json)
    }

    public override init?(identifier: UInt, name: String) {
        super.init(identifier: identifier, name: name)
    }

    // MARK: - Functions

    public override func toJSON() -> [String: Any] {
        var json = super.toJSON()

        json[Package.CategoryKey] = category
        json[Package.FilenameKey] = filename
        json[Package.InformationKey] = information
        json[Package.NotesKey] = notes
        json[Package.PriorityKey] = priority
        json[Package.RebootRequiredKey] = isRebootRequired
        json[Package.FillUserTemplateKey] = shouldFillUserTemplate
        json[Package.FillExistingUsersKey] = shouldFillExistingUsers
        json[Package.BootVolumeRequiredKey] = isBootVolumeRequired
        json[Package.AllowUninstalledKey] = allowsUninstallation
        json[Package.OsRequirementsKey] = osRequirements
        json[Package.RequiredProcessorKey] = requiredProcessor
        json[Package.SwitchWithPackageKey] = switchWithPackage
        json[Package.InstallIfReportedAvailableKey] = shouldInstallIfReportedAvailable
        json[Package.ReinstallOptionKey] = reinstallOption
        json[Package.TriggeringFilesKey] = triggeringFiles
        json[Package.SendNotificationKey] = shouldSendNotificaton

        return json
    }
}
