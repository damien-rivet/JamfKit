//
//  HardwareGroupCriterion.swift
//  JamfKit
//
//  Copyright © 2018 JamfKit. All rights reserved.
//

public final class HardwareGroupCriterion: Identifiable {

    // MARK: - Constants

    static let NameKey = "name"
    static let PriorityKey = "priority"
    static let AndOrKey = "and_or"
    static let SearchTypeKey = "search_type"
    static let ValueKey = "value"
    static let OpeningParenKey = "opening_paren"
    static let ClosingParenKey = "closing_paren"

    // MARK: - Properties

    public var name: String
    public var priority: UInt
    public var andOr: String
    public var searchType: String
    public var value: UInt
    public var openingParen: Bool
    public var closingParen: Bool

    // MARK: - Initialization

    public init?(json: [String: Any], node: String = "") {
        name = json[HardwareGroupCriterion.NameKey] as? String ?? ""
        priority = json[HardwareGroupCriterion.PriorityKey] as? UInt ?? 0
        andOr = json[HardwareGroupCriterion.AndOrKey] as? String ?? ""
        searchType = json[HardwareGroupCriterion.SearchTypeKey] as? String ?? ""
        value = json[HardwareGroupCriterion.ValueKey] as? UInt ?? 0
        openingParen = json[HardwareGroupCriterion.OpeningParenKey] as? Bool ?? false
        closingParen = json[HardwareGroupCriterion.ClosingParenKey] as? Bool ?? false
    }

    // MARK: - Functions

    public func toJSON() -> [String: Any] {
        var json = [String: Any]()

        json[HardwareGroupCriterion.NameKey] = name
        json[HardwareGroupCriterion.PriorityKey] = priority
        json[HardwareGroupCriterion.AndOrKey] = andOr
        json[HardwareGroupCriterion.SearchTypeKey] = searchType
        json[HardwareGroupCriterion.ValueKey] = value
        json[HardwareGroupCriterion.OpeningParenKey] = openingParen
        json[HardwareGroupCriterion.ClosingParenKey] = closingParen

        return json
    }
}
