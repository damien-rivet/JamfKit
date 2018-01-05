//
//  PolicyNetworkLimitations.swift
//  JAMFKit
//
//  Copyright © 2018 JAMFKit. All rights reserved.
//

public final class PolicyNetworkLimitations: Identifiable {

    // MARK: - Constants

    static let MinimumNetworkConnectionKey = "minimum_network_connection"
    static let AnyIpAddressKey = "any_ip_address"

    // MARK: - Properties

    public var minimumNetworkConnection: String
    public var anyIpAddress: Bool

    // MARK: - Initialization

    public init?(json: [String: Any], node: String = "") {
        minimumNetworkConnection = json[PolicyNetworkLimitations.MinimumNetworkConnectionKey] as? String ?? ""
        anyIpAddress = json[PolicyNetworkLimitations.AnyIpAddressKey] as? Bool ?? false
    }

    // MARK: - Functions

    public func toJSON() -> [String: Any] {
        var json = [String: Any]()

        json[PolicyNetworkLimitations.MinimumNetworkConnectionKey] = minimumNetworkConnection
        json[PolicyNetworkLimitations.AnyIpAddressKey] = anyIpAddress

        return json
    }
}
