//
//  ComputerCommand.swift
//  JamfKit
//
//  Copyright © 2018 JamfKit. All rights reserved.
//

import Foundation

/// Represents a logical command that can be executed on any hardware element manageg by Jamf.
@objc(JMFKComputerCommand)
public final class ComputerCommand: NSObject, Identifiable {

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
