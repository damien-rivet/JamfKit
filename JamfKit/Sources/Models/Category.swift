//
//  PolicyCategory.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

@objc(JMFKCategory)
public final class Category: BaseObject {

    // MARK: - Constants

    enum CodingKeys: String, CodingKey {
        case priority
    }

    // MARK: - Properties

    @objc
    public var priority: UInt = 0

    // MARK: - Initialization

    public override init?(identifier: UInt, name: String) {
        super.init(identifier: identifier, name: name)
    }

    public required init?(json: [String: Any], node: String = "") {
        guard let priority = json[CodingKeys.priority.rawValue] as? UInt else {
            return nil
        }

        self.priority = priority

        super.init(json: json)
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        priority = try container.decode(UInt.self, forKey: .priority)

        try super.init(from: decoder)
    }

    // MARK: - Functions

    public override func toJSON() -> [String: Any] {
        var json = super.toJSON()

        json[CodingKeys.priority.rawValue] = priority

        return json
    }

    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(priority, forKey: .priority)

        try super.encode(to: encoder)
    }
}
