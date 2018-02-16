//
//  Deletable.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

/// Represents an object that can be deleted with an URLRequest
public protocol Deletable {

    // MARK: - Functions

    /// Returns a DELETE **URLRequest** based on the JSS object type & the supplied identifier.
    static func delete(identifier: String) -> URLRequest?

    /// Returns a DELETE **URLRequest** based on the identifier property of the supplied JSS object.
    func delete() -> URLRequest?
}

// MARK: - Implementation

public extension Deletable where Self: Endpoint & Identifiable {

    // MARK: - Functions

    static func delete(identifier: String) -> URLRequest? {
        return SessionManager.instance.deleteRequest(for: self, key: BaseObject.CodingKeys.identifier.rawValue, value: identifier)
    }

    func delete() -> URLRequest? {
        return SessionManager.instance.deleteRequest(for: self, key: BaseObject.CodingKeys.identifier.rawValue, value: String(identifier))
    }

    /// Returns a DELETE **URLRequest** based on the name property of the supplied JSS object.
    func deleteWithName() -> URLRequest? {
        return SessionManager.instance.deleteRequest(for: self, key: BaseObject.CodingKeys.name.rawValue, value: name)
    }
}
