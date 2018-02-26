//
//  DepartmentRequestsTests.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

import XCTest

@testable import JamfKit

class DepartmentRequestsTests: XCTestCase {

    // MARK: - Constants

    let subfolder = "Department/"
    let defaultHost = "http://localhost"
    var element: Department!

    // MARK: - Lifecycle

    override func setUp() {
        try? SessionManager.instance.configure(for: defaultHost, username: "username", password: "password")

        let payload = self.payload(for: "department_valid", subfolder: subfolder)!
        element = Department(json: payload)!
    }

    override func tearDown() {
        SessionManager.instance.clearConfiguration()
    }

    // MARK: - Tests

    func testShouldReturnCreateRequest() {
        let actualValue = element.createRequest()

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.httpMethod, HttpMethod.post.rawValue)
        XCTAssertEqual(actualValue?.url?.absoluteString, "\(defaultHost)/\(element.endpoint)/id/\(element.identifier)")
        XCTAssertNotNil(actualValue?.httpBody)
    }

    func testShouldReturnReadAllRequest() {
        let actualValue = Department.readAllRequest()

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.httpMethod, HttpMethod.get.rawValue)
        XCTAssertEqual(actualValue?.url?.absoluteString, "\(defaultHost)/\(Department.Endpoint)")
        XCTAssertNil(actualValue?.httpBody)
    }

    func testShouldReturnStaticReadRequestWithIdentifier() {
        let actualValue = Department.readRequest(identifier: "12345")

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.httpMethod, HttpMethod.get.rawValue)
        XCTAssertEqual(actualValue?.url?.absoluteString, "\(defaultHost)/\(Department.Endpoint)/id/12345")
        XCTAssertNil(actualValue?.httpBody)
    }

    func testShouldReturnReadRequestWithIdentifier() {
        let actualValue = element.readRequest()

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.httpMethod, HttpMethod.get.rawValue)
        XCTAssertEqual(actualValue?.url?.absoluteString, "\(defaultHost)/\(element.endpoint)/id/\(element.identifier)")
        XCTAssertNil(actualValue?.httpBody)
    }

    func testShouldReturnStaticReadRequestWithName() {
        let actualValue = Department.readRequest(name: "Department")

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.httpMethod, HttpMethod.get.rawValue)
        XCTAssertEqual(actualValue?.url?.absoluteString, "\(defaultHost)/\(Department.Endpoint)/name/Department")
        XCTAssertNil(actualValue?.httpBody)
    }

    func testShouldReturnReadRequestWithName() {
        let actualValue = element.readRequestWithName()

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.httpMethod, HttpMethod.get.rawValue)
        XCTAssertEqual(actualValue?.url?.absoluteString, "\(defaultHost)/\(element.endpoint)/name/\(element.name)")
        XCTAssertNil(actualValue?.httpBody)
    }

    func testShouldReturnUpdateRequestWithIdentifier() {
        let actualValue = element.updateRequest()

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.httpMethod, HttpMethod.put.rawValue)
        XCTAssertEqual(actualValue?.url?.absoluteString, "\(defaultHost)/\(element.endpoint)/id/\(element.identifier)")
        XCTAssertNotNil(actualValue?.httpBody)
    }

    func testShouldReturnUpdateRequestWithName() {
        let actualValue = element.updateRequestWithName()

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.httpMethod, HttpMethod.put.rawValue)
        XCTAssertEqual(actualValue?.url?.absoluteString, "\(defaultHost)/\(element.endpoint)/name/\(element.name)")
        XCTAssertNotNil(actualValue?.httpBody)
    }

    func testShouldReturnStaticDeleteRequestWithIdentifier() {
        let actualValue = Department.deleteRequest(identifier: "12345")

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.httpMethod, HttpMethod.delete.rawValue)
        XCTAssertEqual(actualValue?.url?.absoluteString, "\(defaultHost)/\(Department.Endpoint)/id/12345")
        XCTAssertNil(actualValue?.httpBody)
    }

    func testShouldReturnDeleteRequestWithIdentifier() {
        let actualValue = element.deleteRequest()

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.httpMethod, HttpMethod.delete.rawValue)
        XCTAssertEqual(actualValue?.url?.absoluteString, "\(defaultHost)/\(element.endpoint)/id/\(element.identifier)")
        XCTAssertNil(actualValue?.httpBody)
    }

    func testShouldReturnStaticDeleteRequestWithName() {
        let actualValue = Department.deleteRequest(name: "12345")

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.httpMethod, HttpMethod.delete.rawValue)
        XCTAssertEqual(actualValue?.url?.absoluteString, "\(defaultHost)/\(Department.Endpoint)/name/12345")
        XCTAssertNil(actualValue?.httpBody)
    }

    func testShouldReturnDeleteRequestWithName() {
        let actualValue = element.deleteRequestWithName()

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.httpMethod, HttpMethod.delete.rawValue)
        XCTAssertEqual(actualValue?.url?.absoluteString, "\(defaultHost)/\(element.endpoint)/name/\(element.name)")
        XCTAssertNil(actualValue?.httpBody)
    }
}
