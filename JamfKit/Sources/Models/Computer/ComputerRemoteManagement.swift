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

    public var isManaged: Bool
    public var managementUsername: String

    // MARK: - Initialization

    public init?(json: [String: Any], node: String = "") {
        isManaged = json[ComputerRemoteManagement.ManagedKey] as? Bool ?? false
        managementUsername = json[ComputerRemoteManagement.ManagementUsernameKey] as? String ?? ""
    }

    // MARK: - Functions

    public func toJSON() -> [String: Any] {
        var json = [String: Any]()

        json[ComputerRemoteManagement.ManagedKey] = isManaged
        json[ComputerRemoteManagement.ManagementUsernameKey] = managementUsername

        return json
    }
}
