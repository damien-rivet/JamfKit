//
//  SMTPServer.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

/// Represents a physical SMTP server, contains information about the server and it's configuration.
@objc(JMFKSMTPServer)
public final class SMTPServer: NSObject, Requestable, Endpoint {

    // MARK: - Constants

    public static let Endpoint: String = "smtpserver"
    static let EnabledKey = "enabled"
    static let HostKey = "host"
    static let PortKey = "port"
    static let TimeoutKey = "timeout"
    static let AuthorizationRequiredKey = "authorization_required"
    static let UsernameKey = "username"
    static let PasswordKey = "password"
    static let SslKey = "ssl"
    static let TlsKey = "tls"
    static let SendFromNameKey = "send_from_name"
    static let SendFromEmailKey = "send_from_email"

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

    public required init?(json: [String: Any], node: String = "") {
        isEnabled = json[SMTPServer.EnabledKey] as? Bool ?? false
        host = json[SMTPServer.HostKey] as? String ?? ""
        port = json[SMTPServer.PortKey] as? UInt ?? 0
        timeout = json[SMTPServer.TimeoutKey] as? UInt ?? 0
        isAuthorizationRequired = json[SMTPServer.AuthorizationRequiredKey] as? Bool ?? false
        username = json[SMTPServer.UsernameKey] as? String ?? ""
        password = json[SMTPServer.PasswordKey] as? String ?? ""
        isSSLEnabled = json[SMTPServer.SslKey] as? Bool ?? false
        isTLSEnabled = json[SMTPServer.TlsKey] as? Bool ?? false
        sendFromName = json[SMTPServer.SendFromNameKey] as? String ?? ""
        sendFromEmail = json[SMTPServer.SendFromEmailKey] as? String ?? ""
    }

    public init?(host: String, port: UInt) {
        guard !host.isEmpty, port > 0 else {
            return nil
        }

        self.host = host
        self.port = port

        super.init()
    }

    // MARK: - Functions

    public func toJSON() -> [String: Any] {
        var json = [String: Any]()

        json[SMTPServer.EnabledKey] = isEnabled
        json[SMTPServer.HostKey] = host
        json[SMTPServer.PortKey] = port
        json[SMTPServer.TimeoutKey] = timeout
        json[SMTPServer.AuthorizationRequiredKey] = isAuthorizationRequired
        json[SMTPServer.UsernameKey] = username
        json[SMTPServer.PasswordKey] = password
        json[SMTPServer.SslKey] = isSSLEnabled
        json[SMTPServer.TlsKey] = isTLSEnabled
        json[SMTPServer.SendFromNameKey] = sendFromName
        json[SMTPServer.SendFromEmailKey] = sendFromEmail

        return json
    }
}

// MARK: - Readable

extension SMTPServer: Readable {
    public static func readAll() -> URLRequest? {
        return nil
    }

    public static func read(identifier: String) -> URLRequest? {
        return nil
    }

    public func read() -> URLRequest? {
        return SessionManager.instance.readRequest(for: self)
    }
}

// MARK: - Updatable

extension SMTPServer: Updatable {

    public func update() -> URLRequest? {
        return SessionManager.instance.updateRequest(for: self)
    }
}
