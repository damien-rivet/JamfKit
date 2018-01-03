//
//  ComputerRemoteManagement.swift
//  JAMFKit
//
//  Copyright © 2017 JAMFKit. All rights reserved.
//

public final class ComputerRemoteManagement: Identifiable {

    // MARK: - Constants

    static let ContainerKey = "remote_management"
    static let ManagedKey = "managed"
    static let ManagementUsernameKey = "management_username"

    // MARK: - Properties

    var isManaged: Bool
    var managementUsername: String

    // MARK: - Initialization

    init?(json: [String: Any], node: String = ComputerRemoteManagement.ContainerKey) {
        isManaged = json[ComputerRemoteManagement.ManagedKey] as? Bool ?? false
        managementUsername = json[ComputerRemoteManagement.ManagementUsernameKey] as? String ?? ""
    }

    // MARK: - Functions

    func toJSON() -> [String: Any] {
        var json = [String: Any]()

        json[ComputerRemoteManagement.ManagedKey] = isManaged
        json[ComputerRemoteManagement.ManagementUsernameKey] = managementUsername

        return json
    }
}
