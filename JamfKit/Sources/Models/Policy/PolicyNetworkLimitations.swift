//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

@objc(JMFKPolicyNetworkLimitations)
public final class PolicyNetworkLimitations: NSObject, Requestable {

    // MARK: - Constants

    static let MinimumNetworkConnectionKey = "minimum_network_connection"
    static let AnyIpAddressKey = "any_ip_address"

    // MARK: - Properties

    @objc
    public var minimumNetworkConnection = ""

    @objc
    public var anyIpAddress = false

    // MARK: - Initialization

    public init?(json: [String: Any], node: String = "") {
        minimumNetworkConnection = json[PolicyNetworkLimitations.MinimumNetworkConnectionKey] as? String ?? ""
        anyIpAddress = json[PolicyNetworkLimitations.AnyIpAddressKey] as? Bool ?? false
    }

    public override init() {
        super.init()
    }

    // MARK: - Functions

    public func toJSON() -> [String: Any] {
        var json = [String: Any]()

        json[PolicyNetworkLimitations.MinimumNetworkConnectionKey] = minimumNetworkConnection
        json[PolicyNetworkLimitations.AnyIpAddressKey] = anyIpAddress

        return json
    }
}
