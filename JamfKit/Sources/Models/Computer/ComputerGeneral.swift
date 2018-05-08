//
//  ComputerGeneral.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

@objc(JMFKComputerGeneral)
public final class ComputerGeneral: BaseObject {

    // MARK: - Constants

    enum CodingKeys: String, CodingKey {
        case macAddress = "mac_address"
        case alternativeMacAddress = "alt_mac_address"
        case ipAddress = "ip_address"
        case lastReportedIpAddress = "last_reported_ip"
        case serialNumber = "serial_number"
        case udid = "udid"
        case jamfVersion = "jamf_version"
        case platform = "platform"
        case barcode1 = "barcode_1"
        case barcode2 = "barcode_2"
        case assetTag = "asset_tag"
        case remoteManagement = "remote_management"
        case mdmCapable = "mdm_capable"
        case mdmCapableUsers = "mdm_capable_users"
        case mdmCapableUser = "mdm_capable_user"
        case reportDate = "report_date"
        case lastContactTime = "last_contact_time"
        case initialEntryDate = "initial_entry_date"
        case lastCloudBackupDate = "last_cloud_backup_date"
        case lastEnrolledDate = "last_enrolled_date"
        case distributionPoint = "distribution_point"
        case sus = "sus"
        case netbootServer = "netboot_server"
        case site = "site"
        case iTunesStoreAccountIsActive = "itunes_store_account_is_active"
    }

    // MARK: - Properties

    @objc
    public var macAddress = ""

    @objc
    public var alternativeMacAddress = ""

    @objc
    public var ipAddress = ""

    @objc
    public var lastReportedIpAddress = ""

    @objc
    public var serialNumber = ""

    @objc
    public var udid = ""

    @objc
    public var jamfVersion = ""

    @objc
    public var platform = ""

    @objc
    public var barcode1 = ""

    @objc
    public var barcode2 = ""

    @objc
    public var assetTag = ""

    @objc
    public var remoteManagement: ComputerRemoteManagement?

    @objc
    public var isMdmCapable = false

    @objc
    public var mdmCapableUsers = [String]()

    @objc
    public var reportDate: PreciseDate?

    @objc
    public var lastContactTime: PreciseDate?

    @objc
    public var initialEntryDate: PreciseDate?

    @objc
    public var lastCloudBackupDate: PreciseDate?

    @objc
    public var lastEnrolledDate: PreciseDate?

    @objc
    public var distributionPoint = ""

    @objc
    public var sus = ""

    @objc
    public var netbootServer = ""

    @objc
    public var site: Site?

    @objc
    public var isITunesStoreAcccountActivated = false

    // MARK: - Initialization

    public override init?(identifier: UInt, name: String) {
        remoteManagement = ComputerRemoteManagement()

        super.init(identifier: identifier, name: name)
    }

    public required init?(json: [String: Any], node: String = "") {
        macAddress = json[CodingKeys.macAddress.rawValue] as? String ?? ""
        alternativeMacAddress = json[CodingKeys.alternativeMacAddress.rawValue] as? String ?? ""
        ipAddress = json[CodingKeys.ipAddress.rawValue] as? String ?? ""
        lastReportedIpAddress = json[CodingKeys.lastReportedIpAddress.rawValue] as? String ?? ""
        serialNumber = json[CodingKeys.serialNumber.rawValue] as? String ?? ""
        udid = json[CodingKeys.udid.rawValue] as? String ?? ""
        jamfVersion = json[CodingKeys.jamfVersion.rawValue] as? String ?? ""
        platform = json[CodingKeys.platform.rawValue] as? String ?? ""
        barcode1 = json[CodingKeys.barcode1.rawValue] as? String ?? ""
        barcode2 = json[CodingKeys.barcode2.rawValue] as? String ?? ""
        assetTag = json[CodingKeys.assetTag.rawValue] as? String ?? ""

        if let remoteManagementNode = json[CodingKeys.remoteManagement.rawValue] as? [String: Any] {
            remoteManagement = ComputerRemoteManagement(json: remoteManagementNode)
        }

        isMdmCapable = json[CodingKeys.mdmCapable.rawValue] as? Bool ?? false
        mdmCapableUsers = ComputerGeneral.parseMdmCapableUsers(from: json)
        reportDate = PreciseDate(json: json, node: CodingKeys.reportDate.rawValue)
        lastContactTime = PreciseDate(json: json, node: CodingKeys.lastContactTime.rawValue)
        initialEntryDate = PreciseDate(json: json, node: CodingKeys.initialEntryDate.rawValue)
        lastCloudBackupDate = PreciseDate(json: json, node: CodingKeys.lastCloudBackupDate.rawValue)
        lastEnrolledDate = PreciseDate(json: json, node: CodingKeys.lastEnrolledDate.rawValue)
        distributionPoint = json[CodingKeys.distributionPoint.rawValue] as? String ?? ""
        sus = json[CodingKeys.sus.rawValue] as? String ?? ""
        netbootServer = json[CodingKeys.netbootServer.rawValue] as? String ?? ""

        if let siteNode = json[CodingKeys.site.rawValue] as? [String: Any] {
            site = Site(json: siteNode)
        }

        isITunesStoreAcccountActivated = json[CodingKeys.iTunesStoreAccountIsActive.rawValue] as? Bool ?? false

        super.init(json: json)
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        macAddress = try container.decode(String.self, forKey: .macAddress)
        alternativeMacAddress = try container.decode(String.self, forKey: .alternativeMacAddress)
        ipAddress = try container.decode(String.self, forKey: .ipAddress)
        lastReportedIpAddress = try container.decode(String.self, forKey: .lastReportedIpAddress)
        serialNumber = try container.decode(String.self, forKey: .serialNumber)
        udid = try container.decode(String.self, forKey: .udid)
        jamfVersion = try container.decode(String.self, forKey: .jamfVersion)
        platform = try container.decode(String.self, forKey: .platform)
        barcode1 = try container.decode(String.self, forKey: .barcode1)
        barcode2 = try container.decode(String.self, forKey: .barcode2)
        assetTag = try container.decode(String.self, forKey: .assetTag)

        if let remoteManagement = try? container.decode(ComputerRemoteManagement.self, forKey: .remoteManagement) {
            self.remoteManagement = remoteManagement
        }

        isMdmCapable = try container.decode(Bool.self, forKey: .mdmCapable)
        mdmCapableUsers = try container.decode([String].self, forKey: .mdmCapable)
        reportDate = try container.decode(PreciseDate.self, forKey: .reportDate)
        lastContactTime = try container.decode(PreciseDate.self, forKey: .lastContactTime)
        initialEntryDate = try container.decode(PreciseDate.self, forKey: .initialEntryDate)
        lastCloudBackupDate = try container.decode(PreciseDate.self, forKey: .lastCloudBackupDate)
        lastEnrolledDate = try container.decode(PreciseDate.self, forKey: .lastEnrolledDate)
        distributionPoint = try container.decode(String.self, forKey: .distributionPoint)
        sus = try container.decode(String.self, forKey: .sus)
        netbootServer = try container.decode(String.self, forKey: .netbootServer)

        if let site = try? container.decode(Site.self, forKey: .site) {
            self.site = site
        }

        isITunesStoreAcccountActivated = try container.decode(Bool.self, forKey: CodingKeys.iTunesStoreAccountIsActive)

        try super.init(from: decoder)
    }

    // MARK: - Functions

    public override func toJSON() -> [String: Any] {
        var json = super.toJSON()

        json[CodingKeys.macAddress.rawValue] = macAddress
        json[CodingKeys.alternativeMacAddress.rawValue] = alternativeMacAddress
        json[CodingKeys.ipAddress.rawValue] = ipAddress
        json[CodingKeys.lastReportedIpAddress.rawValue] = lastReportedIpAddress
        json[CodingKeys.serialNumber.rawValue] = serialNumber
        json[CodingKeys.udid.rawValue] = udid
        json[CodingKeys.jamfVersion.rawValue] = jamfVersion
        json[CodingKeys.platform.rawValue] = platform
        json[CodingKeys.barcode1.rawValue] = barcode1
        json[CodingKeys.barcode2.rawValue] = barcode2
        json[CodingKeys.assetTag.rawValue] = assetTag

        if let remoteManagement = remoteManagement {
            json[CodingKeys.remoteManagement.rawValue] = remoteManagement.toJSON()
        }

        json[CodingKeys.mdmCapable.rawValue] = isMdmCapable
        json[CodingKeys.mdmCapableUsers.rawValue] = mdmCapableUsers

        if let reportDate = reportDate {
            json.merge(reportDate.toJSON()) { (_, new) in new }
        }

        if let lastContactTime = lastContactTime {
            json.merge(lastContactTime.toJSON()) { (_, new) in new }
        }

        if let initialEntryDate = initialEntryDate {
            json.merge(initialEntryDate.toJSON()) { (_, new) in new }
        }

        if let lastCloudBackupDate = lastCloudBackupDate {
            json.merge(lastCloudBackupDate.toJSON()) { (_, new) in new }
        }

        if let lastEnrolledDate = lastEnrolledDate {
            json.merge(lastEnrolledDate.toJSON()) { (_, new) in new }
        }

        json[CodingKeys.distributionPoint.rawValue] = distributionPoint
        json[CodingKeys.sus.rawValue] = sus
        json[CodingKeys.netbootServer.rawValue] = netbootServer
        json[CodingKeys.site.rawValue] = site?.toJSON()
        json[CodingKeys.iTunesStoreAccountIsActive.rawValue] = isITunesStoreAcccountActivated

        return json
    }

    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(macAddress, forKey: .macAddress)
        try container.encode(alternativeMacAddress, forKey: .alternativeMacAddress)
        try container.encode(ipAddress, forKey: .ipAddress)
        try container.encode(lastReportedIpAddress, forKey: .lastReportedIpAddress)
        try container.encode(serialNumber, forKey: .serialNumber)
        try container.encode(udid, forKey: .udid)
        try container.encode(jamfVersion, forKey: .jamfVersion)
        try container.encode(platform, forKey: .platform)
        try container.encode(barcode1, forKey: .barcode1)
        try container.encode(barcode2, forKey: .barcode2)
        try container.encode(assetTag, forKey: .assetTag)
        try container.encode(remoteManagement, forKey: .remoteManagement)
        try container.encode(isMdmCapable, forKey: .mdmCapable)
        try container.encode(mdmCapableUsers, forKey: .mdmCapableUsers)
        try container.encode(reportDate, forKey: .reportDate)
        try container.encode(lastContactTime, forKey: .lastContactTime)
        try container.encode(initialEntryDate, forKey: .initialEntryDate)
        try container.encode(lastCloudBackupDate, forKey: .lastCloudBackupDate)
        try container.encode(lastEnrolledDate, forKey: .lastEnrolledDate)
        try container.encode(distributionPoint, forKey: .distributionPoint)
        try container.encode(sus, forKey: .sus)
        try container.encode(netbootServer, forKey: .netbootServer)
        try container.encode(site, forKey: .site)
        try container.encode(isITunesStoreAcccountActivated, forKey: .iTunesStoreAccountIsActive)

        try super.encode(to: encoder)
    }

    private static func parseMdmCapableUsers(from json: [String: Any]) -> [String] {
        guard let rawMdmCapableUsers = json[CodingKeys.mdmCapableUsers.rawValue] as? [String: String] else {
            return [String]()
        }

        return rawMdmCapableUsers.map { $1 }
    }
}
