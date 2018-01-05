//
//  ComputerCommand.swift
//  JamfKit
//
//  Copyright © 2018 JamfKit. All rights reserved.
//

/// Represents a logical command that can be executed on any hardware element manageg by Jamf.
public final class ComputerCommand: Identifiable, CustomStringConvertible {

    // MARK: - Constants

    static let GeneralKey = "general"
    static let ComputersKey = "computers"

    // MARK: - Properties

    public var general: ComputerCommandGeneral
    public var computers: [UInt]

    public var description: String {
        return "[\(String(describing: ComputerCommand.self))][\(general.command)]"
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

        if computers.count > 0 {
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

public final class ComputerCommandGeneral: Identifiable {

    // MARK: - Constants

    static let CommandKey = "command"
    static let PasscodeKey = "passcode"

    // MARK: - Properties

    public var command: String
    public var passcode: UInt

    // MARK: - Initialization

    public init?(json: [String: Any], node: String = "") {
        guard
            let command = json[ComputerCommandGeneral.CommandKey] as? String,
            let passcode = json[ComputerCommandGeneral.PasscodeKey] as? UInt
            else {
                return nil
        }

        self.command = command
        self.passcode = passcode
    }

    // MARK: - Functions

    public func toJSON() -> [String: Any] {
        var json = [String: Any]()

        json[ComputerCommandGeneral.CommandKey] = command
        json[ComputerCommandGeneral.PasscodeKey] = passcode

        return json
    }
}
