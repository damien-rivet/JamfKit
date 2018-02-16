//
//  DirectoryBinding.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

/// Represents a logical binding between a computer and an active directory user.
@objc(JMFKDirectoryBinding)
public final class DirectoryBinding: BaseObject {

    // MARK: - Constants

    static let PriorityKey = "priority"
    static let DomainKey = "domain"
    static let UsernameKey = "username"
    static let PasswordKey = "password"
    static let ComputerOrganisationalUnitKey = "computer_ou"
    static let TypeKey = "type"

    // MARK: - Properties

    @objc
    public var priority: UInt

    @objc
    public var domain: String

    @objc
    public var username: String

    @objc
    public var password: String

    @objc
    public var computerOrganisationalUnit: String

    @objc
    public var type: String

    // MARK: - Initialization

    public required init?(json: [String: Any], node: String = "") {
        priority = json[DirectoryBinding.PriorityKey] as? UInt ?? 0
        domain = json[DirectoryBinding.DomainKey] as? String ?? ""
        username = json[DirectoryBinding.UsernameKey] as? String ?? ""
        password = json[DirectoryBinding.PasswordKey] as? String ?? ""
        computerOrganisationalUnit = json[DirectoryBinding.ComputerOrganisationalUnitKey] as? String ?? ""
        type = json[DirectoryBinding.TypeKey] as? String ?? ""

        super.init(json: json)
    }

    // MARK: - Functions

    public override func toJSON() -> [String: Any] {
        var json = super.toJSON()

        json[DirectoryBinding.PriorityKey] = priority
        json[DirectoryBinding.DomainKey] = domain
        json[DirectoryBinding.UsernameKey] = username
        json[DirectoryBinding.PasswordKey] = password
        json[DirectoryBinding.ComputerOrganisationalUnitKey] = computerOrganisationalUnit
        json[DirectoryBinding.TypeKey] = type

        return json
    }
}

// MARK: - Protocols

extension DirectoryBinding: Endpoint, Creatable {

    // MARK: - Properties

    public var endpoint: String {
        return "directorybindings"
    }
}
