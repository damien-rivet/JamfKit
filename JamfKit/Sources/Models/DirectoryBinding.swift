//
//  DirectoryBinding.swift
//  JamfKit
//
//  Copyright © 2018 JamfKit. All rights reserved.
//

/// Represents a logical binding between a computer and an active directory user.
public final class DirectoryBinding: BaseObject {

    // MARK: - Constants

    static let PriorityKey = "priority"
    static let DomainKey = "domain"
    static let UsernameKey = "username"
    static let PasswordKey = "password"
    static let ComputerOrganisationalUnitKey = "computer_ou"
    static let TypeKey = "type"

    // MARK: - Properties

    public var priority: UInt
    public var domain: String
    public var username: String
    public var password: String
    public var computerOrganisationalUnit: String
    public var type: String

    public override var description: String {
        return "[\(String(describing: DirectoryBinding.self))][\(identifier). \(self.name)]"
    }

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
