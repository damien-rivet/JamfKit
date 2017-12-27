//
//  HardwareGeneral.swift
//  JamfKit
//
//  Copyright © 2017 JamfKit. All rights reserved.
//

public final class HardwareGeneral: BaseObject {

    // MARK: - Constants

    static let MacAddressKey = "mac_address"
    static let AlternativeMacAddressKey = "alt_mac_address"
    static let IpAddressKey = "ip_address"
    static let LastReportedIPAddressKey = "last_reported_ip"
    static let SerialNumberKey = "serial_number"
    static let UDIDKey = "udid"
    static let JamfVersionKey = "jamf_version"
    static let PlatformKey = "platform"
    static let Barcode1Key = "barcode_1"
    static let Barcode2Key = "barcode_2"
    static let AssetTagKey = "asset_tag"
    static let MdmCapableKey = "mdm_capable"
    static let MdmCapableUsersKey = "mdm_capable_users"
    static let MdmCapableUserKey = "mdm_capable_user"
    static let ReportDateKey = "report_date"
    static let LastContactTimeKey = "last_contact_time"
    static let InitialEntryDateKey = "initial_entry_date"
    static let LastCloudBackupDateKey = "last_cloud_backup_date"
    static let LastEnrolledDateKey = "last_enrolled_date"
    static let DistributionPointKey = "distribution_point"
    static let SusKey = "sus"
    static let NetbootServerKey = "netboot_server"
    static let SiteKey = "site"
    static let ItunesStoreAccountIsActiveKey = "itunes_store_account_is_active"

    // MARK: - Properties

    public var macAddress: String?
    public var alternativeMacAddress: String?
    public var ipAddress: String?
    public var lastReportedIpAddress: String?
    public var serialNumber: String?
    public var udid: String?
    public var jamfVersion: String?
    public var platform: String?
    public var barcode1: String?
    public var barcode2: String?
    public var assetTag: String?
    public var remoteManagement: HardwareRemoteManagement?
    public var isMdmCapable: Bool?
    public var mdmCapableUsers: [String]?
    public var reportDate: PreciseDate?
    public var lastContactTime: PreciseDate?
    public var initialEntryDate: PreciseDate?
    public var lastCloudBackupDate: PreciseDate?
    public var lastEnrolledDate: PreciseDate?
    public var distributionPoint: String?
    public var sus: String?
    public var netbootServer: String?
    public var site: Site?
    public var isITunesStoreAcccountActivated: Bool?

    // MARK: - Initialization

    public required init?(json: [String : Any], node: String = "") {
        guard let rootNode = json[node] as? [String: Any] else {
            return nil
        }

        macAddress = rootNode[HardwareGeneral.MacAddressKey] as? String
        alternativeMacAddress = rootNode[HardwareGeneral.AlternativeMacAddressKey] as? String
        ipAddress = rootNode[HardwareGeneral.IpAddressKey] as? String
        lastReportedIpAddress = rootNode[HardwareGeneral.LastReportedIPAddressKey] as? String
        serialNumber = rootNode[HardwareGeneral.SerialNumberKey] as? String
        udid = rootNode[HardwareGeneral.UDIDKey] as? String
        jamfVersion = rootNode[HardwareGeneral.JamfVersionKey] as? String
        platform = rootNode[HardwareGeneral.PlatformKey] as? String
        barcode1 = rootNode[HardwareGeneral.Barcode1Key] as? String
        barcode2 = rootNode[HardwareGeneral.Barcode2Key] as? String
        assetTag = rootNode[HardwareGeneral.AssetTagKey] as? String
        remoteManagement = HardwareGeneral.parseRemoteManagement(from: rootNode)
        isMdmCapable = rootNode[HardwareGeneral.MdmCapableKey] as? Bool
        mdmCapableUsers = HardwareGeneral.parseMdmCapableUsers(from: rootNode)
        reportDate = PreciseDate(json: rootNode, node: HardwareGeneral.ReportDateKey)
        lastContactTime = PreciseDate(json: rootNode, node: HardwareGeneral.LastContactTimeKey)
        initialEntryDate = PreciseDate(json: rootNode, node: HardwareGeneral.InitialEntryDateKey)
        lastCloudBackupDate = PreciseDate(json: rootNode, node: HardwareGeneral.LastCloudBackupDateKey)
        lastEnrolledDate = PreciseDate(json: rootNode, node: HardwareGeneral.LastEnrolledDateKey)
        distributionPoint = rootNode[HardwareGeneral.DistributionPointKey] as? String
        sus = rootNode[HardwareGeneral.SusKey] as? String
        netbootServer = rootNode[HardwareGeneral.NetbootServerKey] as? String
        site = HardwareGeneral.parseSite(from: rootNode)
        isITunesStoreAcccountActivated = rootNode[HardwareGeneral.ItunesStoreAccountIsActiveKey] as? Bool

        super.init(json: rootNode)
    }

    // MARK: - Functions

    override func toJSON() -> [String : Any] {
        var json = super.toJSON()

        json[HardwareGeneral.MacAddressKey] = macAddress
        json[HardwareGeneral.AlternativeMacAddressKey] = alternativeMacAddress
        json[HardwareGeneral.IpAddressKey] = ipAddress
        json[HardwareGeneral.LastReportedIPAddressKey] = lastReportedIpAddress
        json[HardwareGeneral.SerialNumberKey] = serialNumber
        json[HardwareGeneral.UDIDKey] = udid
        json[HardwareGeneral.JamfVersionKey] = jamfVersion
        json[HardwareGeneral.PlatformKey] = platform
        json[HardwareGeneral.Barcode1Key] = barcode1
        json[HardwareGeneral.Barcode2Key] = barcode2
        json[HardwareGeneral.AssetTagKey] = assetTag
        json[HardwareRemoteManagement.ContainerKey] = remoteManagement ?? remoteManagement?.toJSON()
        json[HardwareGeneral.MdmCapableKey] = isMdmCapable
        json[HardwareGeneral.MdmCapableUsersKey] = mdmCapableUsers

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

        json[HardwareGeneral.DistributionPointKey] = distributionPoint
        json[HardwareGeneral.SusKey] = sus
        json[HardwareGeneral.NetbootServerKey] = netbootServer
        json[HardwareGeneral.SiteKey] = site?.toJSON()
        json[HardwareGeneral.ItunesStoreAccountIsActiveKey] = isITunesStoreAcccountActivated

        return json
    }

    // MARK: - Helpers

    private static func parseRemoteManagement(from json: [String: Any]) -> HardwareRemoteManagement? {
        guard
            let remoteManagementContainer = json[HardwareRemoteManagement.ContainerKey] as? [String: Any],
            let remoteManagement = HardwareRemoteManagement(json: remoteManagementContainer)
            else {
                return nil
        }

        return remoteManagement
    }

    private static func parseMdmCapableUsers(from json: [String: Any]) -> [String]? {
        guard let rawMdmCapableUsers = json[HardwareGeneral.MdmCapableUsersKey] as? [String: String] else {
            return nil
        }

        return rawMdmCapableUsers.map { $1 }
    }

    private static func parseSite(from json: [String: Any]) -> Site? {
        guard
            let rawSite = json[HardwareGeneral.SiteKey] as? [String: Any],
            let site = Site(json: rawSite) else {
                return nil
        }

        return site
    }
}
