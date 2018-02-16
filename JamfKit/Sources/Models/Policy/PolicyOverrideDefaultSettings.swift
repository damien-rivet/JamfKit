//
//  PolicyOverrideDefaultSettings.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

@objc(JMFKPolicyOverrideDefaultSettings)
public final class PolicyOverrideDefaultSettings: NSObject, Requestable {

    // MARK: - Constants

    static let TargetDriveKey = "target_drive"
    static let DistributionPointKey = "distribution_point"
    static let ForceAfpSmbKey = "force_afp_smb"
    static let SusKey = "sus"
    static let NetbootServerKey = "netboot_server"

    // MARK: - Properties

    @objc
    public var targetDrive: String

    @objc
    public var distributionPoint: String

    @objc
    public var shouldForceAfpSmb: Bool

    @objc
    public var sus: String

    @objc
    public var netbootServer: String

    // MARK: - Initialization

    public init?(json: [String: Any], node: String = "") {
        targetDrive = json[PolicyOverrideDefaultSettings.TargetDriveKey] as? String ?? ""
        distributionPoint = json[PolicyOverrideDefaultSettings.DistributionPointKey] as? String ?? ""
        shouldForceAfpSmb = json[PolicyOverrideDefaultSettings.ForceAfpSmbKey] as? Bool ?? false
        sus = json[PolicyOverrideDefaultSettings.SusKey] as? String ?? ""
        netbootServer = json[PolicyOverrideDefaultSettings.NetbootServerKey] as? String ?? ""
    }

    // MARK: - Functions

    public func toJSON() -> [String: Any] {
        var json = [String: Any]()

        json[PolicyOverrideDefaultSettings.TargetDriveKey] = targetDrive
        json[PolicyOverrideDefaultSettings.DistributionPointKey] = distributionPoint
        json[PolicyOverrideDefaultSettings.ForceAfpSmbKey] = shouldForceAfpSmb
        json[PolicyOverrideDefaultSettings.SusKey] = sus
        json[PolicyOverrideDefaultSettings.NetbootServerKey] = netbootServer

        return json
    }
}
