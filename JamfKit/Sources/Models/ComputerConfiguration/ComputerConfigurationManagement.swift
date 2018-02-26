//
//  ComputerConfigurationManagement.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

@objc(JMFKComputerConfigurationManagement)
public final class ComputerConfigurationManagement: NSObject, Requestable {

    // MARK: - Constants

    static let UsernameKey = "username"
    static let PasswordKey = "password"
    static let CreateAccountKey = "create_account"
    static let HideAccountKey = "hide_account"
    static let AllowSSHForManagementOnlyKey = "allow_ssh_for_management_only"

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
