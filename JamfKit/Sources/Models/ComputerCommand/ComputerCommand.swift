//
//  ComputerCommand.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

/// Represents a logical command that can be executed on any hardware element manageg by Jamf.
@objc(JMFKComputerCommand)
public final class ComputerCommand: NSObject, Requestable {

    // MARK: - Constants

    static let GeneralKey = "general"
    static let ComputersKey = "computers"

    // MARK: - Properties

    @objc
    public var general: ComputerCommandGeneral

    @objc
    public var computers: [UInt]

    public override var description: String {
        return "[\(String(describing: type(of: self)))][\(general.command)]"
    }

    // MARK: - Initialization

    public init?(json: [String: Any], node: String = "") {
        guard
            let generalNode = json[ComputerCommand.GeneralKey] as? [String: Any],
            let general = ComputerCommandGeneral(json: generalNode)
            else {
                return nil
        }

        self.general = general

        if let computersNode = json[ComputerCommand.ComputersKey] as? [String: [String: UInt]] {
            computers = computersNode.flatMap { $0.value }.flatMap { $1 }
        } else {
            computers = [UInt]()
        }
    }

    // MARK: - Functions

    public func toJSON() -> [String: Any] {
        var json = [String: Any]()

        json[ComputerCommand.GeneralKey] = general.toJSON()

        if !computers.isEmpty {
            let rawComputers = computers.map { computerIdentifier -> [String: [String: UInt]] in
                return [
                    "computer": [
                        "id": computerIdentifier
                    ]
                ]
            }

            json[ComputerCommand.ComputersKey] = rawComputers
        }

        return json
    }
}

// MARK: - Requestable

extension ComputerCommand: Endpoint, Creatable {

    // MARK: - Constants

    public static var Endpoint: String = "computercommands"

    // MARK: - Functions

    public func create() -> URLRequest? {
        return SessionManager.instance.createRequest(for: self, key: ComputerCommandGeneral.CommandKey, value: general.command)
    }
}
