//
//  MobileDeviceGroupRequestsTests.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

import XCTest

@testable import JamfKit

class MobileDeviceGroupRequestsTests: XCTestCase {

    // MARK: - Constants

    let subfolder = "MobileDeviceGroup/"
    let defaultHost = "http://localhost"
    var element: MobileDeviceGroup!

    // MARK: - Lifecycle

    override func setUp() {
        try? SessionManager.instance.configure(for: defaultHost, username: "username", password: "password")

        let payload = self.payload(for: "mobile_device_group_valid", subfolder: subfolder)!
        element = MobileDeviceGroup(json: payload)!
    }

    override func tearDown() {
        SessionManager.instance.clearConfiguration()
    }

    // MARK: - Tests

    func testShouldReturnCreateRequest() {
        let actualValue = element.create()

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.httpMethod, HttpMethod.post.rawValue)
        XCTAssertEqual(actualValue?.url?.absoluteString, "\(defaultHost)/\(element.endpoint)/id/\(element.identifier)")
        XCTAssertNotNil(actualValue?.httpBody)
    }

    func testShouldReturnReadAllRequest() {
        let actualValue = MobileDeviceGroup.readAll()

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.httpMethod, HttpMethod.get.rawValue)
        XCTAssertEqual(actualValue?.url?.absoluteString, "\(defaultHost)/\(MobileDeviceGroup.Endpoint)")
        XCTAssertNil(actualValue?.httpBody)
    }

    func testShouldReturnStaticReadRequestWithIdentifier() {
        let actualValue = MobileDeviceGroup.read(identifier: "12345")

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.httpMethod, HttpMethod.get.rawValue)
        XCTAssertEqual(actualValue?.url?.absoluteString, "\(defaultHost)/\(MobileDeviceGroup.Endpoint)/id/12345")
        XCTAssertNil(actualValue?.httpBody)
    }

    func testShouldReturnReadRequestWithIdentifier() {
        let actualValue = element.read()

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.httpMethod, HttpMethod.get.rawValue)
        XCTAssertEqual(actualValue?.url?.absoluteString, "\(defaultHost)/\(element.endpoint)/id/\(element.identifier)")
        XCTAssertNil(actualValue?.httpBody)
    }

    func testShouldReturnReadRequestWithName() {
        let actualValue = element.readWithName()

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.httpMethod, HttpMethod.get.rawValue)
        XCTAssertEqual(actualValue?.url?.absoluteString, "\(defaultHost)/\(element.endpoint)/name/\(element.name)")
        XCTAssertNil(actualValue?.httpBody)
    }

    func testShouldReturnUpdateRequestWithIdentifier() {
        let actualValue = element.update()

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.httpMethod, HttpMethod.put.rawValue)
        XCTAssertEqual(actualValue?.url?.absoluteString, "\(defaultHost)/\(element.endpoint)/id/\(element.identifier)")
        XCTAssertNotNil(actualValue?.httpBody)
    }

    func testShouldReturnUpdateRequestWithName() {
        let actualValue = element.updateWithName()

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.httpMethod, HttpMethod.put.rawValue)
        XCTAssertEqual(actualValue?.url?.absoluteString, "\(defaultHost)/\(element.endpoint)/name/\(element.name)")
        XCTAssertNotNil(actualValue?.httpBody)
    }

    func testShouldReturnStaticDeleteRequestWithIdentifier() {
        let actualValue = MobileDeviceGroup.delete(identifier: "12345")

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.httpMethod, HttpMethod.delete.rawValue)
        XCTAssertEqual(actualValue?.url?.absoluteString, "\(defaultHost)/\(MobileDeviceGroup.Endpoint)/id/12345")
        XCTAssertNil(actualValue?.httpBody)
    }

    func testShouldReturnDeleteRequestWithIdentifier() {
        let actualValue = element.delete()

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.httpMethod, HttpMethod.delete.rawValue)
        XCTAssertEqual(actualValue?.url?.absoluteString, "\(defaultHost)/\(element.endpoint)/id/\(element.identifier)")
        XCTAssertNil(actualValue?.httpBody)
    }

    func testShouldReturnDeleteRequestWithName() {
        let actualValue = element.deleteWithName()

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.httpMethod, HttpMethod.delete.rawValue)
        XCTAssertEqual(actualValue?.url?.absoluteString, "\(defaultHost)/\(element.endpoint)/name/\(element.name)")
        XCTAssertNil(actualValue?.httpBody)
    }
}
