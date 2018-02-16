//
//  ComputerGroup.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

/// Represents a group of computers managed by Jamf, contains grouping information.
@objc(JMFKComputerGroup)
public final class ComputerGroup: HardwareGroup {

    // MARK: - Constants

    static let ComputersKey = "computers"

    // MARK: - Properties

    @objc
    public var computers: [ComputerGeneral]

    // MARK: - Initialization

    public required init?(json: [String: Any], node: String = "") {
        computers = ComputerGroup.parseComputers(json: json)

        super.init(json: json)
    }

    // MARK: - Functions

    public override func toJSON() -> [String: Any] {
        var json = super.toJSON()

        if !computers.isEmpty {
            json[ComputerGroup.ComputersKey] = computers.map { computer -> [String: [String: Any]] in
                return ["computer": computer.toJSON()]
            }
        }

        return json
    }

    private static func parseComputers(json: [String: Any]) -> [ComputerGeneral] {
        return BaseObject.parseElements(from: json, nodeKey: ComputerGroup.ComputersKey, singleNodeKey: "computer")
    }
}

// MARK: - Requestable

extension ComputerGroup: Endpoint, Creatable {

    // MARK: - Properties

    public var endpoint: String {
        return "computergroups"
    }
}
