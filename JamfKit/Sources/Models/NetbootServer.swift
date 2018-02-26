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

    public static let Endpoint: String = "netbootservers"
    static let IpAddressKey = "ip_address"
    static let DefaultImageKey = "default_image"
    static let SpecificImageKey = "specific_image"
    static let TargetPlatformKey = "target_platform"
    static let SharePointKey = "share_point"
    static let SetKey = "set"
    static let ImageKey = "image"
    static let ProtocolKey = "protocol"
    static let ConfigureManuallyKey = "configure_manually"
    static let BootArgumentsKey = "boot_args"
    static let BootFileKey = "boot_file"
    static let BootDeviceKey = "boot_device"

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

    public required init?(json: [String: Any], node: String = "") {
        ipAddress = json[NetbootServer.IpAddressKey] as? String ?? ""
        isDefaultImage = json[NetbootServer.DefaultImageKey] as? Bool ?? false
        isSpecificImage = json[NetbootServer.SpecificImageKey] as? Bool ?? false
        targetPlatform = json[NetbootServer.TargetPlatformKey] as? String ?? ""
        sharePoint = json[NetbootServer.SharePointKey] as? String ?? ""
        set = json[NetbootServer.SetKey] as? String ?? ""
        image = json[NetbootServer.ImageKey] as? String ?? ""
        filesystemProtocol = json[NetbootServer.ProtocolKey] as? String ?? ""
        configureManually = json[NetbootServer.ConfigureManuallyKey] as? Bool ?? false
        bootArguments = json[NetbootServer.BootArgumentsKey] as? String ?? ""
        bootFile = json[NetbootServer.BootFileKey] as? String ?? ""
        bootDevice = json[NetbootServer.BootDeviceKey] as? String ?? ""

        super.init(json: json)
    }

    public override init?(identifier: UInt, name: String) {
        super.init(identifier: identifier, name: name)
    }

    // MARK: - Functions

    public override func toJSON() -> [String: Any] {
        var json = super.toJSON()

        json[NetbootServer.IpAddressKey] = ipAddress
        json[NetbootServer.DefaultImageKey] = isDefaultImage
        json[NetbootServer.SpecificImageKey] = isSpecificImage
        json[NetbootServer.TargetPlatformKey] = targetPlatform
        json[NetbootServer.SharePointKey] = sharePoint
        json[NetbootServer.SetKey] = set
        json[NetbootServer.ImageKey] = image
        json[NetbootServer.ProtocolKey] = filesystemProtocol
        json[NetbootServer.ConfigureManuallyKey] = configureManually
        json[NetbootServer.BootArgumentsKey] = bootArguments
        json[NetbootServer.BootFileKey] = bootFile
        json[NetbootServer.BootDeviceKey] = bootDevice

        return json
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
