//
//  NetbootServerTests.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
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

    func testShouldInstantiate() {
        let actualValue = NetbootServer(identifier: defaultIdentifier, name: defaultName)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.identifier, defaultIdentifier)
        XCTAssertEqual(actualValue?.name, defaultName)
    }

    func testShouldNotInstantiateWithInvalidParameters() {
        let actualValue = NetbootServer(identifier: defaultIdentifier, name: "")

        XCTAssertNil(actualValue)
    }

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

        XCTAssertNotNil(encodedObject?[BaseObject.IdentifierKey])
        XCTAssertNotNil(encodedObject?[BaseObject.NameKey])
        XCTAssertNotNil(encodedObject?[NetbootServer.CodingKeys.ipAddress.rawValue])
        XCTAssertNotNil(encodedObject?[NetbootServer.CodingKeys.defaultImage.rawValue])
        XCTAssertNotNil(encodedObject?[NetbootServer.CodingKeys.specificImage.rawValue])
        XCTAssertNotNil(encodedObject?[NetbootServer.CodingKeys.targetPlatform.rawValue])
        XCTAssertNotNil(encodedObject?[NetbootServer.CodingKeys.sharePoint.rawValue])
        XCTAssertNotNil(encodedObject?[NetbootServer.CodingKeys.set.rawValue])
        XCTAssertNotNil(encodedObject?[NetbootServer.CodingKeys.image.rawValue])
        XCTAssertNotNil(encodedObject?[NetbootServer.CodingKeys.filesystemProtocol.rawValue])
        XCTAssertNotNil(encodedObject?[NetbootServer.CodingKeys.configureManually.rawValue])
        XCTAssertNotNil(encodedObject?[NetbootServer.CodingKeys.bootArguments.rawValue])
        XCTAssertNotNil(encodedObject?[NetbootServer.CodingKeys.bootFile.rawValue])
        XCTAssertNotNil(encodedObject?[NetbootServer.CodingKeys.bootDevice.rawValue])
    }

    func testShouldInitializeFromData() {
        let payload = self.payloadData(for: "netboot_server_valid", subfolder: subfolder)!

        do {
            let actualValue = try JSONDecoder().decode(NetbootServer.self, from: payload)

            XCTAssertNotNil(actualValue)
            XCTAssertEqual(actualValue.identifier, defaultIdentifier)
            XCTAssertEqual(actualValue.name, defaultName)
            XCTAssertEqual(actualValue.description, "[NetbootServer][\(defaultIdentifier) - \(defaultIpAddress)]")
            XCTAssertEqual(actualValue.ipAddress, defaultIpAddress)
            XCTAssertEqual(actualValue.isDefaultImage, defaultIsDefaultImage)
            XCTAssertEqual(actualValue.isSpecificImage, defaultIsSpecificImage)
            XCTAssertEqual(actualValue.targetPlatform, defaultTargetPlatform)
            XCTAssertEqual(actualValue.sharePoint, defaultSharePoint)
            XCTAssertEqual(actualValue.set, defaultSet)
            XCTAssertEqual(actualValue.image, defaultImage)
            XCTAssertEqual(actualValue.filesystemProtocol, defaultFilesystemProtocol)
            XCTAssertEqual(actualValue.configureManually, defaultConfigureManually)
            XCTAssertEqual(actualValue.bootArguments, defaultBootArguments)
            XCTAssertEqual(actualValue.bootFile, defaultBootFile)
            XCTAssertEqual(actualValue.bootDevice, defaultBootDevice)
        } catch {
            XCTFail("Failed to initialize from data")
        }
    }

    func testShouldEncodeToData() {
        let payload = self.payload(for: "netboot_server_valid", subfolder: subfolder)!

        let actualValue = NetbootServer(json: payload)

        do {
            let encodedObject = try JSONEncoder().encode(actualValue)

            XCTAssertNotNil(encodedObject)
        } catch {
            XCTFail("Failed to encode to data")
        }
    }
}
