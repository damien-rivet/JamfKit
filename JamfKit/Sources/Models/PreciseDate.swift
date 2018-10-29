//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

/// Represents a logical date within JSS api, contains 3 properties, the date itself, an epoch version of the date and an UTC version of the date.
@objc(JMFKPreciseDate)
public final class PreciseDate: NSObject, Requestable {

    // MARK: - Constants

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
