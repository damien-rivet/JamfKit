//
//  SMTPServer.swift
//  JamfKit
//
//  Copyright © 2018 JamfKit. All rights reserved.
//

import Foundation

/// Represents a physical SMTP server, contains information about the server and it's configuration.
@objc(JMFKSMTPServer)
public final class SMTPServer: NSObject, Identifiable {

    // MARK: - Constants

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
    public var isEnabled: Bool

    @objc
    public var host: String

    @objc
    public var port: UInt

    @objc
    public var timeout: UInt

    @objc
    public var isAuthorizationRequired: Bool

    @objc
    public var username: String

    @objc
    public var password: String

    @objc
    public var isSSLEnabled: Bool

    @objc
    public var isTLSEnabled: Bool

    @objc
    public var sendFromName: String

    @objc
    public var sendFromEmail: String

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
