//
//  MobileDeviceGroupCriterion.swift
//  JamfKit
//
//  Copyright © 2018 JamfKit. All rights reserved.
//

public final class MobileDeviceGroupCriterion: Identifiable {

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
        name = json[MobileDeviceGroupCriterion.NameKey] as? String ?? ""
        priority = json[MobileDeviceGroupCriterion.PriorityKey] as? UInt ?? 0
        andOr = json[MobileDeviceGroupCriterion.AndOrKey] as? String ?? ""
        searchType = json[MobileDeviceGroupCriterion.SearchTypeKey] as? String ?? ""
        value = json[MobileDeviceGroupCriterion.ValueKey] as? UInt ?? 0
        openingParen = json[MobileDeviceGroupCriterion.OpeningParenKey] as? Bool ?? false
        closingParen = json[MobileDeviceGroupCriterion.ClosingParenKey] as? Bool ?? false
    }

    // MARK: - Functions

    public func toJSON() -> [String: Any] {
        var json = [String: Any]()

        json[MobileDeviceGroupCriterion.NameKey] = name
        json[MobileDeviceGroupCriterion.PriorityKey] = priority
        json[MobileDeviceGroupCriterion.AndOrKey] = andOr
        json[MobileDeviceGroupCriterion.SearchTypeKey] = searchType
        json[MobileDeviceGroupCriterion.ValueKey] = value
        json[MobileDeviceGroupCriterion.OpeningParenKey] = openingParen
        json[MobileDeviceGroupCriterion.ClosingParenKey] = closingParen

        return json
    }
}
