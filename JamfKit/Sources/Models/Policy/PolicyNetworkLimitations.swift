//
//  PolicyNetworkLimitations.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

@objc(JMFKPolicyNetworkLimitations)
public final class PolicyNetworkLimitations: NSObject, Codable, Requestable {

    // MARK: - Constants

    enum CodingKeys: String, CodingKey {
        case minimumNetworkConnection = "minimum_network_connection"
        case anyIpAddress = "any_ip_address"
    }

    // MARK: - Properties

    @objc
    public var minimumNetworkConnection = ""

    @objc
    public var anyIpAddress = false

    // MARK: - Initialization

    public override init() {
        super.init()
    }

    public init?(json: [String: Any], node: String = "") {
        minimumNetworkConnection = json[CodingKeys.minimumNetworkConnection.rawValue] as? String ?? ""
        anyIpAddress = json[CodingKeys.anyIpAddress.rawValue] as? Bool ?? false
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        minimumNetworkConnection = try container.decode(String.self, forKey: .minimumNetworkConnection)
        anyIpAddress = try container.decode(Bool.self, forKey: .anyIpAddress)
    }

    // MARK: - Functions

    public func toJSON() -> [String: Any] {
        var json = [String: Any]()

        json[CodingKeys.minimumNetworkConnection.rawValue] = minimumNetworkConnection
        json[CodingKeys.anyIpAddress.rawValue] = anyIpAddress

        return json
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(minimumNetworkConnection, forKey: .minimumNetworkConnection)
        try container.encode(anyIpAddress, forKey: .anyIpAddress)
    }
}
