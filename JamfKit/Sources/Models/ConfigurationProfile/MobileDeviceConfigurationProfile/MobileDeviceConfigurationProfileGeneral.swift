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

    static let DeploymentMethodKey = "deployment_method"
    static let RedeployDaysBeforeCertificateExpiresKey = "redeploy_Dayss_before_certificate_expires"

    // MARK: - Properties

    @objc
    public var deploymentMethod: String = ""

    @objc
    public var redeployDaysBeforeCertificateExpires: UInt = 0

    // MARK: - Initialization

    public required init?(json: [String: Any], node: String = "") {
        deploymentMethod = json[MobileDeviceConfigurationProfileGeneral.DeploymentMethodKey] as? String ?? ""
        redeployDaysBeforeCertificateExpires = json[MobileDeviceConfigurationProfileGeneral.RedeployDaysBeforeCertificateExpiresKey] as? UInt ?? 0

        super.init(json: json)
    }

    override init?(identifier: UInt, name: String) {
        super.init(identifier: identifier, name: name)
    }

    // MARK: - Functions

    public override func toJSON() -> [String: Any] {
        var json = super.toJSON()

        json[MobileDeviceConfigurationProfileGeneral.DeploymentMethodKey] = deploymentMethod
        json[MobileDeviceConfigurationProfileGeneral.RedeployDaysBeforeCertificateExpiresKey] = redeployDaysBeforeCertificateExpires

        return json
    }
}
