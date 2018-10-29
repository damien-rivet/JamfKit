//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

@objc(JMFKComputerRemoteManagement)
public final class ComputerRemoteManagement: NSObject, Requestable {

    // MARK: - Constants

    static let ManagedKey = "managed"
    static let ManagementUsernameKey = "management_username"

    // MARK: - Properties

    @objc
    public var isManaged = false

    @objc
    public var managementUsername = ""

    // MARK: - Initialization

    public init?(json: [String: Any], node: String = "") {
        isManaged = json[ComputerRemoteManagement.ManagedKey] as? Bool ?? false
        managementUsername = json[ComputerRemoteManagement.ManagementUsernameKey] as? String ?? ""
    }

    public override init() {
        super.init()
    }

    // MARK: - Functions

    public func toJSON() -> [String: Any] {
        var json = [String: Any]()

        json[ComputerRemoteManagement.ManagedKey] = isManaged
        json[ComputerRemoteManagement.ManagementUsernameKey] = managementUsername

        return json
    }
}
