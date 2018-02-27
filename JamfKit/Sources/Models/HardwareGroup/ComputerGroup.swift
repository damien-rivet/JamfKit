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

    public static let Endpoint = "computergroups"
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

    public func createRequest() -> URLRequest? {
        return getCreateRequest()
    }
}

// MARK: - Readable

extension ComputerGroup: Readable {

    public static func readAllRequest() -> URLRequest? {
        return getReadAllRequest()
    }

    public static func readRequest(identifier: String) -> URLRequest? {
        return getReadRequest(identifier: identifier)
    }

    public func readRequest() -> URLRequest? {
        return getReadRequest()
    }

    /// Returns a GET **URLRequest** based on the supplied name.
    public static func readRequest(name: String) -> URLRequest? {
        return getReadRequest(name: name)
    }

    /// Returns a GET **URLRequest** based on the email.
    public func readRequestWithName() -> URLRequest? {
        return getReadRequestWithName()
    }
}

// MARK: - Updatable

extension ComputerGroup: Updatable {

    public func updateRequest() -> URLRequest? {
        return getUpdateRequest()
    }

    /// Returns a PUT **URLRequest** based on the name.
    public func updateRequestWithName() -> URLRequest? {
        return getUpdateRequestWithName()
    }
}

// MARK: - Deletable

extension ComputerGroup: Deletable {

    public static func deleteRequest(identifier: String) -> URLRequest? {
        return getDeleteRequest(identifier: identifier)
    }

    public func deleteRequest() -> URLRequest? {
        return getDeleteRequest()
    }

    /// Returns a DELETE **URLRequest** based on the supplied name.
    public static func deleteRequest(name: String) -> URLRequest? {
        return getDeleteRequest(name: name)
    }

    /// Returns a DELETE **URLRequest** based on the name.
    public func deleteRequestWithName() -> URLRequest? {
        return getDeleteRequestWithName()
    }
}
