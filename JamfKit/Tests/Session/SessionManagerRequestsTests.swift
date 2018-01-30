//
//  JamfKitSessionManagerRequestsTests.swift
//  JamfKit
//
//  Copyright © 2018 JamfKit. All rights reserved.
//

import XCTest

@testable import JamfKit

class SessionManagerRequestsTests: XCTestCase {

    // MARK: - Constants

    let defaultHost = "http://localhost"
    let defaultUsername = "username"
    let defaultPassword = "password"
    let defaultAuthorizationHeader = "Basic dXNlcm5hbWU6cGFzc3dvcmQ="

    // MARK: - Lifecycle

    override func setUp() {
        try? SessionManager.instance.configure(for: defaultHost, username: defaultUsername, password: defaultPassword)
    }

    // MARK: - Tests

    func testShouldComputeAuthorizationHeaderFromValidParameters() {
        let actualValue = SessionManager.computeAuthorizationHeader(from: defaultUsername, password: defaultPassword)

        XCTAssertEqual(actualValue, defaultAuthorizationHeader)
    }

    func testShouldNotComputeAuthorizationHeaderFromEmptyUsername() {
        let actualValue = SessionManager.computeAuthorizationHeader(from: "", password: defaultPassword)

        XCTAssertEqual(actualValue, "")
    }

    func testShouldNotComputeAuthorizationHeaderFromEmptyPassword() {
        let actualValue = SessionManager.computeAuthorizationHeader(from: defaultUsername, password: "")

        XCTAssertEqual(actualValue, "")
    }

    func testShouldReturnAuthentifiedURLRequest() {
        let defaultURL = URL(string: defaultHost)!
        let authorizationHeader = SessionManager.computeAuthorizationHeader(from: defaultUsername, password: defaultPassword)

        let actualValue = SessionManager.instance.authentifiedRequest(for: defaultURL, authorizationHeader: authorizationHeader, method: HttpMethod.get)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue.value(forHTTPHeaderField: HttpHeader.authorization.rawValue), defaultAuthorizationHeader)
    }

    func testShouldReturnAuthentifiedCreateRequest() {
        let defaultURL = URL(string: defaultHost)!

        let actualValue = SessionManager.instance.createRequest(for: defaultURL)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue.value(forHTTPHeaderField: HttpHeader.authorization.rawValue), defaultAuthorizationHeader)
        XCTAssertEqual(actualValue.httpMethod, HttpMethod.post.rawValue)
    }

    func testShouldReturnAuthentifiedReadRequest() {
        let defaultURL = URL(string: defaultHost)!

        let actualValue = SessionManager.instance.readRequest(for: defaultURL)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue.value(forHTTPHeaderField: HttpHeader.authorization.rawValue), defaultAuthorizationHeader)
        XCTAssertEqual(actualValue.httpMethod, HttpMethod.get.rawValue)
    }

    func testShouldReturnAuthentifiedUpdateRequest() {
        let defaultURL = URL(string: defaultHost)!

        let actualValue = SessionManager.instance.updateRequest(for: defaultURL)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue.value(forHTTPHeaderField: HttpHeader.authorization.rawValue), defaultAuthorizationHeader)
        XCTAssertEqual(actualValue.httpMethod, HttpMethod.put.rawValue)
    }

    func testShouldReturnAuthentifiedDeleteRequest() {
        let defaultURL = URL(string: defaultHost)!

        let actualValue = SessionManager.instance.deleteRequest(for: defaultURL)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue.value(forHTTPHeaderField: HttpHeader.authorization.rawValue), defaultAuthorizationHeader)
        XCTAssertEqual(actualValue.httpMethod, HttpMethod.delete.rawValue)
    }
}
