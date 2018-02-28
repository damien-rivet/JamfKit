//
//  ComputerCommandGeneral.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

@objc(JMFKComputerCommandGeneral)
public final class ComputerCommandGeneral: NSObject, Codable, Requestable {

    // MARK: - Constants

    enum CodingKeys: String, CodingKey {
        case command
        case passcode
    }

    // MARK: - Properties

    @objc
    public var command = ""

    @objc
    public var passcode: UInt = 0

    // MARK: - Initialization

    public init?(command: String, passcode: UInt) {
        guard !command.isEmpty, passcode > 0 else {
            return nil
        }

        self.command = command
        self.passcode = passcode
    }

    public init?(json: [String: Any], node: String = "") {
        guard
            let command = json[CodingKeys.command.rawValue] as? String,
            let passcode = json[CodingKeys.passcode.rawValue] as? UInt
            else {
                return nil
        }

        self.command = command
        self.passcode = passcode
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        command = try container.decode(String.self, forKey: .command)
        passcode = try container.decode(UInt.self, forKey: .passcode)
    }

    // MARK: - Functions

    public func toJSON() -> [String: Any] {
        var json = [String: Any]()

        json[CodingKeys.command.rawValue] = command
        json[CodingKeys.passcode.rawValue] = passcode

        return json
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(command, forKey: .command)
        try container.encode(passcode, forKey: .passcode)
    }
}
