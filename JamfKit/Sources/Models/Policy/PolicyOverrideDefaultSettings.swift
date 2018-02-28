//
//  PolicyOverrideDefaultSettings.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

@objc(JMFKPolicyOverrideDefaultSettings)
public final class PolicyOverrideDefaultSettings: NSObject, Codable, Requestable {

    // MARK: - Constants

    enum CodingKeys: String, CodingKey {
        case targetDrive = "target_drive"
        case distributionPoint = "distribution_point"
        case forceAfpSmb = "force_afp_smb"
        case sus = "sus"
        case netbootServer = "netboot_server"
    }

    // MARK: - Properties

    @objc
    public var targetDrive = ""

    @objc
    public var distributionPoint = ""

    @objc
    public var shouldForceAfpSmb = false

    @objc
    public var sus = ""

    @objc
    public var netbootServer = ""

    // MARK: - Initialization

    public override init() {
        super.init()
    }

    public init?(json: [String: Any], node: String = "") {
        targetDrive = json[CodingKeys.targetDrive.rawValue] as? String ?? ""
        distributionPoint = json[CodingKeys.distributionPoint.rawValue] as? String ?? ""
        shouldForceAfpSmb = json[CodingKeys.forceAfpSmb.rawValue] as? Bool ?? false
        sus = json[CodingKeys.sus.rawValue] as? String ?? ""
        netbootServer = json[CodingKeys.netbootServer.rawValue] as? String ?? ""
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        targetDrive = try container.decode(String.self, forKey: .targetDrive)
        distributionPoint = try container.decode(String.self, forKey: .distributionPoint)
        shouldForceAfpSmb = try container.decode(Bool.self, forKey: .forceAfpSmb)
        sus = try container.decode(String.self, forKey: .sus)
        netbootServer = try container.decode(String.self, forKey: .netbootServer)
    }

    // MARK: - Functions

    public func toJSON() -> [String: Any] {
        var json = [String: Any]()

        json[CodingKeys.targetDrive.rawValue] = targetDrive
        json[CodingKeys.distributionPoint.rawValue] = distributionPoint
        json[CodingKeys.forceAfpSmb.rawValue] = shouldForceAfpSmb
        json[CodingKeys.sus.rawValue] = sus
        json[CodingKeys.netbootServer.rawValue] = netbootServer

        return json
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(targetDrive, forKey: .targetDrive)
        try container.encode(distributionPoint, forKey: .distributionPoint)
        try container.encode(shouldForceAfpSmb, forKey: .forceAfpSmb)
        try container.encode(sus, forKey: .sus)
        try container.encode(netbootServer, forKey: .netbootServer)
    }
}
