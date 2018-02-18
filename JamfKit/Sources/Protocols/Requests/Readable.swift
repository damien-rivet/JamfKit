//
//  Readable.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

/// Represents an object that can be read with an URLRequest
public protocol Readable {

    // MARK: - Functions

    /// Returns a GET **URLRequest** based on the JSS object type.
    static func readAll() -> URLRequest?

    /// Returns a GET **URLRequest** based on the JSS object type & the supplied identifier.
    static func read(identifier: String) -> URLRequest?

    /// Returns a GET **URLRequest** based on the identifier property of the supplied JSS object.
    func read() -> URLRequest?
}

// MARK: - Implementation

public extension Readable where Self: Endpoint & Identifiable & Requestable {

    // MARK: - Functions

    static func readAll() -> URLRequest? {
        return SessionManager.instance.readAllRequest(for: self.Endpoint)
    }

    static func read(identifier: String) -> URLRequest? {
        return SessionManager.instance.readRequest(for: self, key: BaseObject.CodingKeys.identifier.rawValue, value: identifier)
    }

    func read() -> URLRequest? {
        return SessionManager.instance.readRequest(for: self, key: BaseObject.CodingKeys.identifier.rawValue, value: String(identifier))
    }

    /// Returns a GET **URLRequest** based on the name property of the supplied JSS object.
    func readWithName() -> URLRequest? {
        return SessionManager.instance.readRequest(for: self, key: BaseObject.CodingKeys.name.rawValue, value: name)
    }
}

public extension Readable where Self: Endpoint & Requestable & Subset {

    // MARK: - Functions

    public static func readAll() -> URLRequest? {
        return SessionManager.instance.readAllRequest(for: self.Endpoint)
    }

    static func read(identifier: String) -> URLRequest? {
        return SessionManager.instance.readRequest(for: self, key: BaseObject.CodingKeys.identifier.rawValue, value: identifier)
    }
}
