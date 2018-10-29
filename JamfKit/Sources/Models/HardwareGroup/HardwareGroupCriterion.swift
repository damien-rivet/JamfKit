//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

@objc(JMFKHardwareGroupCriterion)
public final class HardwareGroupCriterion: NSObject, Requestable {

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

    public init?(json: [String: Any], node: String = "") {
        name = json[HardwareGroupCriterion.NameKey] as? String ?? ""
        priority = json[HardwareGroupCriterion.PriorityKey] as? UInt ?? 0
        andOr = json[HardwareGroupCriterion.AndOrKey] as? String ?? ""
        searchType = json[HardwareGroupCriterion.SearchTypeKey] as? String ?? ""
        value = json[HardwareGroupCriterion.ValueKey] as? UInt ?? 0
        openingParen = json[HardwareGroupCriterion.OpeningParenKey] as? Bool ?? false
        closingParen = json[HardwareGroupCriterion.ClosingParenKey] as? Bool ?? false
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
