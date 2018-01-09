//
//  ComputerConfigurationManagement.swift
//  JamfKit
//
//  Copyright © 2018 JamfKit. All rights reserved.
//

public final class ComputerConfigurationManagement: Identifiable {

    // MARK: - Constants

    static let UsernameKey = "username"
    static let PasswordKey = "password"
    static let CreateAccountKey = "create_account"
    static let HideAccountKey = "hide_account"
    static let AllowSSHForManagementOnlyKey = "allow_ssh_for_management_only"

    // MARK: - Properties

    public var username: String
    public var password: String
    public var shouldCreateAccount: Bool
    public var shouldHideAccount: Bool
    public var isSSHAllowedForManagementOnly: Bool

    // MARK: - Initialization

    public init?(json: [String: Any], node: String = "") {
        username = json[ComputerConfigurationManagement.UsernameKey] as? String ?? ""
        password = json[ComputerConfigurationManagement.PasswordKey] as? String ?? ""
        shouldCreateAccount = json[ComputerConfigurationManagement.CreateAccountKey] as? Bool ?? false
        shouldHideAccount = json[ComputerConfigurationManagement.HideAccountKey] as? Bool ?? false
        isSSHAllowedForManagementOnly = json[ComputerConfigurationManagement.AllowSSHForManagementOnlyKey] as? Bool ?? false
    }

    // MARK: - Functions

    public func toJSON() -> [String: Any] {
        var json = [String: Any]()

        json[ComputerConfigurationManagement.UsernameKey] = username
        json[ComputerConfigurationManagement.PasswordKey] = password
        json[ComputerConfigurationManagement.CreateAccountKey] = shouldCreateAccount
        json[ComputerConfigurationManagement.HideAccountKey] = shouldHideAccount
        json[ComputerConfigurationManagement.AllowSSHForManagementOnlyKey] = isSSHAllowedForManagementOnly

        return json
    }
}
