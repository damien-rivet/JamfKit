//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

/// Represents a physical building.
@objc(JMFKBuilding)
public final class Building: BaseObject, Endpoint {

    // MARK: - Constants

    public static let Endpoint = "buildings"

    static let StreetAddress1Key = "streetAddress1"
    static let StreetAddress2Key = "streetAddress2"
    static let CityKey = "city"
    static let StateProvinceKey = "stateProvince"
    static let ZipPostalCodeKey = "zipPostalCode"
    static let CountryKey = "country"

    // MARK: - Properties

    @objc
    public var streetAddress1 = ""

    @objc
    public var streetAddress2 = ""

    @objc
    public var city = ""

    @objc
    public var stateProvince = ""

    @objc
    public var zipPostalCode = ""

    @objc
    public var country = ""

    // MARK: - Initialization

    public required init?(json: [String: Any], node: String = "") {
        streetAddress1 = json[Building.StreetAddress1Key] as? String ?? ""
        streetAddress2 = json[Building.StreetAddress2Key] as? String ?? ""
        city = json[Building.CityKey] as? String ?? ""
        stateProvince = json[Building.StateProvinceKey] as? String ?? ""
        zipPostalCode = json[Building.ZipPostalCodeKey] as? String ?? ""
        country = json[Building.CountryKey] as? String ?? ""

        super.init(json: json)
    }

    public override init?(identifier: UInt, name: String) {
        super.init(identifier: identifier, name: name)
    }

    // MARK: - Functions

    public override func toJSON() -> [String: Any] {
        var json = super.toJSON()

        json[Building.StreetAddress1Key] = streetAddress1
        json[Building.StreetAddress2Key] = streetAddress2
        json[Building.CityKey] = city
        json[Building.StateProvinceKey] = stateProvince
        json[Building.ZipPostalCodeKey] = zipPostalCode
        json[Building.CountryKey] = country

        return json
    }
}

// MARK: - Creatable

extension Building: Creatable {

    public func createRequest() -> URLRequest? {
        return getCreateRequest()
    }
}

// MARK: - Readable

extension Building: Readable {

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

extension Building: Updatable {

    public func updateRequest() -> URLRequest? {
        return getUpdateRequest()
    }

    /// Returns a PUT **URLRequest** based on the name.
    public func updateRequestWithName() -> URLRequest? {
        return getUpdateRequestWithName()
    }
}

// MARK: - Deletable

extension Building: Deletable {

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
