//
//  ComputerConfigurationProfileGeneral.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

@objc(JMFKComputerConfigurationProfileGeneral)
public final class ComputerConfigurationProfileGeneral: ConfigurationProfileGeneral {

    // MARK: - Constants

    static let DistributionMethodKey = "distribution_method"
    static let UserRemovableKey = "user_removable"
    static let LevelKey = "level"

    // MARK: - Properties

    @objc
    public var distributionMethod: String = ""

    @objc
    public var isUserRemovable: Bool = false

    @objc
    public var level: String = ""

    // MARK: - Initialization

    public required init?(json: [String: Any], node: String = "") {
        distributionMethod = json[ComputerConfigurationProfileGeneral.DistributionMethodKey] as? String ?? ""
        isUserRemovable = json[ComputerConfigurationProfileGeneral.UserRemovableKey] as? Bool ?? false
        level = json[ComputerConfigurationProfileGeneral.LevelKey] as? String ?? ""

        super.init(json: json)
    }

    override init?(identifier: UInt, name: String) {
        super.init(identifier: identifier, name: name)
    }

    // MARK: - Functions

    public override func toJSON() -> [String: Any] {
        var json = super.toJSON()

        json[ComputerConfigurationProfileGeneral.DistributionMethodKey] = distributionMethod
        json[ComputerConfigurationProfileGeneral.UserRemovableKey] = isUserRemovable
        json[ComputerConfigurationProfileGeneral.LevelKey] = level

        return json
    }
}
