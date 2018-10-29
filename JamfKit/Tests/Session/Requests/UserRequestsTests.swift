//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

import XCTest

@testable import JamfKit

class UserRequestsTests: XCTestCase {

    // MARK: - Constants

    let subfolder = "User/"
    let defaultHost = "http://localhost"
    var element: User!

    // MARK: - Lifecycle

    override func setUp() {
        try? SessionManager.instance.configure(for: defaultHost, username: "username", password: "password")

        let payload = self.payload(for: "user_valid", subfolder: subfolder)!
        element = User(json: payload)!
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
        let actualValue = User.readAllRequest()

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.httpMethod, HttpMethod.get.rawValue)
        XCTAssertEqual(actualValue?.url?.absoluteString, "\(defaultHost)/\(User.Endpoint)")
        XCTAssertNil(actualValue?.httpBody)
    }

    func testShouldReturnStaticReadRequestWithIdentifier() {
        let actualValue = User.readRequest(identifier: "12345")

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.httpMethod, HttpMethod.get.rawValue)
        XCTAssertEqual(actualValue?.url?.absoluteString, "\(defaultHost)/\(User.Endpoint)/id/12345")
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
        let actualValue = User.readRequest(name: "User")

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.httpMethod, HttpMethod.get.rawValue)
        XCTAssertEqual(actualValue?.url?.absoluteString, "\(defaultHost)/\(User.Endpoint)/name/User")
        XCTAssertNil(actualValue?.httpBody)
    }

    func testShouldReturnReadRequestWithName() {
        let actualValue = element.readRequestWithName()

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.httpMethod, HttpMethod.get.rawValue)
        XCTAssertEqual(actualValue?.url?.absoluteString, "\(defaultHost)/\(element.endpoint)/name/\(element.name)")
        XCTAssertNil(actualValue?.httpBody)
    }

    func testShouldReturnStaticReadRequestWithEmail() {
        let actualValue = User.readRequest(email: "john.appleseed@apple.com")

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.httpMethod, HttpMethod.get.rawValue)
        XCTAssertEqual(actualValue?.url?.absoluteString, "\(defaultHost)/\(User.Endpoint)/email/john.appleseed@apple.com")
        XCTAssertNil(actualValue?.httpBody)
    }

    func testShouldReturnReadRequestWithEmail() {
        let actualValue = element.readRequestWithEmail()

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.httpMethod, HttpMethod.get.rawValue)
        XCTAssertEqual(actualValue?.url?.absoluteString, "\(defaultHost)/\(element.endpoint)/email/\(element.email)")
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

    func testShouldReturnUpdateRequestWithEmail() {
        let actualValue = element.updateRequestWithEmail()

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.httpMethod, HttpMethod.put.rawValue)
        XCTAssertEqual(actualValue?.url?.absoluteString, "\(defaultHost)/\(element.endpoint)/email/\(element.email)")
        XCTAssertNotNil(actualValue?.httpBody)
    }

    func testShouldReturnStaticDeleteRequestWithIdentifier() {
        let actualValue = User.deleteRequest(identifier: "12345")

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.httpMethod, HttpMethod.delete.rawValue)
        XCTAssertEqual(actualValue?.url?.absoluteString, "\(defaultHost)/\(User.Endpoint)/id/12345")
        XCTAssertNil(actualValue?.httpBody)
    }

    func testShouldReturnDeleteRequestWithIdentifier() {
        let actualValue = element.deleteRequest()

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.httpMethod, HttpMethod.delete.rawValue)
        XCTAssertEqual(actualValue?.url?.absoluteString, "\(defaultHost)/\(element.endpoint)/id/\(element.identifier)")
        XCTAssertNil(actualValue?.httpBody)
    }

    func testShouldReturnDeleteRequestWithName() {
        let actualValue = element.deleteRequestWithName()

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.httpMethod, HttpMethod.delete.rawValue)
        XCTAssertEqual(actualValue?.url?.absoluteString, "\(defaultHost)/\(element.endpoint)/name/\(element.name)")
        XCTAssertNil(actualValue?.httpBody)
    }

    func testShouldReturnDeleteRequestWithEmail() {
        let actualValue = element.deleteRequestWithEmail()

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.httpMethod, HttpMethod.delete.rawValue)
        XCTAssertEqual(actualValue?.url?.absoluteString, "\(defaultHost)/\(element.endpoint)/email/\(element.email)")
        XCTAssertNil(actualValue?.httpBody)
    }
}
