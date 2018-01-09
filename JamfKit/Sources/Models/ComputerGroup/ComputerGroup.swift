//
//  ComputerGroup.swift
//  JamfKit
//
//  Copyright © 2018 JamfKit. All rights reserved.
//

import Foundation

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
