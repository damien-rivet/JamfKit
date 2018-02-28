//
//  SMTPServerTests.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

import XCTest

@testable import JamfKit

class SMTPServerTests: XCTestCase {

    // MARK: - Constants

    let subfolder = "SMTPServer/"
    let defaultIsEnabled = true
    let defaultHost = "smtp.jamfkit.com"
    let defaultPort: UInt = 12345
    let defaultTimeout: UInt = 5
    let defaultIsAuthorizationRequired = true
    let defaultUsername = "username"
    let defaultPassword = "password"
    let defaultIsSSLEnabled = true
    let defaultIsTLSEnabled = true
    let defaultSendFromName = "JamfKit SMTP Server"
    let defaultSendFromEmail = "smtp@jamfkit.com"

    // MARK: - Tests

    func testShouldInstantiate() {
        let actualValue = SMTPServer(host: defaultHost, port: defaultPort)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.host, defaultHost)
        XCTAssertEqual(actualValue?.port, defaultPort)
    }

    func testShouldNotInstantiateWithInvalidParameters() {
        let actualValue = SMTPServer(host: "", port: defaultPort)

        XCTAssertNil(actualValue)
    }

    func testShouldInitializeFromJSON() {
        let payload = self.payload(for: "smtp_server", subfolder: subfolder)!

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
        let payload = self.payload(for: "smtp_server", subfolder: subfolder)!

        let actualValue = SMTPServer(json: payload)
        let encodedObject = actualValue?.toJSON()

        XCTAssertNotNil(encodedObject)
        XCTAssertEqual(encodedObject?.count, 11)
        XCTAssertNotNil(encodedObject?[SMTPServer.CodingKeys.enabled.rawValue])
        XCTAssertNotNil(encodedObject?[SMTPServer.CodingKeys.host.rawValue])
        XCTAssertNotNil(encodedObject?[SMTPServer.CodingKeys.port.rawValue])
        XCTAssertNotNil(encodedObject?[SMTPServer.CodingKeys.timeout.rawValue])
        XCTAssertNotNil(encodedObject?[SMTPServer.CodingKeys.authorizationRequired.rawValue])
        XCTAssertNotNil(encodedObject?[SMTPServer.CodingKeys.username.rawValue])
        XCTAssertNotNil(encodedObject?[SMTPServer.CodingKeys.password.rawValue])
        XCTAssertNotNil(encodedObject?[SMTPServer.CodingKeys.ssl.rawValue])
        XCTAssertNotNil(encodedObject?[SMTPServer.CodingKeys.tls.rawValue])
        XCTAssertNotNil(encodedObject?[SMTPServer.CodingKeys.sendFromName.rawValue])
        XCTAssertNotNil(encodedObject?[SMTPServer.CodingKeys.sendFromEmail.rawValue])
    }

    func testShouldInitializeFromData() {
        let payload = self.payloadData(for: "smtp_server", subfolder: subfolder)!

        do {
            let actualValue = try JSONDecoder().decode(SMTPServer.self, from: payload)

            XCTAssertNotNil(actualValue)
            XCTAssertEqual(actualValue.description, "[SMTPServer][\(defaultHost):\(defaultPort)]")
            XCTAssertEqual(actualValue.isEnabled, defaultIsEnabled)
            XCTAssertEqual(actualValue.host, defaultHost)
            XCTAssertEqual(actualValue.port, defaultPort)
            XCTAssertEqual(actualValue.timeout, defaultTimeout)
            XCTAssertEqual(actualValue.isAuthorizationRequired, defaultIsAuthorizationRequired)
            XCTAssertEqual(actualValue.username, defaultUsername)
            XCTAssertEqual(actualValue.password, defaultPassword)
            XCTAssertEqual(actualValue.isSSLEnabled, defaultIsSSLEnabled)
            XCTAssertEqual(actualValue.isTLSEnabled, defaultIsTLSEnabled)
            XCTAssertEqual(actualValue.sendFromName, defaultSendFromName)
            XCTAssertEqual(actualValue.sendFromEmail, defaultSendFromEmail)
        } catch {
            XCTFail("Failed to initialize from data")
        }
    }

    func testShouldEncodeToData() {
        let payload = self.payload(for: "smtp_server", subfolder: subfolder)!

        let actualValue = SMTPServer(json: payload)

        do {
            let encodedObject = try JSONEncoder().encode(actualValue)

            XCTAssertNotNil(encodedObject)
        } catch {
            XCTFail("Failed to encode to data")
        }
    }
}
