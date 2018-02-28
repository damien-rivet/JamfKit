//
//  HardwareGroupCriterion.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

@objc(JMFKHardwareGroupCriterion)
public final class HardwareGroupCriterion: NSObject, Codable, Requestable {

    // MARK: - Constants

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case priority = "priority"
        case andOr = "and_or"
        case searchType = "search_type"
        case value = "value"
        case openingParen = "opening_paren"
        case closingParen = "closing_paren"
    }

    // MARK: - Properties

    @objc
    public var name = ""

    @objc
    public var priority: UInt = 0

    @objc
    public var andOr = ""

    @objc
    public var searchType = ""

    @objc
    public var value: UInt = 0

    @objc
    public var openingParen = false

    @objc
    public var closingParen = false

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
        priority = json[CodingKeys.priority.rawValue] as? UInt ?? 0
        andOr = json[CodingKeys.andOr.rawValue] as? String ?? ""
        searchType = json[CodingKeys.searchType.rawValue] as? String ?? ""
        value = json[CodingKeys.value.rawValue] as? UInt ?? 0
        openingParen = json[CodingKeys.openingParen.rawValue] as? Bool ?? false
        closingParen = json[CodingKeys.closingParen.rawValue] as? Bool ?? false
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        name = try container.decode(String.self, forKey: .name)
        priority = try container.decode(UInt.self, forKey: .priority)
        andOr = try container.decode(String.self, forKey: .andOr)
        searchType = try container.decode(String.self, forKey: .searchType)
        value = try container.decode(UInt.self, forKey: .value)
        openingParen = try container.decode(Bool.self, forKey: .openingParen)
        closingParen = try container.decode(Bool.self, forKey: .closingParen)
    }

    // MARK: - Functions

    public func toJSON() -> [String: Any] {
        var json = [String: Any]()

        json[CodingKeys.name.rawValue] = name
        json[CodingKeys.priority.rawValue] = priority
        json[CodingKeys.andOr.rawValue] = andOr
        json[CodingKeys.searchType.rawValue] = searchType
        json[CodingKeys.value.rawValue] = value
        json[CodingKeys.openingParen.rawValue] = openingParen
        json[CodingKeys.closingParen.rawValue] = closingParen

        return json
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(name, forKey: .name)
        try container.encode(priority, forKey: .priority)
        try container.encode(andOr, forKey: .andOr)
        try container.encode(searchType, forKey: .searchType)
        try container.encode(value, forKey: .value)
        try container.encode(openingParen, forKey: .openingParen)
        try container.encode(closingParen, forKey: .closingParen)
    }
}
