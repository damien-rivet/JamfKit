//
//  ComputerCommand.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

/// Represents a logical command that can be executed on any hardware element manageg by Jamf.
@objc(JMFKComputerCommand)
public final class ComputerCommand: NSObject, Codable, Requestable, Endpoint, Subset {

    // MARK: - Constants

    public static let Endpoint = "computercommands"

    enum CodingKeys: String, CodingKey {
        case general
        case computers
    }

    // MARK: - Properties

    @objc
    public var general: ComputerCommandGeneral

    @objc
    public var computers = [UInt]()

    public override var description: String {
        return "[\(String(describing: type(of: self)))][\(general.command)]"
    }

    // MARK: - Initialization

    public init?(command: String, passcode: UInt) {
        guard let general = ComputerCommandGeneral(command: command, passcode: passcode) else {
            return nil
        }

        self.general = general
    }

    public init?(json: [String: Any], node: String = "") {
        guard
            let generalNode = json[CodingKeys.general.rawValue] as? [String: Any],
            let general = ComputerCommandGeneral(json: generalNode)
            else {
                return nil
        }

        self.general = general

        if let computersNode = json[CodingKeys.computers.rawValue] as? [String: [String: UInt]] {
            computers = computersNode.flatMap { $0.value }.flatMap { $1 }
        } else {
            computers = [UInt]()
        }
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        general = try container.decode(ComputerCommandGeneral.self, forKey: .general)
        computers = try container.decode([UInt].self, forKey: .computers)
    }

    // MARK: - Functions

    public func toJSON() -> [String: Any] {
        var json = [String: Any]()

        json[CodingKeys.general.rawValue] = general.toJSON()

        if !computers.isEmpty {
            let rawComputers = computers.map { computerIdentifier -> [String: [String: UInt]] in
                return [
                    "computer": [
                        "id": computerIdentifier
                    ]
                ]
            }

            json[CodingKeys.computers.rawValue] = rawComputers
        }

        return json
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(general, forKey: .general)
        try container.encode(computers, forKey: .computers)
    }
}

// MARK: - Creatable

extension ComputerCommand: Creatable {

    public func createRequest() -> URLRequest? {
        return SessionManager.instance.createRequest(for: self, key: ComputerCommandGeneral.CodingKeys.command.rawValue, value: general.command)
    }
}

// MARK: - Readable

extension ComputerCommand: Readable {

    public static func readAllRequest() -> URLRequest? {
        return getReadAllRequest()
    }

    public static func readRequest(identifier: String) -> URLRequest? {
        return nil
    }

    public func readRequest() -> URLRequest? {
        return nil
    }
}
