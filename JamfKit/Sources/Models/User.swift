//
//  User.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

/// Represents a Jamf user and contains the identification properties that are required to contact the actual user and identify the hardware devices assigned to him / her.
@objc(JMFKUser)
public final class User: BaseObject, Endpoint {

    // MARK: - Constants

    public static let Endpoint = "users"

    enum CodingKeys: String, CodingKey {
        case fullName = "full_name"
        case email = "email"
        case emailAddress = "email_address"
        case phoneNumber = "phone_number"
        case position = "position"
        case enableCustomPhotoURL = "enable_custom_photo_url"
        case customPhotoURL = "custom_photo_url"
        case sites = "sites"
    }

    // MARK: - Properties

    @objc
    public var fullName = ""

    @objc
    public var email = ""

    @objc
    public var emailAddress = ""

    @objc
    public var phoneNumber = ""

    @objc
    public var position = ""

    @objc
    public var enableCustomPhotoURL = false

    @objc
    public var customPhotoURL = ""

    @objc
    public var sites = [Site]()

    public override var description: String {
        let baseDescription = super.description

        if !fullName.isEmpty {
            return "\(baseDescription)[\(self.fullName)]"
        }

        return baseDescription
    }

    // MARK: - Initialization

    public override init?(identifier: UInt, name: String) {
        super.init(identifier: identifier, name: name)
    }

    public required init?(json: [String: Any], node: String = "") {
        fullName = json[CodingKeys.fullName.rawValue] as? String ?? ""
        email = json[CodingKeys.email.rawValue] as? String ?? ""
        emailAddress = json[CodingKeys.emailAddress.rawValue] as? String ?? ""
        phoneNumber = json[CodingKeys.phoneNumber.rawValue] as? String ?? ""
        position = json[CodingKeys.position.rawValue] as? String ?? ""
        enableCustomPhotoURL = json[CodingKeys.enableCustomPhotoURL.rawValue] as? Bool ?? false
        customPhotoURL = json[CodingKeys.customPhotoURL.rawValue] as? String ?? ""

        var sites = [Site]()
        if let rawSites = json[CodingKeys.sites.rawValue] as? [[String: Any]] {
            sites = rawSites.flatMap { Site(json: $0) }
        } else if
            let rawSite = json[CodingKeys.sites.rawValue] as? [String: Any],
            let site = Site(json: rawSite) {
            sites.append(site)
        }

        self.sites = sites

        super.init(json: json)
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        fullName = try container.decode(String.self, forKey: .fullName)
        email = try container.decode(String.self, forKey: .email)
        emailAddress = try container.decode(String.self, forKey: .emailAddress)
        phoneNumber = try container.decode(String.self, forKey: .phoneNumber)
        position = try container.decode(String.self, forKey: .position)
        enableCustomPhotoURL = try container.decode(Bool.self, forKey: .enableCustomPhotoURL)
        customPhotoURL = try container.decode(String.self, forKey: .customPhotoURL)

        try super.init(from: decoder)

        let rawSites = try? container.decode([Site].self, forKey: .sites)
        let rawSite = try? container.decode(Site.self, forKey: .sites)

        if let sites = rawSites {
            self.sites = sites
        } else if let site = rawSite {
            self.sites = [site]
        }
    }

    // MARK: - Functions

    public override func toJSON() -> [String: Any] {
        var json = super.toJSON()

        json[CodingKeys.fullName.rawValue] = fullName
        json[CodingKeys.email.rawValue] = email
        json[CodingKeys.emailAddress.rawValue] = emailAddress
        json[CodingKeys.phoneNumber.rawValue] = phoneNumber
        json[CodingKeys.position.rawValue] = position
        json[CodingKeys.enableCustomPhotoURL.rawValue] = enableCustomPhotoURL
        json[CodingKeys.customPhotoURL.rawValue] = customPhotoURL

        if !sites.isEmpty {
            json[CodingKeys.sites.rawValue] = sites.map { site -> [String: [String: Any]] in
                return ["site": site.toJSON()]
            }
        }

        return json
    }

    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(fullName, forKey: .fullName)
        try container.encode(email, forKey: .email)
        try container.encode(emailAddress, forKey: .emailAddress)
        try container.encode(phoneNumber, forKey: .phoneNumber)
        try container.encode(position, forKey: .position)
        try container.encode(enableCustomPhotoURL, forKey: .enableCustomPhotoURL)
        try container.encode(customPhotoURL, forKey: .customPhotoURL)
        try container.encode(sites, forKey: .sites)

        try super.encode(to: encoder)
    }
}

// MARK: - Creatable

extension User: Creatable {

    public func createRequest() -> URLRequest? {
        return getCreateRequest()
    }
}

// MARK: - Readable

extension User: Readable {

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

    /// Returns a GET **URLRequest** based on the supplied email.
    public static func readRequest(email: String) -> URLRequest? {
        return SessionManager.instance.readRequest(for: self, key: CodingKeys.email.rawValue, value: email)
    }

    /// Returns a GET **URLRequest** based on the email.
    public func readRequestWithEmail() -> URLRequest? {
        return User.readRequest(email: email)
    }
}

// MARK: - Updatable

extension User: Updatable {

    public func updateRequest() -> URLRequest? {
        return getUpdateRequest()
    }

    /// Returns a PUT **URLRequest** based on the name.
    public func updateRequestWithName() -> URLRequest? {
        return getUpdateRequestWithName()
    }

    /// Returns a PUT **URLRequest** based on the email.
    public func updateRequestWithEmail() -> URLRequest? {
        return SessionManager.instance.updateRequest(for: self, key: CodingKeys.email.rawValue, value: email)
    }
}

// MARK: - Deletable

extension User: Deletable {

    public static func deleteRequest(identifier: String) -> URLRequest? {
        return getDeleteRequest(identifier: identifier)
    }

    public func deleteRequest() -> URLRequest? {
        return getDeleteRequest()
    }

    /// Returns a DELETE **URLRequest** based on the supplied name.
    public static func deleteRequest(name: String) -> URLRequest? {
        return SessionManager.instance.deleteRequest(for: self, key: BaseObject.NameKey, value: name)
    }

    /// Returns a DELETE **URLRequest** based on the name.
    public func deleteRequestWithName() -> URLRequest? {
        return User.deleteRequest(name: name)
    }

    /// Returns a DELETE **URLRequest** based on the supplied email.
    public static func deleteRequest(email: String) -> URLRequest? {
        return SessionManager.instance.deleteRequest(for: self, key: CodingKeys.email.rawValue, value: email)
    }

    /// Returns a DELETE **URLRequest** based on the email.
    public func deleteRequestWithEmail() -> URLRequest? {
        return User.deleteRequest(email: email)
    }
}
