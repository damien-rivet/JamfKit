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

    public static let Endpoint: String = "users"
    static let FullNameKey = "full_name"
    static let EmailKey = "email"
    static let EmailAddressKey = "email_address"
    static let PhoneNumberKey = "phone_number"
    static let PositionKey = "position"
    static let EnableCustomPhotoURLKey = "enable_custom_photo_url"
    static let CustomPhotoURLKey = "custom_photo_url"
    static let SitesKey = "sites"

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

    public required init?(json: [String: Any], node: String = "") {
        fullName = json[User.FullNameKey] as? String ?? ""
        email = json[User.EmailKey] as? String ?? ""
        emailAddress = json[User.EmailAddressKey] as? String ?? ""
        phoneNumber = json[User.PhoneNumberKey] as? String ?? ""
        position = json[User.PositionKey] as? String ?? ""
        enableCustomPhotoURL = json[User.EnableCustomPhotoURLKey] as? Bool ?? false
        customPhotoURL = json[User.CustomPhotoURLKey] as? String ?? ""

        var sites = [Site]()
        if let rawSites = json[User.SitesKey] as? [[String: Any]] {
            sites = rawSites.flatMap { Site(json: $0) }
        } else if
            let rawSite = json[User.SitesKey] as? [String: Any],
            let site = Site(json: rawSite) {
            sites.append(site)
        }

        self.sites = sites

        super.init(json: json)
    }

    public override init?(identifier: UInt, name: String) {
        super.init(identifier: identifier, name: name)
    }

    public override func toJSON() -> [String: Any] {
        var json = super.toJSON()

        json[User.FullNameKey] = fullName
        json[User.EmailKey] = email
        json[User.EmailAddressKey] = emailAddress
        json[User.PhoneNumberKey] = phoneNumber
        json[User.PositionKey] = position
        json[User.EnableCustomPhotoURLKey] = enableCustomPhotoURL
        json[User.CustomPhotoURLKey] = customPhotoURL

        if !sites.isEmpty {
            json[User.SitesKey] = sites.map { site -> [String: [String: Any]] in
                return ["site": site.toJSON()]
            }
        }

        return json
    }
}

// MARK: - Creatable

extension User: Creatable {

    public func create() -> URLRequest? {
        return self.createRequest()
    }
}

// MARK: - Protocols

extension User: Readable {

    public func readWithEmail() -> URLRequest? {
        return SessionManager.instance.readRequest(for: self, key: User.EmailKey, value: email)
    }
}

// MARK: - Updatable

extension User: Updatable {

    public func updateWithEmail() -> URLRequest? {
        return SessionManager.instance.updateRequest(for: self, key: User.EmailKey, value: email)
    }
}

// MARK: - Deletable

extension User: Deletable {

    public func deleteWithEmail() -> URLRequest? {
        return SessionManager.instance.deleteRequest(for: self, key: User.EmailKey, value: email)
    }
}
