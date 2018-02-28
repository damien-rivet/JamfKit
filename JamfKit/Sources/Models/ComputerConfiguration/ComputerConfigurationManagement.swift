//
//  ComputerConfigurationManagement.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

@objc(JMFKComputerConfigurationManagement)
public final class ComputerConfigurationManagement: NSObject, Codable, Requestable {

    // MARK: - Constants

    enum CodingKeys: String, CodingKey {
        case username = "username"
        case password = "password"
        case createAccount = "create_account"
        case hideAccount = "hide_account"
        case allowSshForManagementOnly = "allow_ssh_for_management_only"
    }

    // MARK: - Properties

    @objc
    public var username: String

    @objc
    public var password: String

    @objc
    public var shouldCreateAccount: Bool

    @objc
    public var shouldHideAccount: Bool

    @objc
    public var isSSHAllowedForManagementOnly: Bool

    // MARK: - Initialization

    public init?(json: [String: Any], node: String = "") {
        username = json[CodingKeys.username.rawValue] as? String ?? ""
        password = json[CodingKeys.password.rawValue] as? String ?? ""
        shouldCreateAccount = json[CodingKeys.createAccount.rawValue] as? Bool ?? false
        shouldHideAccount = json[CodingKeys.hideAccount.rawValue] as? Bool ?? false
        isSSHAllowedForManagementOnly = json[CodingKeys.allowSshForManagementOnly.rawValue] as? Bool ?? false
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        username = try container.decode(String.self, forKey: .username)
        password = try container.decode(String.self, forKey: .password)
        shouldCreateAccount = try container.decode(Bool.self, forKey: .createAccount)
        shouldHideAccount = try container.decode(Bool.self, forKey: .hideAccount)
        isSSHAllowedForManagementOnly = try container.decode(Bool.self, forKey: .allowSshForManagementOnly)
    }

    // MARK: - Functions

    public func toJSON() -> [String: Any] {
        var json = [String: Any]()

        json[CodingKeys.username.rawValue] = username
        json[CodingKeys.password.rawValue] = password
        json[CodingKeys.createAccount.rawValue] = shouldCreateAccount
        json[CodingKeys.hideAccount.rawValue] = shouldHideAccount
        json[CodingKeys.allowSshForManagementOnly.rawValue] = isSSHAllowedForManagementOnly

        return json
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(username, forKey: .username)
        try container.encode(password, forKey: .password)
        try container.encode(shouldCreateAccount, forKey: .createAccount)
        try container.encode(shouldHideAccount, forKey: .hideAccount)
        try container.encode(isSSHAllowedForManagementOnly, forKey: .allowSshForManagementOnly)
    }
}
