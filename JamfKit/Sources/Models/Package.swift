//
//  Package.swift
//  JamfKit
//
//  Copyright © 2018 JamfKit. All rights reserved.
//

/// Represents a logical application package, contains information about the application requirements and capabilities.
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

    public var category: String
    public var filename: String
    public var information: String
    public var notes: String
    public var priority: UInt
    public var isRebootRequired: Bool
    public var shouldFillUserTemplate: Bool
    public var shouldFillExistingUsers: Bool
    public var isBootVolumeRequired: Bool
    public var allowsUninstallation: Bool
    public var osRequirements: String
    public var requiredProcessor: String
    public var switchWithPackage: String
    public var shouldInstallIfReportedAvailable: Bool
    public var reinstallOption: String
    public var triggeringFiles: String
    public var shouldSendNotificaton: Bool

    public override var description: String {
        return "[\(String(describing: Package.self))][\(identifier). \(self.name)]"
    }

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
