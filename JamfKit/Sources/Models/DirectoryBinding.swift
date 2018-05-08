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

    enum CodingKeys: String, CodingKey {
        case priority = "priority"
        case domain = "domain"
        case username = "username"
        case password = "password"
        case computerOrganisationalUnit = "computer_ou"
        case type = "type"
    }

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

    public override init?(identifier: UInt, name: String) {
        super.init(identifier: identifier, name: name)
    }

    public required init?(json: [String: Any], node: String = "") {
        priority = json[CodingKeys.priority.rawValue] as? UInt ?? 0
        domain = json[CodingKeys.domain.rawValue] as? String ?? ""
        username = json[CodingKeys.username.rawValue] as? String ?? ""
        password = json[CodingKeys.password.rawValue] as? String ?? ""
        computerOrganisationalUnit = json[CodingKeys.computerOrganisationalUnit.rawValue] as? String ?? ""
        type = json[CodingKeys.type.rawValue] as? String ?? ""

        super.init(json: json)
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        priority = try container.decode(UInt.self, forKey: .priority)
        domain = try container.decode(String.self, forKey: .domain)
        username = try container.decode(String.self, forKey: .username)
        password = try container.decode(String.self, forKey: .password)
        computerOrganisationalUnit = try container.decode(String.self, forKey: .computerOrganisationalUnit)
        type = try container.decode(String.self, forKey: .type)

        try super.init(from: decoder)
    }

    // MARK: - Functions

    public override func toJSON() -> [String: Any] {
        var json = super.toJSON()

        json[CodingKeys.priority.rawValue] = priority
        json[CodingKeys.domain.rawValue] = domain
        json[CodingKeys.username.rawValue] = username
        json[CodingKeys.password.rawValue] = password
        json[CodingKeys.computerOrganisationalUnit.rawValue] = computerOrganisationalUnit
        json[CodingKeys.type.rawValue] = type

        return json
    }

    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(priority, forKey: .priority)
        try container.encode(domain, forKey: .domain)
        try container.encode(username, forKey: .username)
        try container.encode(password, forKey: .password)
        try container.encode(computerOrganisationalUnit, forKey: .computerOrganisationalUnit)
        try container.encode(type, forKey: .type)

        try super.encode(to: encoder)
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
