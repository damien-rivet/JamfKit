//
//  Partition.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

/// Represents a logical partition for an hard drive installed inside an hardware element managed by Jamf.
@objc(JMFKPartition)
public final class Partition: NSObject, Codable, Requestable {

    // MARK: - Constants

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case sizeGigabytes = "size_gb"
        case maximumPercentage = "maximum_percentage"
        case format = "format"
        case isRestorePartition = "is_restore_partition"
        case computerConfiguration = "computer_configuration"
        case reimage = "reimage"
        case appendToName = "append_to_name"
    }

    // MARK: - Properties

    @objc
    public var name = ""

    @objc
    public var sizeInGigabytes: UInt = 0

    @objc
    public var maximumPercentage: UInt = 0

    @objc
    public var format = ""

    @objc
    public var isRestorePartition = false

    @objc
    public var computerConfiguration = ""

    @objc
    public var reimage = false

    @objc
    public var appendToName = ""

    @objc
    public override var description: String {
        return "[\(String(describing: type(of: self)))][\(name)]"
    }

    // MARK: - Initialization

    public init?(name: String) {
        guard !name.isEmpty else {
            return nil
        }

        self.name = name

        super.init()
    }

    public init?(json: [String: Any], node: String = "") {
        name = json[CodingKeys.name.rawValue] as? String ?? ""
        sizeInGigabytes = json[CodingKeys.sizeGigabytes.rawValue] as? UInt ?? 0
        maximumPercentage = json[CodingKeys.maximumPercentage.rawValue] as? UInt ?? 0
        format = json[CodingKeys.format.rawValue] as? String ?? ""
        isRestorePartition = json[CodingKeys.isRestorePartition.rawValue] as? Bool ?? false
        computerConfiguration = json[CodingKeys.computerConfiguration.rawValue] as? String ?? ""
        reimage = json[CodingKeys.reimage.rawValue] as? Bool ?? false
        appendToName = json[CodingKeys.appendToName.rawValue] as? String ?? ""
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        name = try container.decode(String.self, forKey: .name)
        sizeInGigabytes = try container.decode(UInt.self, forKey: .sizeGigabytes)
        maximumPercentage = try container.decode(UInt.self, forKey: .maximumPercentage)
        format = try container.decode(String.self, forKey: .format)
        isRestorePartition = try container.decode(Bool.self, forKey: .isRestorePartition)
        computerConfiguration = try container.decode(String.self, forKey: .computerConfiguration)
        reimage = try container.decode(Bool.self, forKey: .reimage)
        appendToName = try container.decode(String.self, forKey: .appendToName)
    }

    // MARK: - Functions

    public func toJSON() -> [String: Any] {
        var json = [String: Any]()

        json[CodingKeys.name.rawValue] = name
        json[CodingKeys.sizeGigabytes.rawValue] = sizeInGigabytes
        json[CodingKeys.maximumPercentage.rawValue] = maximumPercentage
        json[CodingKeys.format.rawValue] = format
        json[CodingKeys.isRestorePartition.rawValue] = isRestorePartition
        json[CodingKeys.computerConfiguration.rawValue] = computerConfiguration
        json[CodingKeys.reimage.rawValue] = reimage
        json[CodingKeys.appendToName.rawValue] = appendToName

        return json
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(name, forKey: .name)
        try container.encode(sizeInGigabytes, forKey: .sizeGigabytes)
        try container.encode(format, forKey: .format)
        try container.encode(isRestorePartition, forKey: .isRestorePartition)
        try container.encode(computerConfiguration, forKey: .computerConfiguration)
        try container.encode(reimage, forKey: .reimage)
        try container.encode(appendToName, forKey: .appendToName)
    }
}
