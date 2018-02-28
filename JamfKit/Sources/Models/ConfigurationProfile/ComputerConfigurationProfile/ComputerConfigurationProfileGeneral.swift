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

    enum CodingKeys: String, CodingKey {
        case distributionMethod = "distribution_method"
        case userRemovable = "user_removable"
        case level = "level"
    }

    // MARK: - Properties

    @objc
    public var distributionMethod: String = ""

    @objc
    public var isUserRemovable: Bool = false

    @objc
    public var level: String = ""

    // MARK: - Initialization

    override init?(identifier: UInt, name: String) {
        super.init(identifier: identifier, name: name)
    }

    public required init?(json: [String: Any], node: String = "") {
        distributionMethod = json[CodingKeys.distributionMethod.rawValue] as? String ?? ""
        isUserRemovable = json[CodingKeys.userRemovable.rawValue] as? Bool ?? false
        level = json[CodingKeys.level.rawValue] as? String ?? ""

        super.init(json: json)
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        distributionMethod = try container.decode(String.self, forKey: .distributionMethod)
        isUserRemovable = try container.decode(Bool.self, forKey: .userRemovable)
        level = try container.decode(String.self, forKey: .level)

        try super.init(from: decoder)
    }

    // MARK: - Functions

    public override func toJSON() -> [String: Any] {
        var json = super.toJSON()

        json[CodingKeys.distributionMethod.rawValue] = distributionMethod
        json[CodingKeys.userRemovable.rawValue] = isUserRemovable
        json[CodingKeys.level.rawValue] = level

        return json
    }

    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(distributionMethod, forKey: .distributionMethod)
        try container.encode(isUserRemovable, forKey: .userRemovable)
        try container.encode(level, forKey: .level)

        try super.encode(to: encoder)
    }
}
