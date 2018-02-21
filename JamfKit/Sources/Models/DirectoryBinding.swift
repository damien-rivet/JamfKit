//
//  DirectoryBinding.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

/// Represents a logical binding between a computer and an active directory user.
@objc(JMFKDirectoryBinding)
public final class DirectoryBinding: BaseObject, Endpoint {

    // MARK: - Constants

    public static let Endpoint: String = "directorybindings"
    static let PriorityKey = "priority"
    static let DomainKey = "domain"
    static let UsernameKey = "username"
    static let PasswordKey = "password"
    static let ComputerOrganisationalUnitKey = "computer_ou"
    static let TypeKey = "type"

    // MARK: - Properties

    @objc
    public var priority: UInt = 0

    @objc
    public var domain = ""

    @objc
    public var username = ""

    @objc
    public var password = ""

    @objc
    public var computerOrganisationalUnit = ""

    @objc
    public var type = ""

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

    public override init?(identifier: UInt, name: String) {
        super.init(identifier: identifier, name: name)
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

extension DirectoryBinding: Creatable, Readable, Updatable, Deletable { }
