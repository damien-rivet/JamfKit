//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

/// Represents a logical partition for an hard drive installed inside an hardware element managed by Jamf.
@objc(JMFKPartition)
public final class Partition: NSObject, Requestable {

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

    public init?(name: String) {
        guard !name.isEmpty else {
            return nil
        }

        self.name = name

        super.init()
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
