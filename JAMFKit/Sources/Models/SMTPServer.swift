//
//  SMTPServer.swift
//  JAMFKit
//
//  Copyright © 2018 JAMFKit. All rights reserved.
//

public final class SMTPServer: Identifiable, CustomStringConvertible {

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

    var isEnabled: Bool?
    var host: String?
    var port: UInt?
    var timeout: UInt?
    var isAuthorizationRequired: Bool?
    var username: String?
    var password: String?
    var isSSLEnabled: Bool?
    var isTLSEnabled: Bool?
    var sendFromName: String?
    var sendFromEmail: String?

    public var description: String {
        let baseDescription = "[\(String(describing: SMTPServer.self))]"

        if let host = self.host, let port = self.port {
            return "\(baseDescription)[\(host):\(port)]"
        }

        return baseDescription
    }

    // MARK: - Initialization

    public required init?(json: [String: Any], node: String = "") {
        isEnabled = json[SMTPServer.EnabledKey] as? Bool
        host = json[SMTPServer.HostKey] as? String
        port = json[SMTPServer.PortKey] as? UInt
        timeout = json[SMTPServer.TimeoutKey] as? UInt
        isAuthorizationRequired = json[SMTPServer.AuthorizationRequiredKey] as? Bool
        username = json[SMTPServer.UsernameKey] as? String
        password = json[SMTPServer.PasswordKey] as? String
        isSSLEnabled = json[SMTPServer.SslKey] as? Bool
        isTLSEnabled = json[SMTPServer.TlsKey] as? Bool
        sendFromName = json[SMTPServer.SendFromNameKey] as? String
        sendFromEmail = json[SMTPServer.SendFromEmailKey] as? String
    }

    // MARK: - Functions

    func toJSON() -> [String: Any] {
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
