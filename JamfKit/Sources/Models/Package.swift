//
//  Package.swift
//  JamfKit
//
//  Copyright © 2018 JamfKit. All rights reserved.
//

import Foundation

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
    public var category: String

    @objc
    public var filename: String

    @objc
    public var information: String

    @objc
    public var notes: String

    @objc
    public var priority: UInt

    @objc
    public var isRebootRequired: Bool

    @objc
    public var shouldFillUserTemplate: Bool

    @objc
    public var shouldFillExistingUsers: Bool

    @objc
    public var isBootVolumeRequired: Bool

    @objc
    public var allowsUninstallation: Bool

    @objc
    public var osRequirements: String

    @objc
    public var requiredProcessor: String

    @objc
    public var switchWithPackage: String

    @objc
    public var shouldInstallIfReportedAvailable: Bool

    @objc
    public var reinstallOption: String

    @objc
    public var triggeringFiles: String

    @objc
    public var shouldSendNotificaton: Bool

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
