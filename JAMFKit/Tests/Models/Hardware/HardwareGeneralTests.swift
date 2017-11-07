//
//  HardwareGeneralTests.swift
//  JAMFKit
//
//  Created by Damien Rivet on 08.11.17.
//  Copyright © 2017 JAMFKit. All rights reserved.
//

import XCTest

@testable import JAMFKit

class HardwareGeneralTests: XCTestCase {

    // MARK: - Constants

    let defaultIdentifier: UInt = 0
    let defaultName = "Admins iMac"
    let defaultMacAddress = "E0:AC:CB:97:36:G4"
    let defaultAlternativeMacAddress = "E0:AC:CB:97:36:G4"
    let defaultIpAddress = "10.1.1.1"
    let defaultLastReportedIpAddress = "192.0.0.1"
    let defaultSerialNumber = "C02Q7KHTGFWF"
    let defaultUdid = "55900BDC-347C-58B1-D249-F32244B11D30"
    let defaultJamfVersion = "9.99.0-t1494340586"
    let defaultPlatform = "Mac"
    let defaultBarcode1 = "string"
    let defaultBarcode2 = "string"
    let defaultAssetTag = "string"
    let defaultRemoteManagementIsManaged = true
    let defaultRemoteManagementUsername = "username"
    let defaultMdmCapable = true
    let defaultMdmCapableUsers = ["string"]
    let defaultDistributionPoint = "string"
    let defaultSus = "string"
    let defaultNetbootServer = "string"
    let defaultITunesStoreAccountActivated = true

    // MARK: - Tests

    func testShouldInitializeFromJSON() {
        let payload = self.payload(for: "hardware_general_valid")!
        guard let generalPayload = payload[Hardware.GeneralKey] as? [String: AnyObject] else {
            XCTFail()
            return
        }

        let defaultReportDate = PreciseDate(json: generalPayload, node: "report_date")
        let defaultLastContactTime = PreciseDate(json: generalPayload, node: "last_contact_time")
        let defaultInitialEntryDate = PreciseDate(json: generalPayload, node: "initial_entry_date")
        let defaultLastCloudBackupDate = PreciseDate(json: generalPayload, node: "last_cloud_backup_date")
        let defaultLastEnrolledDate = PreciseDate(json: generalPayload, node: "last_enrolled_date")

        let actualValue = HardwareGeneral(json: payload, node: Hardware.GeneralKey)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.identifier, defaultIdentifier)
        XCTAssertEqual(actualValue?.macAddress, defaultMacAddress)
        XCTAssertEqual(actualValue?.alternativeMacAddress, defaultAlternativeMacAddress)
        XCTAssertEqual(actualValue?.ipAddress, defaultIpAddress)
        XCTAssertEqual(actualValue?.lastReportedIpAddress, defaultLastReportedIpAddress)
        XCTAssertEqual(actualValue?.serialNumber, defaultSerialNumber)
        XCTAssertEqual(actualValue?.udid, defaultUdid)
        XCTAssertEqual(actualValue?.jamfVersion, defaultJamfVersion)
        XCTAssertEqual(actualValue?.platform, defaultPlatform)
        XCTAssertEqual(actualValue?.barcode1, defaultBarcode1)
        XCTAssertEqual(actualValue?.barcode2, defaultBarcode2)
        XCTAssertEqual(actualValue?.assetTag, defaultAssetTag)
        XCTAssertNotNil(actualValue?.remoteManagement)
        XCTAssertEqual(actualValue?.remoteManagement?.isManaged, defaultRemoteManagementIsManaged)
        XCTAssertEqual(actualValue?.remoteManagement?.managementUsername, defaultRemoteManagementUsername)
        XCTAssertEqual(actualValue?.isMdmCapable, defaultMdmCapable)
        XCTAssertEqual(actualValue?.mdmCapableUsers?.count, defaultMdmCapableUsers.count)
        XCTAssertEqual(actualValue?.reportDate?.date, defaultReportDate?.date)
        XCTAssertEqual(actualValue?.reportDate?.epoch, defaultReportDate?.epoch)
        XCTAssertEqual(actualValue?.reportDate?.dateUTC, defaultReportDate?.dateUTC)
        XCTAssertEqual(actualValue?.lastContactTime?.date, defaultLastContactTime?.date)
        XCTAssertEqual(actualValue?.lastContactTime?.epoch, defaultLastContactTime?.epoch)
        XCTAssertEqual(actualValue?.lastContactTime?.dateUTC, defaultLastContactTime?.dateUTC)
        XCTAssertEqual(actualValue?.initialEntryDate?.date, defaultInitialEntryDate?.date)
        XCTAssertEqual(actualValue?.initialEntryDate?.epoch, defaultInitialEntryDate?.epoch)
        XCTAssertEqual(actualValue?.initialEntryDate?.dateUTC, defaultInitialEntryDate?.dateUTC)
        XCTAssertEqual(actualValue?.lastCloudBackupDate?.date, defaultLastCloudBackupDate?.date)
        XCTAssertEqual(actualValue?.lastCloudBackupDate?.epoch, defaultLastCloudBackupDate?.epoch)
        XCTAssertEqual(actualValue?.lastCloudBackupDate?.dateUTC, defaultLastCloudBackupDate?.dateUTC)
        XCTAssertEqual(actualValue?.lastEnrolledDate?.date, defaultLastEnrolledDate?.date)
        XCTAssertEqual(actualValue?.lastEnrolledDate?.epoch, defaultLastEnrolledDate?.epoch)
        XCTAssertEqual(actualValue?.lastEnrolledDate?.dateUTC, defaultLastEnrolledDate?.dateUTC)
        XCTAssertEqual(actualValue?.distributionPoint, defaultDistributionPoint)
        XCTAssertEqual(actualValue?.sus, defaultSus)
        XCTAssertEqual(actualValue?.netbootServer, defaultNetbootServer)
        XCTAssertNotNil(actualValue?.site)
        XCTAssertEqual(actualValue?.isITunesStoreAcccountActivated, defaultITunesStoreAccountActivated)
    }

    func testShouldInitializeFromIncompleteJSON() {
        let payload = self.payload(for: "hardware_general_incomplete")!
        guard let generalPayload = payload[Hardware.GeneralKey] as? [String: AnyObject] else {
            XCTFail()
            return
        }

        let defaultReportDate = PreciseDate(json: generalPayload, node: "report_date")
        let defaultLastContactTime = PreciseDate(json: generalPayload, node: "last_contact_time")
        let defaultInitialEntryDate = PreciseDate(json: generalPayload, node: "initial_entry_date")
        let defaultLastCloudBackupDate = PreciseDate(json: generalPayload, node: "last_cloud_backup_date")
        let defaultLastEnrolledDate = PreciseDate(json: generalPayload, node: "last_enrolled_date")

        let actualValue = HardwareGeneral(json: payload, node: Hardware.GeneralKey)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.identifier, defaultIdentifier)
        XCTAssertEqual(actualValue?.macAddress, defaultMacAddress)
        XCTAssertEqual(actualValue?.alternativeMacAddress, defaultAlternativeMacAddress)
        XCTAssertEqual(actualValue?.ipAddress, defaultIpAddress)
        XCTAssertEqual(actualValue?.lastReportedIpAddress, defaultLastReportedIpAddress)
        XCTAssertEqual(actualValue?.serialNumber, defaultSerialNumber)
        XCTAssertEqual(actualValue?.udid, defaultUdid)
        XCTAssertEqual(actualValue?.jamfVersion, defaultJamfVersion)
        XCTAssertEqual(actualValue?.platform, defaultPlatform)
        XCTAssertEqual(actualValue?.isMdmCapable, defaultMdmCapable)
        XCTAssertEqual(actualValue?.reportDate?.date, defaultReportDate?.date)
        XCTAssertEqual(actualValue?.reportDate?.epoch, defaultReportDate?.epoch)
        XCTAssertEqual(actualValue?.reportDate?.dateUTC, defaultReportDate?.dateUTC)
        XCTAssertEqual(actualValue?.lastContactTime?.date, defaultLastContactTime?.date)
        XCTAssertEqual(actualValue?.lastContactTime?.epoch, defaultLastContactTime?.epoch)
        XCTAssertEqual(actualValue?.lastContactTime?.dateUTC, defaultLastContactTime?.dateUTC)
        XCTAssertEqual(actualValue?.initialEntryDate?.date, defaultInitialEntryDate?.date)
        XCTAssertEqual(actualValue?.initialEntryDate?.epoch, defaultInitialEntryDate?.epoch)
        XCTAssertEqual(actualValue?.initialEntryDate?.dateUTC, defaultInitialEntryDate?.dateUTC)
        XCTAssertEqual(actualValue?.lastCloudBackupDate?.date, defaultLastCloudBackupDate?.date)
        XCTAssertEqual(actualValue?.lastCloudBackupDate?.epoch, defaultLastCloudBackupDate?.epoch)
        XCTAssertEqual(actualValue?.lastCloudBackupDate?.dateUTC, defaultLastCloudBackupDate?.dateUTC)
        XCTAssertEqual(actualValue?.lastEnrolledDate?.date, defaultLastEnrolledDate?.date)
        XCTAssertEqual(actualValue?.lastEnrolledDate?.epoch, defaultLastEnrolledDate?.epoch)
        XCTAssertEqual(actualValue?.lastEnrolledDate?.dateUTC, defaultLastEnrolledDate?.dateUTC)
        XCTAssertEqual(actualValue?.distributionPoint, defaultDistributionPoint)
        XCTAssertEqual(actualValue?.sus, defaultSus)
        XCTAssertEqual(actualValue?.netbootServer, defaultNetbootServer)
        XCTAssertEqual(actualValue?.isITunesStoreAcccountActivated, defaultITunesStoreAccountActivated)
    }

    func testShouldNotInitializeFromInvalidJSON() {
        let payload = self.payload(for: "hardware_general_invalid")!

        let site = HardwareGeneral(json: payload, node: Hardware.GeneralKey)

        XCTAssertNil(site)
    }

    func testShouldNotInitializeFromMalformedJSON() {
        let payload = self.payload(for: "hardware_general_malformed")!

        let site = HardwareGeneral(json: payload, node: Hardware.GeneralKey)

        XCTAssertNil(site)
    }

    func testShouldEncodeToJSON() {
        let payload = self.payload(for: "hardware_general_valid")!

        let actualValue = HardwareGeneral(json: payload, node: Hardware.GeneralKey)
        let encodedObject = actualValue?.toJSON()

        XCTAssertNotNil(encodedObject)
        XCTAssertEqual(encodedObject?.count, 34)

        XCTAssertNotNil(encodedObject?[HardwareGeneral.IdentifierKey])
        XCTAssertNotNil(encodedObject?[HardwareGeneral.NameKey])
        XCTAssertNotNil(encodedObject?[HardwareGeneral.MacAddressKey])
        XCTAssertNotNil(encodedObject?[HardwareGeneral.AlternativeMacAddressKey])
        XCTAssertNotNil(encodedObject?[HardwareGeneral.IpAddressKey])
        XCTAssertNotNil(encodedObject?[HardwareGeneral.LastReportedIPAddressKey])
        XCTAssertNotNil(encodedObject?[HardwareGeneral.SerialNumberKey])
        XCTAssertNotNil(encodedObject?[HardwareGeneral.UDIDKey])
        XCTAssertNotNil(encodedObject?[HardwareGeneral.JAMFVersionKey])
        XCTAssertNotNil(encodedObject?[HardwareGeneral.PlatformKey])
        XCTAssertNotNil(encodedObject?[HardwareGeneral.Barcode1Key])
        XCTAssertNotNil(encodedObject?[HardwareGeneral.Barcode2Key])
        XCTAssertNotNil(encodedObject?[HardwareGeneral.AssetTagKey])
        XCTAssertNotNil(encodedObject?[HardwareRemoteManagement.ContainerKey])
        XCTAssertNotNil(encodedObject?[HardwareGeneral.MdmCapableKey])
        XCTAssertNotNil(encodedObject?[HardwareGeneral.MdmCapableUsersKey])
        XCTAssertNotNil(encodedObject?[HardwareGeneral.ReportDateKey])
        XCTAssertNotNil(encodedObject?[HardwareGeneral.ReportDateKey + PreciseDate.EpochKey])
        XCTAssertNotNil(encodedObject?[HardwareGeneral.ReportDateKey + PreciseDate.UTCKey])
        XCTAssertNotNil(encodedObject?[HardwareGeneral.LastContactTimeKey])
        XCTAssertNotNil(encodedObject?[HardwareGeneral.LastContactTimeKey + PreciseDate.EpochKey])
        XCTAssertNotNil(encodedObject?[HardwareGeneral.LastContactTimeKey + PreciseDate.UTCKey])
        XCTAssertNotNil(encodedObject?[HardwareGeneral.InitialEntryDateKey])
        XCTAssertNotNil(encodedObject?[HardwareGeneral.InitialEntryDateKey + PreciseDate.EpochKey])
        XCTAssertNotNil(encodedObject?[HardwareGeneral.InitialEntryDateKey + PreciseDate.UTCKey])
        XCTAssertNotNil(encodedObject?[HardwareGeneral.LastCloudBackupDateKey + PreciseDate.EpochKey])
        XCTAssertNotNil(encodedObject?[HardwareGeneral.LastCloudBackupDateKey + PreciseDate.UTCKey])
        XCTAssertNotNil(encodedObject?[HardwareGeneral.LastEnrolledDateKey + PreciseDate.EpochKey])
        XCTAssertNotNil(encodedObject?[HardwareGeneral.LastEnrolledDateKey + PreciseDate.UTCKey])
        XCTAssertNotNil(encodedObject?[HardwareGeneral.DistributionPointKey])
        XCTAssertNotNil(encodedObject?[HardwareGeneral.SusKey])
        XCTAssertNotNil(encodedObject?[HardwareGeneral.NetbootServerKey])
        XCTAssertNotNil(encodedObject?[HardwareGeneral.SiteKey])
        XCTAssertNotNil(encodedObject?[HardwareGeneral.ItunesStoreAccountIsActiveKey])
    }

    func testIncompleteShouldEncodeToJSON() {
        let payload = self.payload(for: "hardware_general_incomplete")!

        let actualValue = HardwareGeneral(json: payload, node: Hardware.GeneralKey)
        let encodedObject = actualValue?.toJSON()

        XCTAssertNotNil(encodedObject)
        XCTAssertEqual(encodedObject?.count, 26)

        XCTAssertNotNil(encodedObject?[HardwareGeneral.IdentifierKey])
        XCTAssertNotNil(encodedObject?[HardwareGeneral.NameKey])
        XCTAssertNotNil(encodedObject?[HardwareGeneral.MacAddressKey])
        XCTAssertNotNil(encodedObject?[HardwareGeneral.AlternativeMacAddressKey])
        XCTAssertNotNil(encodedObject?[HardwareGeneral.IpAddressKey])
        XCTAssertNotNil(encodedObject?[HardwareGeneral.LastReportedIPAddressKey])
        XCTAssertNotNil(encodedObject?[HardwareGeneral.SerialNumberKey])
        XCTAssertNotNil(encodedObject?[HardwareGeneral.UDIDKey])
        XCTAssertNotNil(encodedObject?[HardwareGeneral.JAMFVersionKey])
        XCTAssertNotNil(encodedObject?[HardwareGeneral.PlatformKey])
        XCTAssertNotNil(encodedObject?[HardwareGeneral.MdmCapableKey])
        XCTAssertNotNil(encodedObject?[HardwareGeneral.ReportDateKey])
        XCTAssertNotNil(encodedObject?[HardwareGeneral.ReportDateKey + PreciseDate.EpochKey])
        XCTAssertNotNil(encodedObject?[HardwareGeneral.ReportDateKey + PreciseDate.UTCKey])
        XCTAssertNotNil(encodedObject?[HardwareGeneral.LastContactTimeKey])
        XCTAssertNotNil(encodedObject?[HardwareGeneral.LastContactTimeKey + PreciseDate.EpochKey])
        XCTAssertNotNil(encodedObject?[HardwareGeneral.LastContactTimeKey + PreciseDate.UTCKey])
        XCTAssertNotNil(encodedObject?[HardwareGeneral.InitialEntryDateKey])
        XCTAssertNotNil(encodedObject?[HardwareGeneral.InitialEntryDateKey + PreciseDate.EpochKey])
        XCTAssertNotNil(encodedObject?[HardwareGeneral.InitialEntryDateKey + PreciseDate.UTCKey])
        XCTAssertNotNil(encodedObject?[HardwareGeneral.LastCloudBackupDateKey + PreciseDate.EpochKey])
        XCTAssertNotNil(encodedObject?[HardwareGeneral.LastCloudBackupDateKey + PreciseDate.UTCKey])
        XCTAssertNotNil(encodedObject?[HardwareGeneral.DistributionPointKey])
        XCTAssertNotNil(encodedObject?[HardwareGeneral.SusKey])
        XCTAssertNotNil(encodedObject?[HardwareGeneral.NetbootServerKey])
        XCTAssertNotNil(encodedObject?[HardwareGeneral.ItunesStoreAccountIsActiveKey])
    }
}
