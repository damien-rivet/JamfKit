//
//  ComputerGeneral.swift
//  JamfKit
//
//  Copyright © 2017 JamfKit. All rights reserved.
//

public final class ComputerGeneral: BaseObject {

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
    static let RemoteManagementKey = "remote_management"
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
    public var remoteManagement: ComputerRemoteManagement?
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

    public required init?(json: [String: Any], node: String = "") {
        macAddress = json[ComputerGeneral.MacAddressKey] as? String
        alternativeMacAddress = json[ComputerGeneral.AlternativeMacAddressKey] as? String
        ipAddress = json[ComputerGeneral.IpAddressKey] as? String
        lastReportedIpAddress = json[ComputerGeneral.LastReportedIPAddressKey] as? String
        serialNumber = json[ComputerGeneral.SerialNumberKey] as? String
        udid = json[ComputerGeneral.UDIDKey] as? String
        jamfVersion = json[ComputerGeneral.JamfVersionKey] as? String
        platform = json[ComputerGeneral.PlatformKey] as? String
        barcode1 = json[ComputerGeneral.Barcode1Key] as? String
        barcode2 = json[ComputerGeneral.Barcode2Key] as? String
        assetTag = json[ComputerGeneral.AssetTagKey] as? String
        remoteManagement = ComputerGeneral.parseRemoteManagement(from: json)
        isMdmCapable = json[ComputerGeneral.MdmCapableKey] as? Bool
        mdmCapableUsers = ComputerGeneral.parseMdmCapableUsers(from: json)
        reportDate = PreciseDate(json: json, node: ComputerGeneral.ReportDateKey)
        lastContactTime = PreciseDate(json: json, node: ComputerGeneral.LastContactTimeKey)
        initialEntryDate = PreciseDate(json: json, node: ComputerGeneral.InitialEntryDateKey)
        lastCloudBackupDate = PreciseDate(json: json, node: ComputerGeneral.LastCloudBackupDateKey)
        lastEnrolledDate = PreciseDate(json: json, node: ComputerGeneral.LastEnrolledDateKey)
        distributionPoint = json[ComputerGeneral.DistributionPointKey] as? String
        sus = json[ComputerGeneral.SusKey] as? String
        netbootServer = json[ComputerGeneral.NetbootServerKey] as? String
        site = ComputerGeneral.parseSite(from: json)
        isITunesStoreAcccountActivated = json[ComputerGeneral.ItunesStoreAccountIsActiveKey] as? Bool

        super.init(json: json)
    }

    // MARK: - Functions

    public override func toJSON() -> [String: Any] {
        var json = super.toJSON()

        json[ComputerGeneral.MacAddressKey] = macAddress
        json[ComputerGeneral.AlternativeMacAddressKey] = alternativeMacAddress
        json[ComputerGeneral.IpAddressKey] = ipAddress
        json[ComputerGeneral.LastReportedIPAddressKey] = lastReportedIpAddress
        json[ComputerGeneral.SerialNumberKey] = serialNumber
        json[ComputerGeneral.UDIDKey] = udid
        json[ComputerGeneral.JamfVersionKey] = jamfVersion
        json[ComputerGeneral.PlatformKey] = platform
        json[ComputerGeneral.Barcode1Key] = barcode1
        json[ComputerGeneral.Barcode2Key] = barcode2
        json[ComputerGeneral.AssetTagKey] = assetTag

        if let remoteManagement = remoteManagement {
            json[ComputerGeneral.RemoteManagementKey] = remoteManagement.toJSON()
        }

        json[ComputerGeneral.MdmCapableKey] = isMdmCapable
        json[ComputerGeneral.MdmCapableUsersKey] = mdmCapableUsers

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

        json[ComputerGeneral.DistributionPointKey] = distributionPoint
        json[ComputerGeneral.SusKey] = sus
        json[ComputerGeneral.NetbootServerKey] = netbootServer
        json[ComputerGeneral.SiteKey] = site?.toJSON()
        json[ComputerGeneral.ItunesStoreAccountIsActiveKey] = isITunesStoreAcccountActivated

        return json
    }

    // MARK: - Helpers

    private static func parseRemoteManagement(from json: [String: Any]) -> ComputerRemoteManagement? {
        guard
            let remoteManagementContainer = json[ComputerGeneral.RemoteManagementKey] as? [String: Any],
            let remoteManagement = ComputerRemoteManagement(json: remoteManagementContainer)
            else {
                return nil
        }

        return remoteManagement
    }

    private static func parseMdmCapableUsers(from json: [String: Any]) -> [String]? {
        guard let rawMdmCapableUsers = json[ComputerGeneral.MdmCapableUsersKey] as? [String: String] else {
            return nil
        }

        return rawMdmCapableUsers.map { $1 }
    }

    private static func parseSite(from json: [String: Any]) -> Site? {
        guard
            let rawSite = json[ComputerGeneral.SiteKey] as? [String: Any],
            let site = Site(json: rawSite) else {
                return nil
        }

        return site
    }
}
