//
//  MobileDeviceGroup.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

/// Represents a group of mobile devices managed by Jamf, contains grouping information.
@objc(JMFKMobileDeviceGroup)
public final class MobileDeviceGroup: HardwareGroup, Endpoint {

    // MARK: - Constants

    public static let Endpoint = "mobiledevicegroups"

    enum CodingKeys: String, CodingKey {
        case mobileDevices = "mobile_devices"
    }

    // MARK: - Properties

    @objc
    public var mobileDevices = [MobileDeviceGeneral]()

    // MARK: - Initialization

    public override init?(identifier: UInt, name: String) {
        super.init(identifier: identifier, name: name)
    }

    public required init?(json: [String: Any], node: String = "") {
        mobileDevices = MobileDeviceGroup.parseMobileDevices(json: json)

        super.init(json: json)
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        mobileDevices = try container.decode([MobileDeviceGeneral].self, forKey: .mobileDevices)

        try super.init(from: decoder)
    }

    // MARK: - Functions

    public override func toJSON() -> [String: Any] {
        var json = super.toJSON()

        if !mobileDevices.isEmpty {
            json[CodingKeys.mobileDevices.rawValue] = mobileDevices.map { mobileDevice -> [String: [String: Any]] in
                return ["mobile_device": mobileDevice.toJSON()]
            }
        }

        return json
    }

    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(mobileDevices, forKey: .mobileDevices)

        try super.encode(to: encoder)
    }

    private static func parseMobileDevices(json: [String: Any]) -> [MobileDeviceGeneral] {
        return BaseObject.parseElements(from: json, nodeKey: CodingKeys.mobileDevices.rawValue, singleNodeKey: "mobile_device")
    }
}

// MARK: - Creatable

extension MobileDeviceGroup: Creatable {

    public func createRequest() -> URLRequest? {
        return getCreateRequest()
    }
}

// MARK: - Readable

extension MobileDeviceGroup: Readable {

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

extension MobileDeviceGroup: Updatable {

    public func updateRequest() -> URLRequest? {
        return getUpdateRequest()
    }

    /// Returns a PUT **URLRequest** based on the name.
    public func updateRequestWithName() -> URLRequest? {
        return getUpdateRequestWithName()
    }
}

// MARK: - Deletable

extension MobileDeviceGroup: Deletable {

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
