//
//  MobileDeviceGeneral.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

@objc(JMFKMobileDeviceGeneral)
public final class MobileDeviceGeneral: BaseObject {

    // MARK: - Constants

    enum CodingKeys: String, CodingKey {
        case displayName = "display_name"
        case deviceName = "device_name"
        case assetTag = "asset_tag"
        case lastInventoryUpdate = "last_inventory_update"
        case capacity = "capacity"
        case capacityMb = "capacity_mb"
        case available = "available"
        case availableMb = "available_mb"
        case percentageUsed = "percentage_used"
        case osType = "os_type"
        case osVersion = "os_version"
        case osBuild = "os_build"
        case serialNumber = "serial_number"
        case udid = "udid"
        case initialEntryDate = "initial_entry_date"
        case phoneNumber = "phone_number"
        case ipAddress = "ip_address"
        case wifiMacAddress = "wifi_mac_address"
        case bluetoothMacAddress = "bluetooth_mac_address"
        case modemFirmware = "modem_firmware"
        case model = "model"
        case modelIdentifier = "model_identifier"
        case modelNumber = "model_number"
        case modelDisplay = "model_display"
        case deviceOwnershipLevel = "device_ownership_level"
        case lastEnrollment = "last_enrollment"
        case managed = "managed"
        case supervised = "supervised"
        case exchangeActiveSyncDeviceIdentifier = "exchange_activesync_device_identifier"
        case shared = "shared"
        case tethered = "tethered"
        case batteryLevel = "battery_level"
        case bluetoothCapable = "ble_capable"
        case deviceLocatorServiceEnabled = "device_locator_service_enabled"
        case doNotDisturbEnabled = "do_not_disturb_enabled"
        case cloudBackupEnabled = "cloud_backup_enabled"
        case lastCloudBackupDate = "last_cloud_backup_date"
        case locationServicesEnabled = "location_services_enabled"
        case iTunesStoreAccountIsActive = "itunes_store_account_is_active"
        case lastBackupTime = "last_backup_time"
    }

    public static let UDIDKey = CodingKeys.udid.rawValue
    public static let SerialNumberKey = CodingKeys.serialNumber.rawValue

    // MARK: - Properties

    @objc
    public var displayName = ""

    @objc
    public var deviceName = ""

    @objc
    public var assetTag = ""

    @objc
    public var lastInventoryUpdate: PreciseDate?

    @objc
    public var capacity: UInt = 0

    @objc
    public var capacityMb: UInt = 0

    @objc
    public var available: UInt = 0

    @objc
    public var availableMb: UInt = 0

    @objc
    public var percentageUsed: UInt = 0

    @objc
    public var osType = ""

    @objc
    public var osVersion = ""

    @objc
    public var osBuild = ""

    @objc
    public var serialNumber = ""

    @objc
    public var udid = ""

    @objc
    public var initialEntryDate: PreciseDate?

    @objc
    public var phoneNumber = ""

    @objc
    public var ipAddress = ""

    @objc
    public var wifiMacAddress = ""

    @objc
    public var bluetoothMacAddress = ""

    @objc
    public var modemFirmware = ""

    @objc
    public var model = ""

    @objc
    public var modelIdentifier = ""

    @objc
    public var modelNumber = ""

    @objc
    public var modelDisplay = ""

    @objc
    public var deviceOwnershipLevel = ""

    @objc
    public var lastEnrollment: PreciseDate?

    @objc
    public var isManaged = false

    @objc
    public var isSupervised = false

    @objc
    public var exchangeActiveSyncDeviceIdentifier = ""

    @objc
    public var shared = ""

    @objc
    public var tethered = ""

    @objc
    public var batteryLevel: UInt = 0

    @objc
    public var isBluetoothCapable = false

    @objc
    public var isDeviceLocatorServiceEnabled = false

    @objc
    public var isDoNotDisturbEnabled = false

    @objc
    public var isCloudBackupEnabled = false

    @objc
    public var lastCloudBackupDate: PreciseDate?

    @objc
    public var isLocationServicesEnabled = false

    @objc
    public var isITunesStoreAccountActive = false

    @objc
    public var lastBackupTime: PreciseDate?

    // MARK: - Initialization

    public override init?(identifier: UInt, name: String) {
        super.init(identifier: identifier, name: name)
    }

    public required init?(json: [String: Any], node: String = "") {
        displayName = json[CodingKeys.displayName.rawValue] as? String ?? ""
        deviceName = json[CodingKeys.deviceName.rawValue] as? String ?? ""
        assetTag = json[CodingKeys.assetTag.rawValue] as? String ?? ""
        lastInventoryUpdate = PreciseDate(json: json, node: CodingKeys.lastInventoryUpdate.rawValue)
        capacity = json[CodingKeys.capacity.rawValue] as? UInt ?? 0
        capacityMb = json[CodingKeys.capacityMb.rawValue] as? UInt ?? 0
        available = json[CodingKeys.available.rawValue] as? UInt ?? 0
        availableMb = json[CodingKeys.availableMb.rawValue] as? UInt ?? 0
        percentageUsed = json[CodingKeys.percentageUsed.rawValue] as? UInt ?? 0
        osType = json[CodingKeys.osType.rawValue] as? String ?? ""
        osVersion = json[CodingKeys.osVersion.rawValue] as? String ?? ""
        osBuild = json[CodingKeys.osBuild.rawValue] as? String ?? ""
        serialNumber = json[CodingKeys.serialNumber.rawValue] as? String ?? ""
        udid = json[CodingKeys.udid.rawValue] as? String ?? ""
        initialEntryDate = PreciseDate(json: json, node: CodingKeys.initialEntryDate.rawValue)
        phoneNumber = json[CodingKeys.phoneNumber.rawValue] as? String ?? ""
        ipAddress = json[CodingKeys.ipAddress.rawValue] as? String ?? ""
        wifiMacAddress = json[CodingKeys.wifiMacAddress.rawValue] as? String ?? ""
        bluetoothMacAddress = json[CodingKeys.bluetoothMacAddress.rawValue] as? String ?? ""
        modemFirmware = json[CodingKeys.modemFirmware.rawValue] as? String ?? ""
        model = json[CodingKeys.model.rawValue] as? String ?? ""
        modelIdentifier = json[CodingKeys.modelIdentifier.rawValue] as? String ?? ""
        modelNumber = json[CodingKeys.modelNumber.rawValue] as? String ?? ""
        modelDisplay = json[CodingKeys.modelDisplay.rawValue] as? String ?? ""
        deviceOwnershipLevel = json[CodingKeys.deviceOwnershipLevel.rawValue] as? String ?? ""
        lastEnrollment = PreciseDate(json: json, node: CodingKeys.lastEnrollment.rawValue)
        isManaged = json[CodingKeys.managed.rawValue] as? Bool ?? false
        isSupervised = json[CodingKeys.supervised.rawValue] as? Bool ?? false
        exchangeActiveSyncDeviceIdentifier = json[CodingKeys.exchangeActiveSyncDeviceIdentifier.rawValue] as? String ?? ""
        shared = json[CodingKeys.shared.rawValue] as? String ?? ""
        tethered = json[CodingKeys.tethered.rawValue] as? String ?? ""
        batteryLevel = json[CodingKeys.batteryLevel.rawValue] as? UInt ?? 0
        isBluetoothCapable = json[CodingKeys.bluetoothCapable.rawValue] as? Bool ?? false
        isDeviceLocatorServiceEnabled = json[CodingKeys.deviceLocatorServiceEnabled.rawValue] as? Bool ?? false
        isDoNotDisturbEnabled = json[CodingKeys.doNotDisturbEnabled.rawValue] as? Bool ?? false
        isCloudBackupEnabled = json[CodingKeys.cloudBackupEnabled.rawValue] as? Bool ?? false
        lastCloudBackupDate = PreciseDate(json: json, node: CodingKeys.lastCloudBackupDate.rawValue)
        isLocationServicesEnabled = json[CodingKeys.locationServicesEnabled.rawValue] as? Bool ?? false
        isITunesStoreAccountActive = json[CodingKeys.iTunesStoreAccountIsActive.rawValue] as? Bool ?? false
        lastBackupTime = PreciseDate(json: json, node: CodingKeys.lastBackupTime.rawValue)

        super.init(json: json)
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        displayName = try container.decode(String.self, forKey: .displayName)
        deviceName = try container.decode(String.self, forKey: .deviceName)
        assetTag = try container.decode(String.self, forKey: .assetTag)
        lastInventoryUpdate = try container.decode(PreciseDate.self, forKey: .lastInventoryUpdate)
        capacity = try container.decode(UInt.self, forKey: .capacity)
        capacityMb = try container.decode(UInt.self, forKey: .capacityMb)
        available = try container.decode(UInt.self, forKey: .available)
        availableMb = try container.decode(UInt.self, forKey: .availableMb)
        percentageUsed = try container.decode(UInt.self, forKey: .percentageUsed)
        osType = try container.decode(String.self, forKey: .osType)
        osVersion = try container.decode(String.self, forKey: .osVersion)
        osBuild = try container.decode(String.self, forKey: .osBuild)
        serialNumber = try container.decode(String.self, forKey: .serialNumber)
        udid = try container.decode(String.self, forKey: .udid)
        initialEntryDate = try container.decode(PreciseDate.self, forKey: .initialEntryDate)
        phoneNumber = try container.decode(String.self, forKey: .phoneNumber)
        ipAddress = try container.decode(String.self, forKey: .ipAddress)
        wifiMacAddress = try container.decode(String.self, forKey: .wifiMacAddress)
        bluetoothMacAddress = try container.decode(String.self, forKey: .bluetoothMacAddress)
        modemFirmware = try container.decode(String.self, forKey: .modemFirmware)
        model = try container.decode(String.self, forKey: .model)
        modelIdentifier = try container.decode(String.self, forKey: .modelIdentifier)
        modelNumber = try container.decode(String.self, forKey: .modelNumber)
        modelDisplay = try container.decode(String.self, forKey: .modelDisplay)
        deviceOwnershipLevel = try container.decode(String.self, forKey: .deviceOwnershipLevel)
        lastEnrollment = try container.decode(PreciseDate.self, forKey: .lastEnrollment)
        isManaged = try container.decode(Bool.self, forKey: .managed)
        isSupervised = try container.decode(Bool.self, forKey: .supervised)
        exchangeActiveSyncDeviceIdentifier = try container.decode(String.self, forKey: .exchangeActiveSyncDeviceIdentifier)
        shared = try container.decode(String.self, forKey: .shared)
        tethered = try container.decode(String.self, forKey: .tethered)
        batteryLevel = try container.decode(UInt.self, forKey: .batteryLevel)
        isBluetoothCapable = try container.decode(Bool.self, forKey: .bluetoothCapable)
        isDeviceLocatorServiceEnabled = try container.decode(Bool.self, forKey: .deviceLocatorServiceEnabled)
        isDoNotDisturbEnabled = try container.decode(Bool.self, forKey: .doNotDisturbEnabled)
        isCloudBackupEnabled = try container.decode(Bool.self, forKey: .cloudBackupEnabled)
        lastCloudBackupDate = try container.decode(PreciseDate.self, forKey: .lastCloudBackupDate)
        isLocationServicesEnabled = try container.decode(Bool.self, forKey: .locationServicesEnabled)
        isITunesStoreAccountActive = try container.decode(Bool.self, forKey: .iTunesStoreAccountIsActive)
        lastBackupTime = try container.decode(PreciseDate.self, forKey: .lastBackupTime)

        try super.init(from: decoder)
    }

    // MARK: - Functions

    public override func toJSON() -> [String: Any] {
        var json = super.toJSON()

        json[CodingKeys.displayName.rawValue] = displayName
        json[CodingKeys.deviceName.rawValue] = deviceName
        json[CodingKeys.assetTag.rawValue] = assetTag

        if let lastInventoryUpdate = lastInventoryUpdate {
            json.merge(lastInventoryUpdate.toJSON()) { (_, new) in new }
        }

        json[CodingKeys.capacity.rawValue] = capacity
        json[CodingKeys.capacityMb.rawValue] = capacityMb
        json[CodingKeys.available.rawValue] = available
        json[CodingKeys.availableMb.rawValue] = availableMb
        json[CodingKeys.percentageUsed.rawValue] = percentageUsed
        json[CodingKeys.osType.rawValue] = osType
        json[CodingKeys.osVersion.rawValue] = osVersion
        json[CodingKeys.osBuild.rawValue] = osBuild
        json[CodingKeys.serialNumber.rawValue] = serialNumber
        json[CodingKeys.udid.rawValue] = udid

        if let initialEntryDate = initialEntryDate {
            json.merge(initialEntryDate.toJSON()) { (_, new) in new }
        }

        json[CodingKeys.phoneNumber.rawValue] = phoneNumber
        json[CodingKeys.ipAddress.rawValue] = ipAddress
        json[CodingKeys.wifiMacAddress.rawValue] = wifiMacAddress
        json[CodingKeys.bluetoothMacAddress.rawValue] = bluetoothMacAddress
        json[CodingKeys.modemFirmware.rawValue] = modemFirmware
        json[CodingKeys.model.rawValue] = model
        json[CodingKeys.modelIdentifier.rawValue] = modelIdentifier
        json[CodingKeys.modelNumber.rawValue] = modelNumber
        json[CodingKeys.modelDisplay.rawValue] = modelDisplay
        json[CodingKeys.deviceOwnershipLevel.rawValue] = deviceOwnershipLevel

        if let lastEnrollment = lastEnrollment {
            json.merge(lastEnrollment.toJSON()) { (_, new) in new }
        }

        json[CodingKeys.managed.rawValue] = isManaged
        json[CodingKeys.supervised.rawValue] = isSupervised
        json[CodingKeys.exchangeActiveSyncDeviceIdentifier.rawValue] = exchangeActiveSyncDeviceIdentifier
        json[CodingKeys.shared.rawValue] = shared
        json[CodingKeys.tethered.rawValue] = tethered
        json[CodingKeys.batteryLevel.rawValue] = batteryLevel
        json[CodingKeys.bluetoothCapable.rawValue] = isBluetoothCapable
        json[CodingKeys.deviceLocatorServiceEnabled.rawValue] = isDeviceLocatorServiceEnabled
        json[CodingKeys.doNotDisturbEnabled.rawValue] = isDoNotDisturbEnabled
        json[CodingKeys.cloudBackupEnabled.rawValue] = isCloudBackupEnabled

        if let lastCloudBackupDate = lastCloudBackupDate {
            json.merge(lastCloudBackupDate.toJSON()) { (_, new) in new }
        }

        json[CodingKeys.locationServicesEnabled.rawValue] = isLocationServicesEnabled
        json[CodingKeys.iTunesStoreAccountIsActive.rawValue] = isITunesStoreAccountActive

        if let lastBackupTime = lastBackupTime {
            json.merge(lastBackupTime.toJSON()) { (_, new) in new }
        }

        return json
    }

    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(displayName, forKey: .displayName)
        try container.encode(deviceName, forKey: .deviceName)
        try container.encode(assetTag, forKey: .assetTag)
        try container.encode(lastInventoryUpdate, forKey: .lastInventoryUpdate)
        try container.encode(capacity, forKey: .capacity)
        try container.encode(capacityMb, forKey: .capacityMb)
        try container.encode(available, forKey: .available)
        try container.encode(availableMb, forKey: .availableMb)
        try container.encode(percentageUsed, forKey: .percentageUsed)
        try container.encode(osType, forKey: .osType)
        try container.encode(osVersion, forKey: .osVersion)
        try container.encode(osBuild, forKey: .osBuild)
        try container.encode(serialNumber, forKey: .serialNumber)
        try container.encode(udid, forKey: .udid)
        try container.encode(initialEntryDate, forKey: .initialEntryDate)
        try container.encode(phoneNumber, forKey: .phoneNumber)
        try container.encode(ipAddress, forKey: .ipAddress)
        try container.encode(wifiMacAddress, forKey: .wifiMacAddress)
        try container.encode(bluetoothMacAddress, forKey: .bluetoothMacAddress)
        try container.encode(modemFirmware, forKey: .modemFirmware)
        try container.encode(model, forKey: .model)
        try container.encode(modelIdentifier, forKey: .modelIdentifier)
        try container.encode(modelNumber, forKey: .modelNumber)
        try container.encode(modelDisplay, forKey: .modelDisplay)
        try container.encode(deviceOwnershipLevel, forKey: .deviceOwnershipLevel)
        try container.encode(lastEnrollment, forKey: .lastEnrollment)
        try container.encode(isManaged, forKey: .managed)
        try container.encode(isSupervised, forKey: .supervised)
        try container.encode(exchangeActiveSyncDeviceIdentifier, forKey: .exchangeActiveSyncDeviceIdentifier)
        try container.encode(shared, forKey: .shared)
        try container.encode(tethered, forKey: .tethered)
        try container.encode(batteryLevel, forKey: .batteryLevel)
        try container.encode(isBluetoothCapable, forKey: .bluetoothCapable)
        try container.encode(isDeviceLocatorServiceEnabled, forKey: .deviceLocatorServiceEnabled)
        try container.encode(isDoNotDisturbEnabled, forKey: .doNotDisturbEnabled)
        try container.encode(isCloudBackupEnabled, forKey: .cloudBackupEnabled)
        try container.encode(lastCloudBackupDate, forKey: .lastCloudBackupDate)
        try container.encode(isLocationServicesEnabled, forKey: .locationServicesEnabled)
        try container.encode(isITunesStoreAccountActive, forKey: .iTunesStoreAccountIsActive)
        try container.encode(lastBackupTime, forKey: .lastBackupTime)

        try super.encode(to: encoder)
    }
}
