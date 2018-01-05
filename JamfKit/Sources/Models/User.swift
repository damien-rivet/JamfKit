//
//  User.swift
//  JamfKit
//
//  Copyright © 2017 JamfKit. All rights reserved.
//

/// Represents a Jamf user and contains the identification properties that are required to contact the actual user and identify the hardware devices assigned to him / her.
public final class User: BaseObject {

    // MARK: - Constants

    static let FullNameKey = "full_name"
    static let EmailKey = "email"
    static let EmailAddressKey = "email_address"
    static let PhoneNumberKey = "phone_number"
    static let PositionKey = "position"
    static let EnableCustomPhotoURLKey = "enable_custom_photo_url"
    static let CustomPhotoURLKey = "custom_photo_url"
    static let SitesKey = "sites"

    // MARK: - Properties

    public var fullName: String
    public var email: String
    public var emailAddress: String
    public var phoneNumber: String
    public var position: String
    public var enableCustomPhotoURL: Bool
    public var customPhotoURL: String
    public var sites: [Site]

    public override var description: String {
        return "[\(String(describing: User.self))][\(identifier). \(self.fullName)]"
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
}
