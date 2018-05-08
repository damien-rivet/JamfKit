//
//  Epoch.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

@objc(JMFKPreciseDateError)
public enum PreciseDateError: Int, Error {
    case missingNodeName
}

/// Represents a logical date within JSS api, contains 3 properties, the date itself, an epoch version of the date and an UTC version of the date.
@objc(JMFKPreciseDate)
public final class PreciseDate: NSObject, Codable, Requestable {

    // MARK: - Constants

    enum CodingKeys: String, CodingKey {
        case date
        case epoch
        case utc
    }

    public static let NodeUserInfoKey = CodingUserInfoKey(rawValue: "node")!

    static let EpochKey = "_epoch"
    static let UTCKey = "_utc"

    // MARK: - Properties

    private let node: String

    @objc
    public var date: Date?

    @objc(epoch)
    public var internalEpoch: NSNumber? {
        guard let epoch = self.epoch else {
            return 0
        }

        return NSNumber(value: epoch)
    }

    @nonobjc
    public var epoch: UInt?

    @objc
    public var dateUTC: Date?

    // MARK: - Initialization

    public init?(json: [String: Any], node: String) {
        self.node = node

        if let rawDate = json[node] as? String {
            date = PreciseDate.getDateFormatter().date(from: rawDate)
        }

        epoch = json[node + PreciseDate.EpochKey] as? UInt

        if let rawDateUTC = json[node + PreciseDate.UTCKey] as? String {
            dateUTC = PreciseDate.getUTCDateFormatter().date(from: rawDateUTC)
        }
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: PreciseDateKey.self)

        if let nodeName = decoder.userInfo[PreciseDate.NodeUserInfoKey] as? String {
            self.node = nodeName

            if let dateKey = PreciseDateKey(stringValue: nodeName), let date = try? container.decodeIfPresent(Date.self, forKey: dateKey) {
                self.date = date
            }

            if let epochKey = PreciseDateKey(stringValue: nodeName + PreciseDate.EpochKey), let epoch = try? container.decodeIfPresent(UInt.self, forKey: epochKey) {
                self.epoch = epoch
            }

            if let dateUtcKey = PreciseDateKey(stringValue: nodeName + PreciseDate.UTCKey), let dateUtc = try? container.decodeIfPresent(Date.self, forKey: dateUtcKey) {
                self.dateUTC = dateUtc
            }
        } else {
            throw PreciseDateError.missingNodeName
        }
    }

    // MARK: - Functions

    public func toJSON() -> [String: Any] {
        var json = [String: Any]()

        if let date = date {
            json[node] = PreciseDate.getDateFormatter().string(from: date)
        }

        json[node + PreciseDate.EpochKey] = epoch

        if let dateUTC = dateUTC {
            json[node + PreciseDate.UTCKey] = PreciseDate.getUTCDateFormatter().string(from: dateUTC)
        }

        return json
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: PreciseDateKey.self)

        if let date = self.date, let dateKey = PreciseDateKey(stringValue: node) {
            try container.encode(date, forKey: dateKey)
        }

        if let epoch = self.epoch, let epochKey = PreciseDateKey(stringValue: node + PreciseDate.EpochKey) {
            try container.encode(epoch, forKey: epochKey)
        }

        if let dateUtc = self.dateUTC, let dateUtcKey = PreciseDateKey(stringValue: node + PreciseDate.UTCKey) {
            try container.encode(dateUtc, forKey: dateUtcKey)
        }
    }

    private static func getDateFormatter() -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        return dateFormatter
    }

    private static func getUTCDateFormatter() -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZ"
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        return dateFormatter
    }
}

struct PreciseDateKey: CodingKey {
    var stringValue: String

    init?(stringValue: String) {
        self.stringValue = stringValue
    }

    var intValue: Int? { return nil }

    init?(intValue: Int) { return nil }
}
