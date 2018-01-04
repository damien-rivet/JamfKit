//
//  MobileDeviceGeneral.swift
//  JAMFKit
//
//  Copyright © 2018 JAMFKit. All rights reserved.
//

public final class MobileDeviceGeneral: BaseObject {

    // MARK: - Constants

    static let DisplayNameKey = "display_name"
    static let DeviceNameKey = "device_name"
    static let AssetTagNameKey = "asset_tag"
    static let LastInventoryUpdateKey = "last_inventory_update"
    static let CapacityKey = "capacity"
    static let CapacityMbKey = "capacity_mb"
    static let AvailableKey = "available"
    static let AvailableMbKey = "available_mb"
    static let PercentageUsedKey = "percentage_used"
    static let OSTypeKey = "os_type"
    static let OSVersionKey = "os_version"
    static let OSBuildKey = "os_build"
    static let SerialNumberKey = "serial_number"
    static let UDIDKey = "udid"
    static let InitialEntryDateKey = "initial_entry_date"
    static let PhoneNumberKey = "phone_number"
    static let IPAddressKey = "ip_address"
    static let WifiMacAddressKey = "wifi_mac_address"
    static let BluetoothMacAddressKey = "bluetooth_mac_address"
    static let ModemFirmwareKey = "modem_firmware"
    static let ModelKey = "model"
    static let ModelIdentifierKey = "model_identifier"
    static let ModelNumberKey = "model_number"
    static let ModelDisplayKey = "model_display"
    static let DeviceOwnershipLevelKey = "device_ownership_level"
    static let LastEnrollmentKey = "last_enrollment"
    static let ManagedKey = "managed"
    static let SupervisedKey = "supervised"
    static let ExchangeActiveSyncDeviceIdentifierKey = "exchange_activesync_device_identifier"
    static let SharedKey = "shared"
    static let TetheredKey = "tethered"
    static let BatteryLevelKey = "battery_level"
    static let BluetoothCapableKey = "ble_capable"
    static let DeviceLocatorServiceEnabledKey = "device_locator_service_enabled"
    static let DoNotDisturbEnabledKey = "do_not_disturb_enabled"
    static let CloudBackupEnabledKey = "cloud_backup_enabled"
    static let LastCloudBackupDateKey = "last_cloud_backup_date"
    static let LocationServicesEnabledKey = "location_services_enabled"
    static let ITunesStoreAccountIsActiveKey = "itunes_store_account_is_active"
    static let LastBackupTimeKey = "last_backup_time"

    // MARK: - Properties

    public var displayName: String
    public var deviceName: String
    public var assetTag: String
    public var lastInventoryUpdate: PreciseDate?
    public var capacity: UInt
    public var capacityMb: UInt
    public var available: UInt
    public var availableMb: UInt
    public var percentageUsed: UInt
    public var osType: String
    public var osVersion: String
    public var osBuild: String
    public var serialNumber: String
    public var udid: String
    public var initialEntryDate: PreciseDate?
    public var phoneNumber: String
    public var ipAddress: String
    public var wifiMacAddress: String
    public var bluetoothMacAddress: String
    public var modemFirmware: String
    public var model: String
    public var modelIdentifier: String
    public var modelNumber: String
    public var modelDisplay: String
    public var deviceOwnershipLevel: String
    public var lastEnrollment: PreciseDate?
    public var isManaged: Bool
    public var isSupervised: Bool
    public var exchangeActiveSyncDeviceIdentifier: String
    public var shared: String
    public var tethered: String
    public var batteryLevel: UInt
    public var isBluetoothCapable: Bool
    public var isDeviceLocatorServiceEnabled: Bool
    public var isDoNotDisturbEnabled: Bool
    public var isCloudBackupEnabled: Bool
    public var lastCloudBackupDate: PreciseDate?
    public var isLocationServicesEnabled: Bool
    public var isITunesStoreAccountActive: Bool
    public var lastBackupTime: PreciseDate?

    // MARK: - Initialization

    public required init?(json: [String : Any], node: String = "") {
        displayName = json[MobileDeviceGeneral.DisplayNameKey] as? String ?? ""
        deviceName = json[MobileDeviceGeneral.DeviceNameKey] as? String ?? ""
        assetTag = json[MobileDeviceGeneral.AssetTagNameKey] as? String ?? ""
        lastInventoryUpdate = PreciseDate(json: json, node: MobileDeviceGeneral.LastInventoryUpdateKey)
        capacity = json[MobileDeviceGeneral.CapacityKey] as? UInt ?? 0
        capacityMb = json[MobileDeviceGeneral.CapacityMbKey] as? UInt ?? 0
        available = json[MobileDeviceGeneral.AvailableKey] as? UInt ?? 0
        availableMb = json[MobileDeviceGeneral.AvailableMbKey] as? UInt ?? 0
        percentageUsed = json[MobileDeviceGeneral.PercentageUsedKey] as? UInt ?? 0
        osType = json[MobileDeviceGeneral.OSTypeKey] as? String ?? ""
        osVersion = json[MobileDeviceGeneral.OSVersionKey] as? String ?? ""
        osBuild = json[MobileDeviceGeneral.OSBuildKey] as? String ?? ""
        serialNumber = json[MobileDeviceGeneral.SerialNumberKey] as? String ?? ""
        udid = json[MobileDeviceGeneral.UDIDKey] as? String ?? ""
        initialEntryDate = PreciseDate(json: json, node: MobileDeviceGeneral.InitialEntryDateKey)
        phoneNumber = json[MobileDeviceGeneral.PhoneNumberKey] as? String ?? ""
        ipAddress = json[MobileDeviceGeneral.IPAddressKey] as? String ?? ""
        wifiMacAddress = json[MobileDeviceGeneral.WifiMacAddressKey] as? String ?? ""
        bluetoothMacAddress = json[MobileDeviceGeneral.BluetoothMacAddressKey] as? String ?? ""
        modemFirmware = json[MobileDeviceGeneral.ModemFirmwareKey] as? String ?? ""
        model = json[MobileDeviceGeneral.ModelKey] as? String ?? ""
        modelIdentifier = json[MobileDeviceGeneral.ModelIdentifierKey] as? String ?? ""
        modelNumber = json[MobileDeviceGeneral.ModelNumberKey] as? String ?? ""
        modelDisplay = json[MobileDeviceGeneral.ModelDisplayKey] as? String ?? ""
        deviceOwnershipLevel = json[MobileDeviceGeneral.DeviceOwnershipLevelKey] as? String ?? ""
        lastEnrollment = PreciseDate(json: json, node: MobileDeviceGeneral.LastEnrollmentKey)
        isManaged = json[MobileDeviceGeneral.ManagedKey] as? Bool ?? false
        isSupervised = json[MobileDeviceGeneral.SupervisedKey] as? Bool ?? false
        exchangeActiveSyncDeviceIdentifier = json[MobileDeviceGeneral.ExchangeActiveSyncDeviceIdentifierKey] as? String ?? ""
        shared = json[MobileDeviceGeneral.SharedKey] as? String ?? ""
        tethered = json[MobileDeviceGeneral.TetheredKey] as? String ?? ""
        batteryLevel = json[MobileDeviceGeneral.BatteryLevelKey] as? UInt ?? 0
        isBluetoothCapable = json[MobileDeviceGeneral.BluetoothCapableKey] as? Bool ?? false
        isDeviceLocatorServiceEnabled = json[MobileDeviceGeneral.DeviceLocatorServiceEnabledKey] as? Bool ?? false
        isDoNotDisturbEnabled = json[MobileDeviceGeneral.DoNotDisturbEnabledKey] as? Bool ?? false
        isCloudBackupEnabled = json[MobileDeviceGeneral.CloudBackupEnabledKey] as? Bool ?? false
        lastCloudBackupDate = PreciseDate(json: json, node: MobileDeviceGeneral.LastCloudBackupDateKey)
        isLocationServicesEnabled = json[MobileDeviceGeneral.LocationServicesEnabledKey] as? Bool ?? false
        isITunesStoreAccountActive = json[MobileDeviceGeneral.ITunesStoreAccountIsActiveKey] as? Bool ?? false
        lastBackupTime = PreciseDate(json: json, node: MobileDeviceGeneral.LastBackupTimeKey)

        super.init(json: json)
    }

    // MARK: - Functions

    public override func toJSON() -> [String : Any] {
        var json = super.toJSON()

        json[MobileDeviceGeneral.DisplayNameKey] = displayName
        json[MobileDeviceGeneral.DeviceNameKey] = deviceName
        json[MobileDeviceGeneral.AssetTagNameKey] = assetTag

        if let lastInventoryUpdate = lastInventoryUpdate {
            json.merge(lastInventoryUpdate.toJSON()) { (_, new) in new }
        }

        json[MobileDeviceGeneral.CapacityKey] = capacity
        json[MobileDeviceGeneral.CapacityMbKey] = capacityMb
        json[MobileDeviceGeneral.AvailableKey] = available
        json[MobileDeviceGeneral.AvailableMbKey] = availableMb
        json[MobileDeviceGeneral.PercentageUsedKey] = percentageUsed
        json[MobileDeviceGeneral.OSTypeKey] = osType
        json[MobileDeviceGeneral.OSVersionKey] = osVersion
        json[MobileDeviceGeneral.OSBuildKey] = osBuild
        json[MobileDeviceGeneral.SerialNumberKey] = serialNumber
        json[MobileDeviceGeneral.UDIDKey] = udid

        if let initialEntryDate = initialEntryDate {
            json.merge(initialEntryDate.toJSON()) { (_, new) in new }
        }

        json[MobileDeviceGeneral.PhoneNumberKey] = phoneNumber
        json[MobileDeviceGeneral.IPAddressKey] = ipAddress
        json[MobileDeviceGeneral.WifiMacAddressKey] = wifiMacAddress
        json[MobileDeviceGeneral.BluetoothMacAddressKey] = bluetoothMacAddress
        json[MobileDeviceGeneral.ModemFirmwareKey] = modemFirmware
        json[MobileDeviceGeneral.ModelKey] = model
        json[MobileDeviceGeneral.ModelIdentifierKey] = modelIdentifier
        json[MobileDeviceGeneral.ModelNumberKey] = modelNumber
        json[MobileDeviceGeneral.ModelDisplayKey] = modelDisplay
        json[MobileDeviceGeneral.DeviceOwnershipLevelKey] = deviceOwnershipLevel

        if let lastEnrollment = lastEnrollment {
            json.merge(lastEnrollment.toJSON()) { (_, new) in new }
        }

        json[MobileDeviceGeneral.ManagedKey] = isManaged
        json[MobileDeviceGeneral.SupervisedKey] = isSupervised
        json[MobileDeviceGeneral.ExchangeActiveSyncDeviceIdentifierKey] = exchangeActiveSyncDeviceIdentifier
        json[MobileDeviceGeneral.SharedKey] = shared
        json[MobileDeviceGeneral.TetheredKey] = tethered
        json[MobileDeviceGeneral.BatteryLevelKey] = batteryLevel
        json[MobileDeviceGeneral.BluetoothCapableKey] = isBluetoothCapable
        json[MobileDeviceGeneral.DeviceLocatorServiceEnabledKey] = isDeviceLocatorServiceEnabled
        json[MobileDeviceGeneral.DoNotDisturbEnabledKey] = isDoNotDisturbEnabled
        json[MobileDeviceGeneral.CloudBackupEnabledKey] = isCloudBackupEnabled

        if let lastCloudBackupDate = lastCloudBackupDate {
            json.merge(lastCloudBackupDate.toJSON()) { (_, new) in new }
        }

        json[MobileDeviceGeneral.LocationServicesEnabledKey] = isLocationServicesEnabled
        json[MobileDeviceGeneral.ITunesStoreAccountIsActiveKey] = isITunesStoreAccountActive

        if let lastBackupTime = lastBackupTime {
            json.merge(lastBackupTime.toJSON()) { (_, new) in new }
        }

        return json
    }
}
