//
//  Identifiable.swift
//  JAMFKit
//
//  Copyright © 2017 JAMFKit. All rights reserved.
//

/// Represents the common denominator between all the JSS objects which must contains at least an `identifier` and a `name` properties.
public class BaseObject: Identifiable, CustomStringConvertible {

    // MARK: - Constants

    static let IdentifierKey = "id"
    static let NameKey = "name"

    // MARK: - Properties

    public let identifier: UInt
    public let name: String

    public var description: String {
        return "[\(identifier). \(self.name)]"
    }

    // MARK: - Initialization

    public required init?(json: [String: Any], node: String = "") {
        guard
            let identifier = json[BaseObject.IdentifierKey] as? UInt,
            let name = json[BaseObject.NameKey] as? String
            else {
                return nil
        }

        self.identifier = identifier
        self.name = name
    }

    // MARK: - Functions

    public func toJSON() -> [String: Any] {
        var json = [String: Any]()

        json[BaseObject.IdentifierKey] = identifier
        json[BaseObject.NameKey] = name

        return json
    }
}
