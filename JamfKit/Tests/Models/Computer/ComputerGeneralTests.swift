//
//  HardwareGeneralTests.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
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

    func testShouldNotInstantiateWithInvalidParameters() {
        let actualValue = ComputerGeneral(identifier: defaultIdentifier, name: "")

        XCTAssertNil(actualValue)
    }

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
        XCTAssertEqual(actualValue?.mdmCapableUsers.count, defaultMdmCapableUsers.count)
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

        let actualValue = ComputerGeneral(json: payload)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.identifier, defaultIdentifier)
        XCTAssertEqual(actualValue?.name, defaultName)
        XCTAssertEqual(actualValue?.macAddress, "")
        XCTAssertEqual(actualValue?.alternativeMacAddress, "")
        XCTAssertEqual(actualValue?.ipAddress, "")
        XCTAssertEqual(actualValue?.lastReportedIpAddress, "")
        XCTAssertEqual(actualValue?.serialNumber, "")
        XCTAssertEqual(actualValue?.udid, "")
        XCTAssertEqual(actualValue?.jamfVersion, "")
        XCTAssertEqual(actualValue?.platform, "")
        XCTAssertEqual(actualValue?.isMdmCapable, false)
        XCTAssertNotNil(actualValue?.reportDate)
        XCTAssertNil(actualValue?.reportDate?.date)
        XCTAssertNil(actualValue?.reportDate?.epoch)
        XCTAssertNil(actualValue?.reportDate?.dateUTC)
        XCTAssertNotNil(actualValue?.lastContactTime)
        XCTAssertNil(actualValue?.lastContactTime?.date)
        XCTAssertNil(actualValue?.lastContactTime?.epoch)
        XCTAssertNil(actualValue?.lastContactTime?.dateUTC)
        XCTAssertNotNil(actualValue?.initialEntryDate)
        XCTAssertNil(actualValue?.initialEntryDate?.date)
        XCTAssertNil(actualValue?.initialEntryDate?.epoch)
        XCTAssertNil(actualValue?.initialEntryDate?.dateUTC)
        XCTAssertNotNil(actualValue?.lastCloudBackupDate)
        XCTAssertNil(actualValue?.lastCloudBackupDate?.date)
        XCTAssertNil(actualValue?.lastCloudBackupDate?.epoch)
        XCTAssertNil(actualValue?.lastCloudBackupDate?.dateUTC)
        XCTAssertNotNil(actualValue?.lastEnrolledDate)
        XCTAssertNil(actualValue?.lastEnrolledDate?.date)
        XCTAssertNil(actualValue?.lastEnrolledDate?.epoch)
        XCTAssertNil(actualValue?.lastEnrolledDate?.dateUTC)
        XCTAssertEqual(actualValue?.distributionPoint, "")
        XCTAssertEqual(actualValue?.sus, "")
        XCTAssertEqual(actualValue?.netbootServer, "")
        XCTAssertEqual(actualValue?.isITunesStoreAcccountActivated, false)
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

        XCTAssertNotNil(encodedObject?[BaseObject.IdentifierKey])
        XCTAssertNotNil(encodedObject?[BaseObject.NameKey])
        XCTAssertNotNil(encodedObject?[ComputerGeneral.CodingKeys.macAddress.rawValue])
        XCTAssertNotNil(encodedObject?[ComputerGeneral.CodingKeys.alternativeMacAddress.rawValue])
        XCTAssertNotNil(encodedObject?[ComputerGeneral.CodingKeys.ipAddress.rawValue])
        XCTAssertNotNil(encodedObject?[ComputerGeneral.CodingKeys.lastReportedIpAddress.rawValue])
        XCTAssertNotNil(encodedObject?[ComputerGeneral.CodingKeys.serialNumber.rawValue])
        XCTAssertNotNil(encodedObject?[ComputerGeneral.CodingKeys.udid.rawValue])
        XCTAssertNotNil(encodedObject?[ComputerGeneral.CodingKeys.jamfVersion.rawValue])
        XCTAssertNotNil(encodedObject?[ComputerGeneral.CodingKeys.platform.rawValue])
        XCTAssertNotNil(encodedObject?[ComputerGeneral.CodingKeys.barcode1.rawValue])
        XCTAssertNotNil(encodedObject?[ComputerGeneral.CodingKeys.barcode2.rawValue])
        XCTAssertNotNil(encodedObject?[ComputerGeneral.CodingKeys.assetTag.rawValue])
        XCTAssertNotNil(encodedObject?[ComputerGeneral.CodingKeys.remoteManagement.rawValue])
        XCTAssertNotNil(encodedObject?[ComputerGeneral.CodingKeys.mdmCapable.rawValue])
        XCTAssertNotNil(encodedObject?[ComputerGeneral.CodingKeys.mdmCapableUsers.rawValue])
        XCTAssertNotNil(encodedObject?[ComputerGeneral.CodingKeys.reportDate.rawValue])
        XCTAssertNotNil(encodedObject?[ComputerGeneral.CodingKeys.reportDate.rawValue + PreciseDate.EpochKey])
        XCTAssertNotNil(encodedObject?[ComputerGeneral.CodingKeys.reportDate.rawValue + PreciseDate.UTCKey])
        XCTAssertNotNil(encodedObject?[ComputerGeneral.CodingKeys.lastContactTime.rawValue])
        XCTAssertNotNil(encodedObject?[ComputerGeneral.CodingKeys.lastContactTime.rawValue + PreciseDate.EpochKey])
        XCTAssertNotNil(encodedObject?[ComputerGeneral.CodingKeys.lastContactTime.rawValue + PreciseDate.UTCKey])
        XCTAssertNotNil(encodedObject?[ComputerGeneral.CodingKeys.initialEntryDate.rawValue])
        XCTAssertNotNil(encodedObject?[ComputerGeneral.CodingKeys.initialEntryDate.rawValue + PreciseDate.EpochKey])
        XCTAssertNotNil(encodedObject?[ComputerGeneral.CodingKeys.initialEntryDate.rawValue + PreciseDate.UTCKey])
        XCTAssertNotNil(encodedObject?[ComputerGeneral.CodingKeys.lastCloudBackupDate.rawValue + PreciseDate.EpochKey])
        XCTAssertNotNil(encodedObject?[ComputerGeneral.CodingKeys.lastCloudBackupDate.rawValue + PreciseDate.UTCKey])
        XCTAssertNotNil(encodedObject?[ComputerGeneral.CodingKeys.lastEnrolledDate.rawValue + PreciseDate.EpochKey])
        XCTAssertNotNil(encodedObject?[ComputerGeneral.CodingKeys.lastEnrolledDate.rawValue + PreciseDate.UTCKey])
        XCTAssertNotNil(encodedObject?[ComputerGeneral.CodingKeys.distributionPoint.rawValue])
        XCTAssertNotNil(encodedObject?[ComputerGeneral.CodingKeys.sus.rawValue])
        XCTAssertNotNil(encodedObject?[ComputerGeneral.CodingKeys.netbootServer.rawValue])
        XCTAssertNotNil(encodedObject?[ComputerGeneral.CodingKeys.site.rawValue])
        XCTAssertNotNil(encodedObject?[ComputerGeneral.CodingKeys.iTunesStoreAccountIsActive.rawValue])
    }

    func testShouldInitializeFromData() {
        let payload = self.payload(for: "computer_general_valid", subfolder: subfolder)!

        let defaultReportDate = PreciseDate(json: payload, node: "report_date")
        let defaultLastContactTime = PreciseDate(json: payload, node: "last_contact_time")
        let defaultInitialEntryDate = PreciseDate(json: payload, node: "initial_entry_date")
        let defaultLastCloudBackupDate = PreciseDate(json: payload, node: "last_cloud_backup_date")
        let defaultLastEnrolledDate = PreciseDate(json: payload, node: "last_enrolled_date")

        let payloadData = self.payloadData(for: "computer_general_valid", subfolder: subfolder)!

        do {
            let actualValue = try JSONDecoder().decode(ComputerGeneral.self, from: payloadData)

            XCTAssertNotNil(actualValue)
            XCTAssertEqual(actualValue.identifier, defaultIdentifier)
            XCTAssertEqual(actualValue.name, defaultName)
            XCTAssertEqual(actualValue.macAddress, defaultMacAddress)
            XCTAssertEqual(actualValue.alternativeMacAddress, defaultAlternativeMacAddress)
            XCTAssertEqual(actualValue.ipAddress, defaultIpAddress)
            XCTAssertEqual(actualValue.lastReportedIpAddress, defaultLastReportedIpAddress)
            XCTAssertEqual(actualValue.serialNumber, defaultSerialNumber)
            XCTAssertEqual(actualValue.udid, defaultUdid)
            XCTAssertEqual(actualValue.jamfVersion, defaultJamfVersion)
            XCTAssertEqual(actualValue.platform, defaultPlatform)
            XCTAssertEqual(actualValue.barcode1, defaultBarcode1)
            XCTAssertEqual(actualValue.barcode2, defaultBarcode2)
            XCTAssertEqual(actualValue.assetTag, defaultAssetTag)
            XCTAssertNotNil(actualValue.remoteManagement)
            XCTAssertEqual(actualValue.remoteManagement?.isManaged, defaultRemoteManagementIsManaged)
            XCTAssertEqual(actualValue.remoteManagement?.managementUsername, defaultRemoteManagementUsername)
            XCTAssertEqual(actualValue.isMdmCapable, defaultMdmCapable)
            XCTAssertEqual(actualValue.mdmCapableUsers.count, defaultMdmCapableUsers.count)
            XCTAssertEqual(actualValue.reportDate?.date, defaultReportDate?.date)
            XCTAssertEqual(actualValue.reportDate?.epoch, defaultReportDate?.epoch)
            XCTAssertEqual(actualValue.reportDate?.dateUTC, defaultReportDate?.dateUTC)
            XCTAssertEqual(actualValue.lastContactTime?.date, defaultLastContactTime?.date)
            XCTAssertEqual(actualValue.lastContactTime?.epoch, defaultLastContactTime?.epoch)
            XCTAssertEqual(actualValue.lastContactTime?.dateUTC, defaultLastContactTime?.dateUTC)
            XCTAssertEqual(actualValue.initialEntryDate?.date, defaultInitialEntryDate?.date)
            XCTAssertEqual(actualValue.initialEntryDate?.epoch, defaultInitialEntryDate?.epoch)
            XCTAssertEqual(actualValue.initialEntryDate?.dateUTC, defaultInitialEntryDate?.dateUTC)
            XCTAssertEqual(actualValue.lastCloudBackupDate?.date, defaultLastCloudBackupDate?.date)
            XCTAssertEqual(actualValue.lastCloudBackupDate?.epoch, defaultLastCloudBackupDate?.epoch)
            XCTAssertEqual(actualValue.lastCloudBackupDate?.dateUTC, defaultLastCloudBackupDate?.dateUTC)
            XCTAssertEqual(actualValue.lastEnrolledDate?.date, defaultLastEnrolledDate?.date)
            XCTAssertEqual(actualValue.lastEnrolledDate?.epoch, defaultLastEnrolledDate?.epoch)
            XCTAssertEqual(actualValue.lastEnrolledDate?.dateUTC, defaultLastEnrolledDate?.dateUTC)
            XCTAssertEqual(actualValue.distributionPoint, defaultDistributionPoint)
            XCTAssertEqual(actualValue.sus, defaultSus)
            XCTAssertEqual(actualValue.netbootServer, defaultNetbootServer)
            XCTAssertNotNil(actualValue.site)
            XCTAssertEqual(actualValue.isITunesStoreAcccountActivated, defaultITunesStoreAccountActivated)
        } catch {
            XCTFail("Failed to initialize from data")
        }
    }

    func testShouldEncodeToData() {
        let payload = self.payload(for: "computer_general_valid", subfolder: subfolder)!

        let actualValue = ComputerGeneral(json: payload)

        do {
            let encodedObject = try JSONEncoder().encode(actualValue)

            XCTAssertNotNil(encodedObject)
        } catch {
            XCTFail("Failed to encode to data")
        }
    }
}
