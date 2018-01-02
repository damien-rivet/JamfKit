//
//  SMTPServerTests.swift
//  JAMFKit
//
//  Copyright © 2018 JAMFKit. All rights reserved.
//

import XCTest

@testable import JAMFKit

class SMTPServerTests: XCTestCase {

    // MARK: - Constants

    let defaultIsEnabled = true
    let defaultHost = "smtp.jamfkit.com"
    let defaultPort: UInt = 12345
    let defaultTimeout: UInt = 5
    let defaultIsAuthorizationRequired = true
    let defaultUsername = "username"
    let defaultPassword = "password"
    let defaultIsSSLEnabled = true
    let defaultIsTLSEnabled = true
    let defaultSendFromName = "JAMFKit SMTP Server"
    let defaultSendFromEmail = "smtp@jamfkit.com"

    // MARK: - Tests

    func testShouldInitializeFromJSON() {
        let payload = self.payload(for: "smtp_server")!

        let actualValue = SMTPServer(json: payload)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.description, "[SMTPServer][\(defaultHost):\(defaultPort)]")
        XCTAssertEqual(actualValue?.isEnabled, defaultIsEnabled)
        XCTAssertEqual(actualValue?.host, defaultHost)
        XCTAssertEqual(actualValue?.port, defaultPort)
        XCTAssertEqual(actualValue?.timeout, defaultTimeout)
        XCTAssertEqual(actualValue?.isAuthorizationRequired, defaultIsAuthorizationRequired)
        XCTAssertEqual(actualValue?.username, defaultUsername)
        XCTAssertEqual(actualValue?.password, defaultPassword)
        XCTAssertEqual(actualValue?.isSSLEnabled, defaultIsSSLEnabled)
        XCTAssertEqual(actualValue?.isTLSEnabled, defaultIsTLSEnabled)
        XCTAssertEqual(actualValue?.sendFromName, defaultSendFromName)
        XCTAssertEqual(actualValue?.sendFromEmail, defaultSendFromEmail)
    }

    func testShouldInitializeFromEmptyJSON() {
        let actualValue = SMTPServer(json: [String: Any]())

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.description, "[SMTPServer]")
    }

    func testShouldEncodeToJSON() {
        let payload = self.payload(for: "smtp_server")!

        let actualValue = SMTPServer(json: payload)
        let encodedObject = actualValue?.toJSON()

        XCTAssertNotNil(encodedObject)
        XCTAssertEqual(encodedObject?.count, 11)
        XCTAssertNotNil(encodedObject?[SMTPServer.EnabledKey])
        XCTAssertNotNil(encodedObject?[SMTPServer.HostKey])
        XCTAssertNotNil(encodedObject?[SMTPServer.PortKey])
        XCTAssertNotNil(encodedObject?[SMTPServer.TimeoutKey])
        XCTAssertNotNil(encodedObject?[SMTPServer.AuthorizationRequiredKey])
        XCTAssertNotNil(encodedObject?[SMTPServer.UsernameKey])
        XCTAssertNotNil(encodedObject?[SMTPServer.PasswordKey])
        XCTAssertNotNil(encodedObject?[SMTPServer.SslKey])
        XCTAssertNotNil(encodedObject?[SMTPServer.TlsKey])
        XCTAssertNotNil(encodedObject?[SMTPServer.SendFromNameKey])
        XCTAssertNotNil(encodedObject?[SMTPServer.SendFromEmailKey])
    }
}
