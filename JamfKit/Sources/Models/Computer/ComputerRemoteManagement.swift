//
//  ComputerRemoteManagement.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

@objc(JMFKComputerRemoteManagement)
public final class ComputerRemoteManagement: NSObject, Codable, Requestable {

    // MARK: - Constants

    enum CodingKeys: String, CodingKey {
        case managed = "managed"
        case managementUsername = "management_username"
    }

    // MARK: - Properties

    @objc
    public var isManaged = false

    @objc
    public var managementUsername = ""

    // MARK: - Initialization

    public override init() {
        super.init()
    }

    public init?(json: [String: Any], node: String = "") {
        isManaged = json[CodingKeys.managed.rawValue] as? Bool ?? false
        managementUsername = json[CodingKeys.managementUsername.rawValue] as? String ?? ""
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        isManaged = try container.decode(Bool.self, forKey: .managed)
        managementUsername = try container.decode(String.self, forKey: .managementUsername)
    }

    // MARK: - Functions

    public func toJSON() -> [String: Any] {
        var json = [String: Any]()

        json[CodingKeys.managed.rawValue] = isManaged
        json[CodingKeys.managementUsername.rawValue] = managementUsername

        return json
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(isManaged, forKey: .managed)
        try container.encode(managementUsername, forKey: .managementUsername)
    }
}
