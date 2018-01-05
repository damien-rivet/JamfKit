//
//  Partition.swift
//  JamfKit
//
//  Copyright © 2018 JamfKit. All rights reserved.
//

/// Represents a logical partition for an hard drive installed inside an hardware element managed by Jamf.
public final class Partition: Identifiable {

    // MARK: - Constants

    static let NameKey = "name"
    static let SizeGigabytesKey = "size_gb"
    static let MaximumPercentageKey = "maximum_percentage"
    static let FormatKey = "format"
    static let IsRestorePartitionKey = "is_restore_partition"
    static let ComputerConfigurationKey = "computer_configuration"
    static let ReimageKey = "reimage"
    static let AppendToNameKey = "append_to_name"

    // MARK: - Properties

    public var name: String
    public var sizeInGigabytes: UInt
    public var maximumPercentage: UInt
    public var format: String
    public var isRestorePartition: Bool
    public var computerConfiguration: String
    public var reimage: Bool
    public var appendToName: String

    // MARK: - Initialization

    public init?(json: [String: Any], node: String = "") {
        name = json[Partition.NameKey] as? String ?? ""
        sizeInGigabytes = json[Partition.SizeGigabytesKey] as? UInt ?? 0
        maximumPercentage = json[Partition.MaximumPercentageKey] as? UInt ?? 0
        format = json[Partition.FormatKey] as? String ?? ""
        isRestorePartition = json[Partition.IsRestorePartitionKey] as? Bool ?? false
        computerConfiguration = json[Partition.ComputerConfigurationKey] as? String ?? ""
        reimage = json[Partition.ReimageKey] as? Bool ?? false
        appendToName = json[Partition.AppendToNameKey] as? String ?? ""
    }

    // MARK: - Functions

    public func toJSON() -> [String: Any] {
        var json = [String: Any]()

        json[Partition.NameKey] = name
        json[Partition.SizeGigabytesKey] = sizeInGigabytes
        json[Partition.MaximumPercentageKey] = maximumPercentage
        json[Partition.FormatKey] = format
        json[Partition.IsRestorePartitionKey] = isRestorePartition
        json[Partition.ComputerConfigurationKey] = computerConfiguration
        json[Partition.ReimageKey] = reimage
        json[Partition.AppendToNameKey] = appendToName

        return json
    }
}
