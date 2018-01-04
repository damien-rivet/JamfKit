//
//  Epoch.swift
//  JAMFKit
//
//  Copyright © 2017 JAMFKit. All rights reserved.
//

import Foundation

/// Represents a logical date within JSS api, contains 3 properties, the date itself, an epoch version of the date and an UTC version of the date.
public final class PreciseDate: Identifiable {

    // MARK: - Constants

    static let EpochKey = "_epoch"
    static let UTCKey = "_utc"

    // MARK: - Properties

    private let node: String
    public var date: Date?
    public var epoch: Double?
    public var dateUTC: Date?

    // MARK: - Initialization

    public init?(json: [String: Any], node: String) {
        self.node = node

        if let rawDate = json[node] as? String {
            date = PreciseDate.getDateFormatter().date(from: rawDate)
        }

        epoch = json[node + PreciseDate.EpochKey] as? Double

        if let rawDateUTC = json[node + PreciseDate.UTCKey] as? String {
            dateUTC = PreciseDate.getUTCDateFormatter().date(from: rawDateUTC)
        }
    }

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

    // MARK: - Helpers

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
