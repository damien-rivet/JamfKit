//
//  NetbootServer.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

/// Represents a physical netboot server, contains information about the server and it's configuration.
@objc(JMFKNetbootServer)
public final class NetbootServer: BaseObject, Endpoint {

    // MARK: - Constants

    public static let Endpoint = "netbootservers"

    enum CodingKeys: String, CodingKey {
        case ipAddress = "ip_address"
        case defaultImage = "default_image"
        case specificImage = "specific_image"
        case targetPlatform = "target_platform"
        case sharePoint = "share_point"
        case set = "set"
        case image = "image"
        case filesystemProtocol = "protocol"
        case configureManually = "configure_manually"
        case bootArguments = "boot_args"
        case bootFile = "boot_file"
        case bootDevice = "boot_device"
    }

    // MARK: - Properties

    @objc
    public var ipAddress = ""

    @objc
    public var isDefaultImage = false

    @objc
    public var isSpecificImage = false

    @objc
    public var targetPlatform = ""

    @objc
    public var sharePoint = ""

    @objc
    public var set = ""

    @objc
    public var image = ""

    @objc
    public var filesystemProtocol = ""

    @objc
    public var configureManually = false

    @objc
    public var bootArguments = ""

    @objc
    public var bootFile = ""

    @objc
    public var bootDevice = ""

    public override var description: String {
        return "[\(String(describing: NetbootServer.self))][\(identifier) - \(self.ipAddress)]"
    }

    // MARK: - Initialization

    public override init?(identifier: UInt, name: String) {
        super.init(identifier: identifier, name: name)
    }

    public required init?(json: [String: Any], node: String = "") {
        ipAddress = json[CodingKeys.ipAddress.rawValue] as? String ?? ""
        isDefaultImage = json[CodingKeys.defaultImage.rawValue] as? Bool ?? false
        isSpecificImage = json[CodingKeys.specificImage.rawValue] as? Bool ?? false
        targetPlatform = json[CodingKeys.targetPlatform.rawValue] as? String ?? ""
        sharePoint = json[CodingKeys.sharePoint.rawValue] as? String ?? ""
        set = json[CodingKeys.set.rawValue] as? String ?? ""
        image = json[CodingKeys.image.rawValue] as? String ?? ""
        filesystemProtocol = json[CodingKeys.filesystemProtocol.rawValue] as? String ?? ""
        configureManually = json[CodingKeys.configureManually.rawValue] as? Bool ?? false
        bootArguments = json[CodingKeys.bootArguments.rawValue] as? String ?? ""
        bootFile = json[CodingKeys.bootFile.rawValue] as? String ?? ""
        bootDevice = json[CodingKeys.bootDevice.rawValue] as? String ?? ""

        super.init(json: json)
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        ipAddress = try container.decode(String.self, forKey: .ipAddress)
        isDefaultImage = try container.decode(Bool.self, forKey: .defaultImage)
        isSpecificImage = try container.decode(Bool.self, forKey: .specificImage)
        targetPlatform = try container.decode(String.self, forKey: .targetPlatform)
        sharePoint = try container.decode(String.self, forKey: .sharePoint)
        set = try container.decode(String.self, forKey: .set)
        image = try container.decode(String.self, forKey: .image)
        filesystemProtocol = try container.decode(String.self, forKey: .filesystemProtocol)
        configureManually = try container.decode(Bool.self, forKey: .configureManually)
        bootArguments = try container.decode(String.self, forKey: .bootArguments)
        bootFile = try container.decode(String.self, forKey: .bootFile)
        bootDevice = try container.decode(String.self, forKey: .bootDevice)

        try super.init(from: decoder)
    }

    // MARK: - Functions

    public override func toJSON() -> [String: Any] {
        var json = super.toJSON()

        json[CodingKeys.ipAddress.rawValue] = ipAddress
        json[CodingKeys.defaultImage.rawValue] = isDefaultImage
        json[CodingKeys.specificImage.rawValue] = isSpecificImage
        json[CodingKeys.targetPlatform.rawValue] = targetPlatform
        json[CodingKeys.sharePoint.rawValue] = sharePoint
        json[CodingKeys.set.rawValue] = set
        json[CodingKeys.image.rawValue] = image
        json[CodingKeys.filesystemProtocol.rawValue] = filesystemProtocol
        json[CodingKeys.configureManually.rawValue] = configureManually
        json[CodingKeys.bootArguments.rawValue] = bootArguments
        json[CodingKeys.bootFile.rawValue] = bootFile
        json[CodingKeys.bootDevice.rawValue] = bootDevice

        return json
    }

    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(ipAddress, forKey: .ipAddress)
        try container.encode(isDefaultImage, forKey: .defaultImage)
        try container.encode(isSpecificImage, forKey: .specificImage)
        try container.encode(targetPlatform, forKey: .targetPlatform)
        try container.encode(sharePoint, forKey: .sharePoint)
        try container.encode(set, forKey: .set)
        try container.encode(image, forKey: .image)
        try container.encode(filesystemProtocol, forKey: .filesystemProtocol)
        try container.encode(configureManually, forKey: .configureManually)
        try container.encode(bootArguments, forKey: .bootArguments)
        try container.encode(bootFile, forKey: .bootFile)
        try container.encode(bootDevice, forKey: .bootDevice)

        try super.encode(to: encoder)
    }
}

// MARK: - Creatable

extension NetbootServer: Creatable {

    public func createRequest() -> URLRequest? {
        return getCreateRequest()
    }
}

// MARK: - Readable

extension NetbootServer: Readable {

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

extension NetbootServer: Updatable {

    public func updateRequest() -> URLRequest? {
        return getUpdateRequest()
    }

    /// Returns a PUT **URLRequest** based on the name.
    public func updateRequestWithName() -> URLRequest? {
        return getUpdateRequestWithName()
    }
}

// MARK: - Deletable

extension NetbootServer: Deletable {

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
