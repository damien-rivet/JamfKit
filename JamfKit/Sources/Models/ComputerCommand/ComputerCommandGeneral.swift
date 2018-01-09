//
//  ComputerCommandGeneral.swift
//  JamfKit
//
//  Copyright © 2018 JamfKit. All rights reserved.
//

import Foundation

@objc(JMFKComputerCommandGeneral)
public final class ComputerCommandGeneral: NSObject, Identifiable {

    // MARK: - Constants

    static let CommandKey = "command"
    static let PasscodeKey = "passcode"

    // MARK: - Properties

    @objc
    public var command: String

    @objc
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
