//
//  NetbootServerTests.swift
//  JamfKit
//
//  Copyright © 2017 JamfKit. All rights reserved.
//

import XCTest

@testable import JamfKit

class NetbootServerTests: XCTestCase {

    // MARK: - Constants

    let subfolder = "NetbootServer/"
    let defaultIdentifier: UInt = 12345
    let defaultName = "Netboot Server"
    let defaultIpAddress = "127.0.0.1"
    let defaultIsDefaultImage = true
    let defaultIsSpecificImage = false
    let defaultTargetPlatform = "PowerPC"
    let defaultSharePoint = "string"
    let defaultSet = "string"
    let defaultImage = "string"
    let defaultFilesystemProtocol = "nfs"
    let defaultConfigureManually = true
    let defaultBootArguments = "string"
    let defaultBootFile = "string"
    let defaultBootDevice = "string"

    // MARK: - Tests

    func testShouldInitializeFromJSON() {
        let payload = self.payload(for: "netboot_server_valid", subfolder: subfolder)!

        let actualValue = NetbootServer(json: payload)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.identifier, defaultIdentifier)
        XCTAssertEqual(actualValue?.name, defaultName)
        XCTAssertEqual(actualValue?.description, "[NetbootServer][\(defaultIdentifier) - \(defaultIpAddress)]")
        XCTAssertEqual(actualValue?.ipAddress, defaultIpAddress)
        XCTAssertEqual(actualValue?.isDefaultImage, defaultIsDefaultImage)
        XCTAssertEqual(actualValue?.isSpecificImage, defaultIsSpecificImage)
        XCTAssertEqual(actualValue?.targetPlatform, defaultTargetPlatform)
        XCTAssertEqual(actualValue?.sharePoint, defaultSharePoint)
        XCTAssertEqual(actualValue?.set, defaultSet)
        XCTAssertEqual(actualValue?.image, defaultImage)
        XCTAssertEqual(actualValue?.filesystemProtocol, defaultFilesystemProtocol)
        XCTAssertEqual(actualValue?.configureManually, defaultConfigureManually)
        XCTAssertEqual(actualValue?.bootArguments, defaultBootArguments)
        XCTAssertEqual(actualValue?.bootFile, defaultBootFile)
        XCTAssertEqual(actualValue?.bootDevice, defaultBootDevice)
    }

    func testShouldInitializeFromIncompleteJSON() {
        let payload = self.payload(for: "netboot_server_incomplete", subfolder: subfolder)!

        let actualValue = NetbootServer(json: payload)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.identifier, defaultIdentifier)
        XCTAssertEqual(actualValue?.name, defaultName)
        XCTAssertEqual(actualValue?.description, "[NetbootServer][\(defaultIdentifier) - ]")
        XCTAssertEqual(actualValue?.ipAddress, "")
        XCTAssertEqual(actualValue?.isDefaultImage, false)
        XCTAssertEqual(actualValue?.isSpecificImage, false)
        XCTAssertEqual(actualValue?.targetPlatform, "")
        XCTAssertEqual(actualValue?.sharePoint, "")
        XCTAssertEqual(actualValue?.set, "")
        XCTAssertEqual(actualValue?.image, "")
        XCTAssertEqual(actualValue?.filesystemProtocol, "")
        XCTAssertEqual(actualValue?.configureManually, false)
        XCTAssertEqual(actualValue?.bootArguments, "")
        XCTAssertEqual(actualValue?.bootFile, "")
        XCTAssertEqual(actualValue?.bootDevice, "")
    }

    func testShouldNotInitializeFromInvalidJSON() {
        let payload = self.payload(for: "netboot_server_invalid", subfolder: subfolder)!

        let actualValue = NetbootServer(json: payload)

        XCTAssertNil(actualValue)
    }

    func testShouldEncodeToJSON() {
        let payload = self.payload(for: "netboot_server_valid", subfolder: subfolder)!

        let actualValue = NetbootServer(json: payload)
        let encodedObject = actualValue?.toJSON()

        XCTAssertNotNil(encodedObject)
        XCTAssertEqual(encodedObject?.count, 14)

        XCTAssertNotNil(encodedObject?[NetbootServer.IdentifierKey])
        XCTAssertNotNil(encodedObject?[NetbootServer.NameKey])
        XCTAssertNotNil(encodedObject?[NetbootServer.IpAddressKey])
        XCTAssertNotNil(encodedObject?[NetbootServer.DefaultImageKey])
        XCTAssertNotNil(encodedObject?[NetbootServer.SpecificImageKey])
        XCTAssertNotNil(encodedObject?[NetbootServer.TargetPlatformKey])
        XCTAssertNotNil(encodedObject?[NetbootServer.SharePointKey])
        XCTAssertNotNil(encodedObject?[NetbootServer.SetKey])
        XCTAssertNotNil(encodedObject?[NetbootServer.ImageKey])
        XCTAssertNotNil(encodedObject?[NetbootServer.ProtocolKey])
        XCTAssertNotNil(encodedObject?[NetbootServer.ConfigureManuallyKey])
        XCTAssertNotNil(encodedObject?[NetbootServer.BootArgumentsKey])
        XCTAssertNotNil(encodedObject?[NetbootServer.BootFileKey])
        XCTAssertNotNil(encodedObject?[NetbootServer.BootDeviceKey])
    }
}
