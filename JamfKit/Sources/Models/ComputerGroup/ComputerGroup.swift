//
//  ComputerGroup.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

/// Represents a group of computers managed by Jamf, contains grouping information.
@objc(JMFKComputerGroup)
public final class ComputerGroup: HardwareGroup, Endpoint {

    // MARK: - Constants

    public static let Endpoint: String = "computergroups"
    static let ComputersKey = "computers"

    // MARK: - Properties

    @objc
    public var computers = [ComputerGeneral]()

    // MARK: - Initialization

    public required init?(json: [String: Any], node: String = "") {
        computers = ComputerGroup.parseComputers(json: json)

        super.init(json: json)
    }

    public override init?(identifier: UInt, name: String) {
        super.init(identifier: identifier, name: name)
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

// MARK: - Creatable

extension ComputerGroup: Creatable {

    public func create() -> URLRequest? {
        return self.createRequest()
    }
}

// MARK: - Protocols

extension ComputerGroup: Readable, Updatable, Deletable { }
