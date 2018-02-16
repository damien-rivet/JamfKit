//
//  JamfKitSessionManagerTests.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

import XCTest

@testable import JamfKit

class SessionManagerTests: XCTestCase {

    // MARK: - Constants

    let defaultHost = "http://localhost"
    let defaultUsername = "username"
    let defaultPassword = "password"
    let defaultAuthorizationHeader = "Basic dXNlcm5hbWU6cGFzc3dvcmQ="

    // MARK: - Lifecycle

    override func tearDown() {
        SessionManager.instance.clearConfiguration()
    }

    // MARK: - Tests

    func testShouldConfigureWithValidParameters() {
        let defaultHost = URL(string: self.defaultHost)!

        try? SessionManager.instance.configure(for: self.defaultHost, username: defaultUsername, password: defaultPassword)

        XCTAssertEqual(SessionManager.instance.host, defaultHost)
        XCTAssertEqual(SessionManager.instance.username, defaultUsername)
        XCTAssertEqual(SessionManager.instance.password, defaultPassword)
        XCTAssertEqual(SessionManager.instance.authorizationHeader, defaultAuthorizationHeader)
    }

    func testShouldNotConfigureWithEmptyHost() {
        XCTAssertThrowsError(try SessionManager.instance.configure(for: "", username: defaultUsername, password: defaultPassword))
    }

    func testShouldNotConfigureWithEmptyUsername() {
        XCTAssertThrowsError(try SessionManager.instance.configure(for: self.defaultHost, username: "", password: defaultPassword))
    }

    func testShouldNotConfigureWithEmptyPassword() {
        XCTAssertThrowsError(try SessionManager.instance.configure(for: self.defaultHost, username: defaultUsername, password: ""))
    }

    func testShouldClearConfiguration() {
        try? SessionManager.instance.configure(for: self.defaultHost, username: defaultUsername, password: defaultPassword)

        SessionManager.instance.clearConfiguration()

        XCTAssertNil(SessionManager.instance.host)
        XCTAssertNil(SessionManager.instance.username)
        XCTAssertNil(SessionManager.instance.password)
        XCTAssertEqual(SessionManager.instance.authorizationHeader, "")
    }

    func testShouldPerformThrowingConnectivityCheckWithEmptyConfiguration() {
        SessionManager.instance.clearConfiguration()

        XCTAssertThrowsError(try SessionManager.instance.performConnectivityCheck { result in
            XCTAssertFalse(result)
        })
    }

    func testShouldPerformFailingConnectivityCheckWithEmptyHost() {
        try? SessionManager.instance.configure(for: "", username: defaultUsername, password: defaultPassword)

        try? SessionManager.instance.performConnectivityCheck { result in
            XCTAssertFalse(result)
        }
    }

    func testShouldPerformFailingConnectivityCheckWithEmptyUsername() {
        try? SessionManager.instance.configure(for: self.defaultHost, username: "", password: defaultPassword)

        try? SessionManager.instance.performConnectivityCheck { result in
            XCTAssertFalse(result)
        }
    }

    func testShouldPerformFailingConnectivityCheckWithEmptyPassword() {
        try? SessionManager.instance.configure(for: self.defaultHost, username: defaultUsername, password: "")

        try? SessionManager.instance.performConnectivityCheck { result in
            XCTAssertFalse(result)
        }
    }
}
