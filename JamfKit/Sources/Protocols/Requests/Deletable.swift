//
//  Deletable.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

/// Represents an object that can be deleted with an URLRequest
@objc(JMFKDeletable)
public protocol Deletable {

    // MARK: - Functions

    /// Returns a DELETE **URLRequest** based on the JSS object type & the supplied identifier.
    static func deleteRequest(identifier: String) -> URLRequest?

    /// Returns a DELETE **URLRequest** based on the identifier property of the supplied JSS object.
    func deleteRequest() -> URLRequest?
}

// MARK: - Implementation

extension Deletable where Self: Endpoint & Identifiable {

    static func getDeleteRequest(identifier: String) -> URLRequest? {
        return SessionManager.instance.deleteRequest(for: self, key: BaseObject.CodingKeys.identifier.rawValue, value: identifier)
    }

    func getDeleteRequest() -> URLRequest? {
        return SessionManager.instance.deleteRequest(for: self, key: BaseObject.CodingKeys.identifier.rawValue, value: String(identifier))
    }

    static func getDeleteRequest(name: String) -> URLRequest? {
        return SessionManager.instance.deleteRequest(for: self, key: BaseObject.CodingKeys.name.rawValue, value: name)
    }

    func getDeleteRequestWithName() -> URLRequest? {
        return SessionManager.instance.deleteRequest(for: self, key: BaseObject.CodingKeys.name.rawValue, value: name)
    }
}

extension Deletable where Self: Endpoint & Requestable & Subset {

    static func getDeleteRequest(identifier: String) -> URLRequest? {
        return SessionManager.instance.deleteRequest(for: self, key: BaseObject.CodingKeys.identifier.rawValue, value: identifier)
    }

    static func getDeleteRequest(name: String) -> URLRequest? {
        return SessionManager.instance.deleteRequest(for: self, key: BaseObject.CodingKeys.name.rawValue, value: name)
    }
}
