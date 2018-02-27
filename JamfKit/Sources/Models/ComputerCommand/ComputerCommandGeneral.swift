//
//  ComputerCommandGeneral.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

@objc(JMFKComputerCommandGeneral)
public final class ComputerCommandGeneral: NSObject, Requestable {

    // MARK: - Constants

    static let CommandKey = "command"
    static let PasscodeKey = "passcode"

    // MARK: - Properties

    @objc
    public var command = ""

    @objc
    public var passcode: UInt = 0

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

    public init?(command: String, passcode: UInt) {
        guard !command.isEmpty, passcode > 0 else {
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
