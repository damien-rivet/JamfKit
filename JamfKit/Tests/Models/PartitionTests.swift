//
//  PartitionTests.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

import XCTest

@testable import JamfKit

class PartitionTests: XCTestCase {

    // MARK: - Constants

    let subfolder = "Partition/"
    let defaultName = "partition"
    let defaultSizeInGigabytes: UInt = 50
    let defaultMaximumPercentage: UInt = 25
    let defaultFormat = "Journaled HFS+"
    let defaultIsRestorePartition = true
    let defaultComputerConfiguration = "Recovery HD"
    let defaultReimage = true
    let defaultAppendToName = "suffix"

    // MARK: - Tests

    func testShouldInstantiate() {
        let actualValue = Partition(name: defaultName)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.name, defaultName)
    }

    func testShouldNotInstantiateWithInvalidParameters() {
        let actualValue = Partition(name: "")

        XCTAssertNil(actualValue)
    }

    func testShouldInitializeFromJSON() {
        let payload = self.payload(for: "partition", subfolder: subfolder)!

        let actualValue = Partition(json: payload)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.name, defaultName)
        XCTAssertEqual(actualValue?.sizeInGigabytes, defaultSizeInGigabytes)
        XCTAssertEqual(actualValue?.maximumPercentage, defaultMaximumPercentage)
        XCTAssertEqual(actualValue?.format, defaultFormat)
        XCTAssertEqual(actualValue?.isRestorePartition, defaultIsRestorePartition)
        XCTAssertEqual(actualValue?.computerConfiguration, defaultComputerConfiguration)
        XCTAssertEqual(actualValue?.reimage, defaultReimage)
        XCTAssertEqual(actualValue?.appendToName, defaultAppendToName)
    }

    func testShouldInitializeFromEmptyJSON() {
        let actualValue = Partition(json: [String: Any]())

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.name, "")
        XCTAssertEqual(actualValue?.sizeInGigabytes, 0)
        XCTAssertEqual(actualValue?.maximumPercentage, 0)
        XCTAssertEqual(actualValue?.format, "")
        XCTAssertEqual(actualValue?.isRestorePartition, false)
        XCTAssertEqual(actualValue?.computerConfiguration, "")
        XCTAssertEqual(actualValue?.reimage, false)
        XCTAssertEqual(actualValue?.appendToName, "")
    }

    func testShouldEncodeToJSON() {
        let payload = self.payload(for: "partition", subfolder: subfolder)!

        let actualValue = Partition(json: payload)
        let encodedObject = actualValue?.toJSON()

        XCTAssertNotNil(encodedObject)
        XCTAssertEqual(encodedObject?.count, 8)
        XCTAssertNotNil(encodedObject?[Partition.CodingKeys.name.rawValue])
        XCTAssertNotNil(encodedObject?[Partition.CodingKeys.sizeGigabytes.rawValue])
        XCTAssertNotNil(encodedObject?[Partition.CodingKeys.maximumPercentage.rawValue])
        XCTAssertNotNil(encodedObject?[Partition.CodingKeys.format.rawValue])
        XCTAssertNotNil(encodedObject?[Partition.CodingKeys.isRestorePartition.rawValue])
        XCTAssertNotNil(encodedObject?[Partition.CodingKeys.computerConfiguration.rawValue])
        XCTAssertNotNil(encodedObject?[Partition.CodingKeys.reimage.rawValue])
        XCTAssertNotNil(encodedObject?[Partition.CodingKeys.appendToName.rawValue])
    }

    func testShouldInitializeFromData() {
        let payload = self.payloadData(for: "partition", subfolder: subfolder)!

        do {
            let actualValue = try JSONDecoder().decode(Partition.self, from: payload)

            XCTAssertNotNil(actualValue)
            XCTAssertEqual(actualValue.name, defaultName)
            XCTAssertEqual(actualValue.sizeInGigabytes, defaultSizeInGigabytes)
            XCTAssertEqual(actualValue.maximumPercentage, defaultMaximumPercentage)
            XCTAssertEqual(actualValue.format, defaultFormat)
            XCTAssertEqual(actualValue.isRestorePartition, defaultIsRestorePartition)
            XCTAssertEqual(actualValue.computerConfiguration, defaultComputerConfiguration)
            XCTAssertEqual(actualValue.reimage, defaultReimage)
            XCTAssertEqual(actualValue.appendToName, defaultAppendToName)
        } catch {
            XCTFail("Failed to initialize from data")
        }
    }

    func testShouldEncodeToData() {
        let payload = self.payload(for: "partition", subfolder: subfolder)!

        let actualValue = Partition(json: payload)

        do {
            let encodedObject = try JSONEncoder().encode(actualValue)

            XCTAssertNotNil(encodedObject)
        } catch {
            XCTFail("Failed to encode to data")
        }
    }
}
