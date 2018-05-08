//
//  SMTPServer.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

/// Represents a physical SMTP server, contains information about the server and it's configuration.
@objc(JMFKSMTPServer)
public final class SMTPServer: NSObject, Codable, Requestable, Endpoint {

    // MARK: - Constants

    public static let Endpoint = "smtpserver"

    enum CodingKeys: String, CodingKey {
        case enabled = "enabled"
        case host = "host"
        case port = "port"
        case timeout = "timeout"
        case authorizationRequired = "authorization_required"
        case username = "username"
        case password = "password"
        case ssl = "ssl"
        case tls = "tls"
        case sendFromName = "send_from_name"
        case sendFromEmail = "send_from_email"
    }

    // MARK: - Properties

    @objc
    public var isEnabled = false

    @objc
    public var host = ""

    @objc
    public var port: UInt = 0

    @objc
    public var timeout: UInt = 0

    @objc
    public var isAuthorizationRequired = false

    @objc
    public var username = ""

    @objc
    public var password = ""

    @objc
    public var isSSLEnabled = false

    @objc
    public var isTLSEnabled = false

    @objc
    public var sendFromName = ""

    @objc
    public var sendFromEmail = ""

    public override var description: String {
        let baseDescription = "[\(String(describing: type(of: self)))]"

        if !host.isEmpty, port > 0 {
            return "\(baseDescription)[\(host):\(port)]"
        }

        return baseDescription
    }

    // MARK: - Initialization

    public init?(host: String, port: UInt) {
        guard !host.isEmpty, port > 0 else {
            return nil
        }

        self.host = host
        self.port = port

        super.init()
    }

    public required init?(json: [String: Any], node: String = "") {
        isEnabled = json[CodingKeys.enabled.rawValue] as? Bool ?? false
        host = json[CodingKeys.host.rawValue] as? String ?? ""
        port = json[CodingKeys.port.rawValue] as? UInt ?? 0
        timeout = json[CodingKeys.timeout.rawValue] as? UInt ?? 0
        isAuthorizationRequired = json[CodingKeys.authorizationRequired.rawValue] as? Bool ?? false
        username = json[CodingKeys.username.rawValue] as? String ?? ""
        password = json[CodingKeys.password.rawValue] as? String ?? ""
        isSSLEnabled = json[CodingKeys.ssl.rawValue] as? Bool ?? false
        isTLSEnabled = json[CodingKeys.tls.rawValue] as? Bool ?? false
        sendFromName = json[CodingKeys.sendFromName.rawValue] as? String ?? ""
        sendFromEmail = json[CodingKeys.sendFromEmail.rawValue] as? String ?? ""
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        isEnabled = try container.decode(Bool.self, forKey: .enabled)
        host = try container.decode(String.self, forKey: .host)
        port = try container.decode(UInt.self, forKey: .port)
        timeout = try container.decode(UInt.self, forKey: .timeout)
        isAuthorizationRequired = try container.decode(Bool.self, forKey: .authorizationRequired)
        username = try container.decode(String.self, forKey: .username)
        password = try container.decode(String.self, forKey: .password)
        isSSLEnabled = try container.decode(Bool.self, forKey: .ssl)
        isTLSEnabled = try container.decode(Bool.self, forKey: .tls)
        sendFromName = try container.decode(String.self, forKey: .sendFromName)
        sendFromEmail = try container.decode(String.self, forKey: .sendFromEmail)
    }

    // MARK: - Functions

    public func toJSON() -> [String: Any] {
        var json = [String: Any]()

        json[CodingKeys.enabled.rawValue] = isEnabled
        json[CodingKeys.host.rawValue] = host
        json[CodingKeys.port.rawValue] = port
        json[CodingKeys.timeout.rawValue] = timeout
        json[CodingKeys.authorizationRequired.rawValue] = isAuthorizationRequired
        json[CodingKeys.username.rawValue] = username
        json[CodingKeys.password.rawValue] = password
        json[CodingKeys.ssl.rawValue] = isSSLEnabled
        json[CodingKeys.tls.rawValue] = isTLSEnabled
        json[CodingKeys.sendFromName.rawValue] = sendFromName
        json[CodingKeys.sendFromEmail.rawValue] = sendFromEmail

        return json
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(isEnabled, forKey: .enabled)
        try container.encode(host, forKey: .host)
        try container.encode(port, forKey: .port)
        try container.encode(timeout, forKey: .timeout)
        try container.encode(isAuthorizationRequired, forKey: .authorizationRequired)
        try container.encode(username, forKey: .username)
        try container.encode(password, forKey: .password)
        try container.encode(isSSLEnabled, forKey: .ssl)
        try container.encode(isTLSEnabled, forKey: .tls)
        try container.encode(sendFromName, forKey: .sendFromName)
        try container.encode(sendFromEmail, forKey: .sendFromEmail)
    }
}

// MARK: - Readable

extension SMTPServer: Readable {
    public static func readAllRequest() -> URLRequest? {
        return nil
    }

    public static func readRequest(identifier: String) -> URLRequest? {
        return nil
    }

    public func readRequest() -> URLRequest? {
        return SessionManager.instance.readRequest(for: self)
    }
}

// MARK: - Updatable

extension SMTPServer: Updatable {

    public func updateRequest() -> URLRequest? {
        return SessionManager.instance.updateRequest(for: self)
    }
}
