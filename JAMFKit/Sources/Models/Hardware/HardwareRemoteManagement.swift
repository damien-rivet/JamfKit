//
//  HardwareRemoteManagement.swift
//  JAMFKit
//
//  Copyright © 2017 JAMFKit. All rights reserved.
//

public final class HardwareRemoteManagement: Identifiable {

    // MARK: - Constants

    static let ContainerKey = "remote_management"
    static let ManagedKey = "managed"
    static let ManagementUsernameKey = "management_username"

    // MARK: - Properties

    var isManaged: Bool
    var managementUsername: String

    // MARK: - Initialization

    init?(json: [String : Any], node: String = HardwareRemoteManagement.ContainerKey) {
        isManaged = json[HardwareRemoteManagement.ManagedKey] as? Bool ?? false
        managementUsername = json[HardwareRemoteManagement.ManagementUsernameKey] as? String ?? ""
    }

    // MARK: - Functions

    func toJSON() -> [String : Any] {
        var json = [String: Any]()

        json[HardwareRemoteManagement.ManagedKey] = isManaged
        json[HardwareRemoteManagement.ManagementUsernameKey] = managementUsername

        return json
    }
}
