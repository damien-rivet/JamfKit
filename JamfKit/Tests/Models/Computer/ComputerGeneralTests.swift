//
//  HardwareGeneralTests.swift
//  JamfKit
//
//  Copyright © 2017 JamfKit. All rights reserved.
//

import XCTest

@testable import JamfKit

class ComputerGeneralTests: XCTestCase {

    // MARK: - Constants

    let subfolder = "Computer/"
    let defaultIdentifier: UInt = 12345
    let defaultName = "computer"
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
        let payload = self.payload(for: "computer_general_valid", subfolder: subfolder)!

        let defaultReportDate = PreciseDate(json: payload, node: "report_date")
        let defaultLastContactTime = PreciseDate(json: payload, node: "last_contact_time")
        let defaultInitialEntryDate = PreciseDate(json: payload, node: "initial_entry_date")
        let defaultLastCloudBackupDate = PreciseDate(json: payload, node: "last_cloud_backup_date")
        let defaultLastEnrolledDate = PreciseDate(json: payload, node: "last_enrolled_date")

        let actualValue = ComputerGeneral(json: payload)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.identifier, defaultIdentifier)
        XCTAssertEqual(actualValue?.name, defaultName)
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
        let payload = self.payload(for: "computer_general_incomplete", subfolder: subfolder)!

        let defaultReportDate = PreciseDate(json: payload, node: "report_date")
        let defaultLastContactTime = PreciseDate(json: payload, node: "last_contact_time")
        let defaultInitialEntryDate = PreciseDate(json: payload, node: "initial_entry_date")
        let defaultLastCloudBackupDate = PreciseDate(json: payload, node: "last_cloud_backup_date")
        let defaultLastEnrolledDate = PreciseDate(json: payload, node: "last_enrolled_date")

        let actualValue = ComputerGeneral(json: payload)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.identifier, defaultIdentifier)
        XCTAssertEqual(actualValue?.name, defaultName)
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
        let payload = self.payload(for: "computer_general_invalid", subfolder: subfolder)!

        let site = ComputerGeneral(json: payload)

        XCTAssertNil(site)
    }

    func testShouldEncodeToJSON() {
        let payload = self.payload(for: "computer_general_valid", subfolder: subfolder)!

        let actualValue = ComputerGeneral(json: payload)
        let encodedObject = actualValue?.toJSON()

        XCTAssertNotNil(encodedObject)
        XCTAssertEqual(encodedObject?.count, 34)

        XCTAssertNotNil(encodedObject?[ComputerGeneral.IdentifierKey])
        XCTAssertNotNil(encodedObject?[ComputerGeneral.NameKey])
        XCTAssertNotNil(encodedObject?[ComputerGeneral.MacAddressKey])
        XCTAssertNotNil(encodedObject?[ComputerGeneral.AlternativeMacAddressKey])
        XCTAssertNotNil(encodedObject?[ComputerGeneral.IpAddressKey])
        XCTAssertNotNil(encodedObject?[ComputerGeneral.LastReportedIPAddressKey])
        XCTAssertNotNil(encodedObject?[ComputerGeneral.SerialNumberKey])
        XCTAssertNotNil(encodedObject?[ComputerGeneral.UDIDKey])
        XCTAssertNotNil(encodedObject?[ComputerGeneral.JamfVersionKey])
        XCTAssertNotNil(encodedObject?[ComputerGeneral.PlatformKey])
        XCTAssertNotNil(encodedObject?[ComputerGeneral.Barcode1Key])
        XCTAssertNotNil(encodedObject?[ComputerGeneral.Barcode2Key])
        XCTAssertNotNil(encodedObject?[ComputerGeneral.AssetTagKey])
        XCTAssertNotNil(encodedObject?[ComputerGeneral.RemoteManagementKey])
        XCTAssertNotNil(encodedObject?[ComputerGeneral.MdmCapableKey])
        XCTAssertNotNil(encodedObject?[ComputerGeneral.MdmCapableUsersKey])
        XCTAssertNotNil(encodedObject?[ComputerGeneral.ReportDateKey])
        XCTAssertNotNil(encodedObject?[ComputerGeneral.ReportDateKey + PreciseDate.EpochKey])
        XCTAssertNotNil(encodedObject?[ComputerGeneral.ReportDateKey + PreciseDate.UTCKey])
        XCTAssertNotNil(encodedObject?[ComputerGeneral.LastContactTimeKey])
        XCTAssertNotNil(encodedObject?[ComputerGeneral.LastContactTimeKey + PreciseDate.EpochKey])
        XCTAssertNotNil(encodedObject?[ComputerGeneral.LastContactTimeKey + PreciseDate.UTCKey])
        XCTAssertNotNil(encodedObject?[ComputerGeneral.InitialEntryDateKey])
        XCTAssertNotNil(encodedObject?[ComputerGeneral.InitialEntryDateKey + PreciseDate.EpochKey])
        XCTAssertNotNil(encodedObject?[ComputerGeneral.InitialEntryDateKey + PreciseDate.UTCKey])
        XCTAssertNotNil(encodedObject?[ComputerGeneral.LastCloudBackupDateKey + PreciseDate.EpochKey])
        XCTAssertNotNil(encodedObject?[ComputerGeneral.LastCloudBackupDateKey + PreciseDate.UTCKey])
        XCTAssertNotNil(encodedObject?[ComputerGeneral.LastEnrolledDateKey + PreciseDate.EpochKey])
        XCTAssertNotNil(encodedObject?[ComputerGeneral.LastEnrolledDateKey + PreciseDate.UTCKey])
        XCTAssertNotNil(encodedObject?[ComputerGeneral.DistributionPointKey])
        XCTAssertNotNil(encodedObject?[ComputerGeneral.SusKey])
        XCTAssertNotNil(encodedObject?[ComputerGeneral.NetbootServerKey])
        XCTAssertNotNil(encodedObject?[ComputerGeneral.SiteKey])
        XCTAssertNotNil(encodedObject?[ComputerGeneral.ItunesStoreAccountIsActiveKey])
    }
}
