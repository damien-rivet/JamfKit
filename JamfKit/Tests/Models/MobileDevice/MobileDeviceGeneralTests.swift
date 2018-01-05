//
//  MobileDeviceGeneralTests.swift
//  JamfKit
//
//  Copyright © 2018 JamfKit. All rights reserved.
//

import XCTest

@testable import JamfKit

class MobileDeviceGeneralTests: XCTestCase {

    // MARK: - Constants

    let subfolder = "MobileDevice/"
    let defaultIdentifier: UInt = 12345
    let defaultName = "Mobile Device"
    let defaultDisplayName = "Mobile Device"
    let defaultDeviceName = "mobile_device"
    let defaultAssetTag = "asset_tag"
    let defaultCapacity: UInt = 1024
    let defaultCapacityMb: UInt = 1024
    let defaultAvailable: UInt = 1024
    let defaultAvailableMb: UInt = 1024
    let defaultPercentageUsed: UInt = 5
    let defaultOsType = "iOS"
    let defaultOsVersion = "10.3.2"
    let defaultOsBuild = "14F89"
    let defaultSerialNumber = "C02Q7KHTGFWF"
    let defaultUdid = "270aae10800b6e61a2ee2bbc285eb967050b5984"
    let defaultPhoneNumber = "123-555-6789"
    let defaultIpAddress = "192.0.0.1"
    let defaultWifiMacAddress = "E0:AC:CB:97:36:G4"
    let defaultBluetoothMacAddress = "E0:AC:CB:97:36:G6"
    let defaultModemFirmware = "2.61.00"
    let defaultModel = "iPhone 6S"
    let defaultModelIdentifier = "iPhone8,1"
    let defaultModelNumber = "MKRY2LL"
    let defaultModelDisplay = "iPhone 6S"
    let defaultDeviceOwnershipLevel = "Institutional"
    let defaultIsManaged = true
    let defaultIsSupervised = true
    let defaultExchangeActiveSyncDeviceIdentifier = "TUCLLFJHPL779ACL9DCJQFN39F"
    let defaultShared = "shared"
    let defaultTethered = "tethered"
    let defaultBatteryLevel: UInt = 95
    let defaultIsBluetoothCapable = true
    let defaultIsDeviceLocatorServiceEnabled = true
    let defaultIsDoNotDisturbEnabled = true
    let defaultIsCloudBackupEnabled = true
    let defaultIsLocationServicesEnabled = true
    let defaultIsITunesStoreAccountActive = true

    // MARK: - Tests

    func testShouldInitializeFromJSON() {
        let payload = self.payload(for: "mobile_device_general_valid", subfolder: subfolder)!

        let defaultLastInventoryUpdate = PreciseDate(json: payload, node: "last_inventory_update")
        let defaultInitialEntryDate = PreciseDate(json: payload, node: "initial_entry_date")
        let defaultLastEnrollment = PreciseDate(json: payload, node: "last_enrollment")
        let defaultLastCloudBackupDate = PreciseDate(json: payload, node: "last_cloud_backup_date")
        let defaultLastBackupTime = PreciseDate(json: payload, node: "last_backup_time")

        let actualValue = MobileDeviceGeneral(json: payload)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.identifier, defaultIdentifier)
        XCTAssertEqual(actualValue?.name, defaultName)
        XCTAssertEqual(actualValue?.deviceName, defaultDeviceName)
        XCTAssertEqual(actualValue?.assetTag, defaultAssetTag)
        XCTAssertEqual(actualValue?.lastInventoryUpdate?.date, defaultLastInventoryUpdate?.date)
        XCTAssertEqual(actualValue?.lastInventoryUpdate?.epoch, defaultLastInventoryUpdate?.epoch)
        XCTAssertEqual(actualValue?.lastInventoryUpdate?.dateUTC, defaultLastInventoryUpdate?.dateUTC)
        XCTAssertEqual(actualValue?.capacity, defaultCapacity)
        XCTAssertEqual(actualValue?.capacityMb, defaultCapacityMb)
        XCTAssertEqual(actualValue?.available, defaultAvailable)
        XCTAssertEqual(actualValue?.availableMb, defaultAvailableMb)
        XCTAssertEqual(actualValue?.percentageUsed, defaultPercentageUsed)
        XCTAssertEqual(actualValue?.osType, defaultOsType)
        XCTAssertEqual(actualValue?.osVersion, defaultOsVersion)
        XCTAssertEqual(actualValue?.osBuild, defaultOsBuild)
        XCTAssertEqual(actualValue?.serialNumber, defaultSerialNumber)
        XCTAssertEqual(actualValue?.udid, defaultUdid)
        XCTAssertNil(actualValue?.initialEntryDate?.date)
        XCTAssertEqual(actualValue?.initialEntryDate?.epoch, defaultInitialEntryDate?.epoch)
        XCTAssertEqual(actualValue?.initialEntryDate?.dateUTC, defaultInitialEntryDate?.dateUTC)
        XCTAssertEqual(actualValue?.phoneNumber, defaultPhoneNumber)
        XCTAssertEqual(actualValue?.ipAddress, defaultIpAddress)
        XCTAssertEqual(actualValue?.wifiMacAddress, defaultWifiMacAddress)
        XCTAssertEqual(actualValue?.bluetoothMacAddress, defaultBluetoothMacAddress)
        XCTAssertEqual(actualValue?.modemFirmware, defaultModemFirmware)
        XCTAssertEqual(actualValue?.model, defaultModel)
        XCTAssertEqual(actualValue?.modelIdentifier, defaultModelIdentifier)
        XCTAssertEqual(actualValue?.modelNumber, defaultModelNumber)
        XCTAssertEqual(actualValue?.modelDisplay, defaultModelDisplay)
        XCTAssertEqual(actualValue?.deviceOwnershipLevel, defaultDeviceOwnershipLevel)
        XCTAssertNil(actualValue?.lastEnrollment?.date)
        XCTAssertEqual(actualValue?.lastEnrollment?.epoch, defaultLastEnrollment?.epoch)
        XCTAssertEqual(actualValue?.lastEnrollment?.dateUTC, defaultLastEnrollment?.dateUTC)
        XCTAssertEqual(actualValue?.isManaged, defaultIsManaged)
        XCTAssertEqual(actualValue?.isSupervised, defaultIsSupervised)
        XCTAssertEqual(actualValue?.exchangeActiveSyncDeviceIdentifier, defaultExchangeActiveSyncDeviceIdentifier)
        XCTAssertEqual(actualValue?.shared, defaultShared)
        XCTAssertEqual(actualValue?.tethered, defaultTethered)
        XCTAssertEqual(actualValue?.batteryLevel, defaultBatteryLevel)
        XCTAssertEqual(actualValue?.isBluetoothCapable, defaultIsBluetoothCapable)
        XCTAssertEqual(actualValue?.isDeviceLocatorServiceEnabled, defaultIsDeviceLocatorServiceEnabled)
        XCTAssertEqual(actualValue?.isDoNotDisturbEnabled, defaultIsDoNotDisturbEnabled)
        XCTAssertEqual(actualValue?.isCloudBackupEnabled, defaultIsCloudBackupEnabled)
        XCTAssertNil(actualValue?.lastCloudBackupDate?.date)
        XCTAssertEqual(actualValue?.lastCloudBackupDate?.epoch, defaultLastCloudBackupDate?.epoch)
        XCTAssertEqual(actualValue?.lastCloudBackupDate?.dateUTC, defaultLastCloudBackupDate?.dateUTC)
        XCTAssertEqual(actualValue?.isLocationServicesEnabled, defaultIsLocationServicesEnabled)
        XCTAssertEqual(actualValue?.isITunesStoreAccountActive, defaultIsITunesStoreAccountActive)
        XCTAssertNil(actualValue?.lastBackupTime?.date)
        XCTAssertEqual(actualValue?.lastBackupTime?.epoch, defaultLastBackupTime?.epoch)
        XCTAssertEqual(actualValue?.lastBackupTime?.dateUTC, defaultLastBackupTime?.dateUTC)

    }

    func testShouldInitializeFromIncompleteJSON() {
        let payload = self.payload(for: "mobile_device_general_incomplete", subfolder: subfolder)!

        let defaultLastInventoryUpdate = PreciseDate(json: payload, node: "last_inventory_update")
        let defaultInitialEntryDate = PreciseDate(json: payload, node: "initial_entry_date")
        let defaultLastEnrollment = PreciseDate(json: payload, node: "last_enrollment")
        let defaultLastCloudBackupDate = PreciseDate(json: payload, node: "last_cloud_backup_date")
        let defaultLastBackupTime = PreciseDate(json: payload, node: "last_backup_time")

        let actualValue = MobileDeviceGeneral(json: payload)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.identifier, defaultIdentifier)
        XCTAssertEqual(actualValue?.name, defaultName)
        XCTAssertEqual(actualValue?.deviceName, "")
        XCTAssertEqual(actualValue?.assetTag, "")
        XCTAssertEqual(actualValue?.lastInventoryUpdate?.date, defaultLastInventoryUpdate?.date)
        XCTAssertEqual(actualValue?.lastInventoryUpdate?.epoch, defaultLastInventoryUpdate?.epoch)
        XCTAssertEqual(actualValue?.lastInventoryUpdate?.dateUTC, defaultLastInventoryUpdate?.dateUTC)
        XCTAssertEqual(actualValue?.capacity, 0)
        XCTAssertEqual(actualValue?.capacityMb, 0)
        XCTAssertEqual(actualValue?.available, 0)
        XCTAssertEqual(actualValue?.availableMb, 0)
        XCTAssertEqual(actualValue?.percentageUsed, 0)
        XCTAssertEqual(actualValue?.osType, "")
        XCTAssertEqual(actualValue?.osVersion, "")
        XCTAssertEqual(actualValue?.osBuild, "")
        XCTAssertEqual(actualValue?.serialNumber, "")
        XCTAssertEqual(actualValue?.udid, "")
        XCTAssertNil(actualValue?.initialEntryDate?.date)
        XCTAssertEqual(actualValue?.initialEntryDate?.epoch, defaultInitialEntryDate?.epoch)
        XCTAssertEqual(actualValue?.initialEntryDate?.dateUTC, defaultInitialEntryDate?.dateUTC)
        XCTAssertEqual(actualValue?.phoneNumber, "")
        XCTAssertEqual(actualValue?.ipAddress, "")
        XCTAssertEqual(actualValue?.wifiMacAddress, "")
        XCTAssertEqual(actualValue?.bluetoothMacAddress, "")
        XCTAssertEqual(actualValue?.modemFirmware, "")
        XCTAssertEqual(actualValue?.model, "")
        XCTAssertEqual(actualValue?.modelIdentifier, "")
        XCTAssertEqual(actualValue?.modelNumber, "")
        XCTAssertEqual(actualValue?.modelDisplay, "")
        XCTAssertEqual(actualValue?.deviceOwnershipLevel, "")
        XCTAssertNil(actualValue?.lastEnrollment?.date)
        XCTAssertEqual(actualValue?.lastEnrollment?.epoch, defaultLastEnrollment?.epoch)
        XCTAssertEqual(actualValue?.lastEnrollment?.dateUTC, defaultLastEnrollment?.dateUTC)
        XCTAssertEqual(actualValue?.isManaged, false)
        XCTAssertEqual(actualValue?.isSupervised, false)
        XCTAssertEqual(actualValue?.exchangeActiveSyncDeviceIdentifier, "")
        XCTAssertEqual(actualValue?.shared, "")
        XCTAssertEqual(actualValue?.tethered, "")
        XCTAssertEqual(actualValue?.batteryLevel, 0)
        XCTAssertEqual(actualValue?.isBluetoothCapable, false)
        XCTAssertEqual(actualValue?.isDeviceLocatorServiceEnabled, false)
        XCTAssertEqual(actualValue?.isDoNotDisturbEnabled, false)
        XCTAssertEqual(actualValue?.isCloudBackupEnabled, false)
        XCTAssertNil(actualValue?.lastCloudBackupDate?.date)
        XCTAssertEqual(actualValue?.lastCloudBackupDate?.epoch, defaultLastCloudBackupDate?.epoch)
        XCTAssertEqual(actualValue?.lastCloudBackupDate?.dateUTC, defaultLastCloudBackupDate?.dateUTC)
        XCTAssertEqual(actualValue?.isLocationServicesEnabled, false)
        XCTAssertEqual(actualValue?.isITunesStoreAccountActive, false)
        XCTAssertNil(actualValue?.lastBackupTime?.date)
        XCTAssertEqual(actualValue?.lastBackupTime?.epoch, defaultLastBackupTime?.epoch)
        XCTAssertEqual(actualValue?.lastBackupTime?.dateUTC, defaultLastBackupTime?.dateUTC)
    }

    func testShouldNotInitializeFromInvalidJSON() {
        let payload = self.payload(for: "mobile_device_general_invalid", subfolder: subfolder)!

        let site = MobileDeviceGeneral(json: payload)

        XCTAssertNil(site)
    }

    func testShouldEncodeToJSON() {
        let payload = self.payload(for: "mobile_device_general_valid", subfolder: subfolder)!

        let actualValue = MobileDeviceGeneral(json: payload)
        let encodedObject = actualValue?.toJSON()

        XCTAssertNotNil(encodedObject)
        XCTAssertEqual(encodedObject?.count, 48)
        
        XCTAssertNotNil(encodedObject?[MobileDeviceGeneral.IdentifierKey])
        XCTAssertNotNil(encodedObject?[MobileDeviceGeneral.NameKey])
        XCTAssertNotNil(encodedObject?[MobileDeviceGeneral.DeviceNameKey])
        XCTAssertNotNil(encodedObject?[MobileDeviceGeneral.AssetTagNameKey])
        XCTAssertNotNil(encodedObject?[MobileDeviceGeneral.LastInventoryUpdateKey])
        XCTAssertNotNil(encodedObject?[MobileDeviceGeneral.LastInventoryUpdateKey + PreciseDate.EpochKey])
        XCTAssertNotNil(encodedObject?[MobileDeviceGeneral.LastInventoryUpdateKey + PreciseDate.UTCKey])
        XCTAssertNotNil(encodedObject?[MobileDeviceGeneral.CapacityKey])
        XCTAssertNotNil(encodedObject?[MobileDeviceGeneral.CapacityMbKey])
        XCTAssertNotNil(encodedObject?[MobileDeviceGeneral.AvailableKey])
        XCTAssertNotNil(encodedObject?[MobileDeviceGeneral.AvailableMbKey])
        XCTAssertNotNil(encodedObject?[MobileDeviceGeneral.PercentageUsedKey])
        XCTAssertNotNil(encodedObject?[MobileDeviceGeneral.OSTypeKey])
        XCTAssertNotNil(encodedObject?[MobileDeviceGeneral.OSVersionKey])
        XCTAssertNotNil(encodedObject?[MobileDeviceGeneral.OSBuildKey])
        XCTAssertNotNil(encodedObject?[MobileDeviceGeneral.SerialNumberKey])
        XCTAssertNotNil(encodedObject?[MobileDeviceGeneral.UDIDKey])
        XCTAssertNotNil(encodedObject?[MobileDeviceGeneral.InitialEntryDateKey + PreciseDate.EpochKey])
        XCTAssertNotNil(encodedObject?[MobileDeviceGeneral.InitialEntryDateKey + PreciseDate.UTCKey])
        XCTAssertNotNil(encodedObject?[MobileDeviceGeneral.PhoneNumberKey])
        XCTAssertNotNil(encodedObject?[MobileDeviceGeneral.IPAddressKey])
        XCTAssertNotNil(encodedObject?[MobileDeviceGeneral.WifiMacAddressKey])
        XCTAssertNotNil(encodedObject?[MobileDeviceGeneral.BluetoothMacAddressKey])
        XCTAssertNotNil(encodedObject?[MobileDeviceGeneral.ModemFirmwareKey])
        XCTAssertNotNil(encodedObject?[MobileDeviceGeneral.ModelKey])
        XCTAssertNotNil(encodedObject?[MobileDeviceGeneral.ModelIdentifierKey])
        XCTAssertNotNil(encodedObject?[MobileDeviceGeneral.ModelNumberKey])
        XCTAssertNotNil(encodedObject?[MobileDeviceGeneral.ModelDisplayKey])
        XCTAssertNotNil(encodedObject?[MobileDeviceGeneral.DeviceOwnershipLevelKey])
        XCTAssertNotNil(encodedObject?[MobileDeviceGeneral.LastEnrollmentKey + PreciseDate.EpochKey])
        XCTAssertNotNil(encodedObject?[MobileDeviceGeneral.LastEnrollmentKey + PreciseDate.UTCKey])
        XCTAssertNotNil(encodedObject?[MobileDeviceGeneral.ManagedKey])
        XCTAssertNotNil(encodedObject?[MobileDeviceGeneral.SupervisedKey])
        XCTAssertNotNil(encodedObject?[MobileDeviceGeneral.ExchangeActiveSyncDeviceIdentifierKey])
        XCTAssertNotNil(encodedObject?[MobileDeviceGeneral.SharedKey])
        XCTAssertNotNil(encodedObject?[MobileDeviceGeneral.TetheredKey])
        XCTAssertNotNil(encodedObject?[MobileDeviceGeneral.BatteryLevelKey])
        XCTAssertNotNil(encodedObject?[MobileDeviceGeneral.BluetoothCapableKey])
        XCTAssertNotNil(encodedObject?[MobileDeviceGeneral.DeviceLocatorServiceEnabledKey])
        XCTAssertNotNil(encodedObject?[MobileDeviceGeneral.DoNotDisturbEnabledKey])
        XCTAssertNotNil(encodedObject?[MobileDeviceGeneral.CloudBackupEnabledKey])
        XCTAssertNotNil(encodedObject?[MobileDeviceGeneral.LastCloudBackupDateKey + PreciseDate.EpochKey])
        XCTAssertNotNil(encodedObject?[MobileDeviceGeneral.LastCloudBackupDateKey + PreciseDate.UTCKey])
        XCTAssertNotNil(encodedObject?[MobileDeviceGeneral.LocationServicesEnabledKey])
        XCTAssertNotNil(encodedObject?[MobileDeviceGeneral.ITunesStoreAccountIsActiveKey])
        XCTAssertNotNil(encodedObject?[MobileDeviceGeneral.LastBackupTimeKey + PreciseDate.EpochKey])
        XCTAssertNotNil(encodedObject?[MobileDeviceGeneral.LastBackupTimeKey + PreciseDate.UTCKey])
    }
}
