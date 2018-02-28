//
//  MobileDeviceConfigurationProfileGeneral.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

@objc(JMFKMobileDeviceConfigurationProfileGeneral)
public final class MobileDeviceConfigurationProfileGeneral: ConfigurationProfileGeneral {

    // MARK: - Constants

    enum CodingKeys: String, CodingKey {
        case deploymentMethod = "deployment_method"
        case redeployDaysBeforeCertificateExpires = "redeploy_Dayss_before_certificate_expires"
    }

    // MARK: - Properties

    @objc
    public var deploymentMethod: String = ""

    @objc
    public var redeployDaysBeforeCertificateExpires: UInt = 0

    // MARK: - Initialization

    override init?(identifier: UInt, name: String) {
        super.init(identifier: identifier, name: name)
    }

    public required init?(json: [String: Any], node: String = "") {
        deploymentMethod = json[CodingKeys.deploymentMethod.rawValue] as? String ?? ""
        redeployDaysBeforeCertificateExpires = json[CodingKeys.redeployDaysBeforeCertificateExpires.rawValue] as? UInt ?? 0

        super.init(json: json)
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        deploymentMethod = try container.decode(String.self, forKey: .deploymentMethod)
        redeployDaysBeforeCertificateExpires = try container.decode(UInt.self, forKey: .redeployDaysBeforeCertificateExpires)

        try super.init(from: decoder)
    }

    // MARK: - Functions

    public override func toJSON() -> [String: Any] {
        var json = super.toJSON()

        json[CodingKeys.deploymentMethod.rawValue] = deploymentMethod
        json[CodingKeys.redeployDaysBeforeCertificateExpires.rawValue] = redeployDaysBeforeCertificateExpires

        return json
    }

    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(deploymentMethod, forKey: .deploymentMethod)
        try container.encode(redeployDaysBeforeCertificateExpires, forKey: .redeployDaysBeforeCertificateExpires)

        try super.encode(to: encoder)
    }
}
