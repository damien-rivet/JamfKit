//
//  ComputerGroup.swift
//  JamfKit
//
//  Copyright © 2018 JamfKit. All rights reserved.
//

public final class ComputerGroup: HardwareGroup {

    // MARK: - Constants

    static let ComputersKey = "computers"

    // MARK: - Properties

    public var computers: [ComputerGeneral]

    public override var description: String {
        return "[\(String(describing: ComputerGroup.self))]\(super.description)"
    }

    // MARK: - Initialization

    public required init?(json: [String: Any], node: String = "") {
        computers = ComputerGroup.parseComputers(json: json)

        super.init(json: json)
    }

    // MARK: - Functions

    public override func toJSON() -> [String: Any] {
        var json = super.toJSON()

        if computers.count > 0 {
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
