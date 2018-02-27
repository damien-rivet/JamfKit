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

    public static let Endpoint = "directorybindings"
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

// MARK: - Creatable

extension DirectoryBinding: Creatable {

    public func createRequest() -> URLRequest? {
        return getCreateRequest()
    }
}

// MARK: - Readable

extension DirectoryBinding: Readable {

    public static func readAllRequest() -> URLRequest? {
        return getReadAllRequest()
    }

    public static func readRequest(identifier: String) -> URLRequest? {
        return getReadRequest(identifier: identifier)
    }

    public func readRequest() -> URLRequest? {
        return getReadRequest()
    }

    /// Returns a GET **URLRequest** based on the supplied name.
    public static func readRequest(name: String) -> URLRequest? {
        return getReadRequest(name: name)
    }

    /// Returns a GET **URLRequest** based on the email.
    public func readRequestWithName() -> URLRequest? {
        return getReadRequestWithName()
    }
}

// MARK: - Updatable

extension DirectoryBinding: Updatable {

    public func updateRequest() -> URLRequest? {
        return getUpdateRequest()
    }

    /// Returns a PUT **URLRequest** based on the name.
    public func updateRequestWithName() -> URLRequest? {
        return getUpdateRequestWithName()
    }
}

// MARK: - Deletable

extension DirectoryBinding: Deletable {

    public static func deleteRequest(identifier: String) -> URLRequest? {
        return getDeleteRequest(identifier: identifier)
    }

    public func deleteRequest() -> URLRequest? {
        return getDeleteRequest()
    }

    /// Returns a DELETE **URLRequest** based on the supplied name.
    public static func deleteRequest(name: String) -> URLRequest? {
        return getDeleteRequest(name: name)
    }

    /// Returns a DELETE **URLRequest** based on the name.
    public func deleteRequestWithName() -> URLRequest? {
        return getDeleteRequestWithName()
    }
}
