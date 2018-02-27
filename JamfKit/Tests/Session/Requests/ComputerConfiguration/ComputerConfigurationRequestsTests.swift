//
//  ComputerConfigurationRequestsTests.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

import XCTest

@testable import JamfKit

class ComputerConfigurationRequestsTests: XCTestCase {

    // MARK: - Constants

    let subfolder = "ComputerConfiguration/"
    let defaultHost = "http://localhost"
    var element: ComputerConfiguration!

    // MARK: - Lifecycle

    override func setUp() {
        try? SessionManager.instance.configure(for: defaultHost, username: "username", password: "password")

        let payload = self.payload(for: "computer_configuration", subfolder: subfolder)!
        element = ComputerConfiguration(json: payload)!
    }

    override func tearDown() {
        SessionManager.instance.clearConfiguration()
    }

    // MARK: - Tests

    func testShouldReturnCreateRequest() {
        let actualValue = element.createRequest()

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.httpMethod, HttpMethod.post.rawValue)
        XCTAssertEqual(actualValue?.url?.absoluteString, "\(defaultHost)/\(element.endpoint)/id/\(element.general.identifier)")
        XCTAssertNotNil(actualValue?.httpBody)
    }

    func testShouldReturnReadAllRequest() {
        let actualValue = ComputerConfiguration.readAllRequest()

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.httpMethod, HttpMethod.get.rawValue)
        XCTAssertEqual(actualValue?.url?.absoluteString, "\(defaultHost)/\(ComputerConfiguration.Endpoint)")
        XCTAssertNil(actualValue?.httpBody)
    }

    func testShouldReturnStaticReadRequestWithIdentifier() {
        let actualValue = ComputerConfiguration.readRequest(identifier: "12345")

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.httpMethod, HttpMethod.get.rawValue)
        XCTAssertEqual(actualValue?.url?.absoluteString, "\(defaultHost)/\(ComputerConfiguration.Endpoint)/id/12345")
        XCTAssertNil(actualValue?.httpBody)
    }

    func testShouldReturnReadRequestWithIdentifier() {
        let actualValue = element.readRequest()

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.httpMethod, HttpMethod.get.rawValue)
        XCTAssertEqual(actualValue?.url?.absoluteString, "\(defaultHost)/\(element.endpoint)/id/\(element.general.identifier)")
        XCTAssertNil(actualValue?.httpBody)
    }

    func testShouldReturnReadRequestWithName() {
        let actualValue = element.readRequestWithName()
        let encodedName = element.general.name.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.httpMethod, HttpMethod.get.rawValue)
        XCTAssertEqual(actualValue?.url?.absoluteString, "\(defaultHost)/\(element.endpoint)/name/\(encodedName)")
        XCTAssertNil(actualValue?.httpBody)
    }

    func testShouldReturnUpdateRequestWithIdentifier() {
        let actualValue = element.updateRequest()

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.httpMethod, HttpMethod.put.rawValue)
        XCTAssertEqual(actualValue?.url?.absoluteString, "\(defaultHost)/\(element.endpoint)/id/\(element.general.identifier)")
        XCTAssertNotNil(actualValue?.httpBody)
    }

    func testShouldReturnUpdateRequestWithName() {
        let actualValue = element.updateRequestWithName()
        let encodedName = element.general.name.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.httpMethod, HttpMethod.put.rawValue)
        XCTAssertEqual(actualValue?.url?.absoluteString, "\(defaultHost)/\(element.endpoint)/name/\(encodedName)")
        XCTAssertNotNil(actualValue?.httpBody)
    }

    func testShouldReturnDeleteRequestWithIdentifier() {
        let actualValue = element.deleteRequest()

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.httpMethod, HttpMethod.delete.rawValue)
        XCTAssertEqual(actualValue?.url?.absoluteString, "\(defaultHost)/\(element.endpoint)/id/\(element.general.identifier)")
        XCTAssertNil(actualValue?.httpBody)
    }

    func testShouldReturnDeleteRequestWithName() {
        let actualValue = element.deleteRequestWithName()
        let encodedName = element.general.name.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.httpMethod, HttpMethod.delete.rawValue)
        XCTAssertEqual(actualValue?.url?.absoluteString, "\(defaultHost)/\(element.endpoint)/name/\(encodedName)")
        XCTAssertNil(actualValue?.httpBody)
    }
}
