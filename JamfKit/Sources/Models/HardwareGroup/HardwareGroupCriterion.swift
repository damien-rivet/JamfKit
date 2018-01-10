//
//  HardwareGroupCriterion.swift
//  JamfKit
//
//  Copyright © 2018 JamfKit. All rights reserved.
//

import Foundation

@objc(JMFKHardwareGroupCriterion)
public final class HardwareGroupCriterion: NSObject, Identifiable {

    // MARK: - Constants

    static let NameKey = "name"
    static let PriorityKey = "priority"
    static let AndOrKey = "and_or"
    static let SearchTypeKey = "search_type"
    static let ValueKey = "value"
    static let OpeningParenKey = "opening_paren"
    static let ClosingParenKey = "closing_paren"

    // MARK: - Properties

    @objc
    public var name: String

    @objc
    public var priority: UInt

    @objc
    public var andOr: String

    @objc
    public var searchType: String

    @objc
    public var value: UInt

    @objc
    public var openingParen: Bool

    @objc
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
