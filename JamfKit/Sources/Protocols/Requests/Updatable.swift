//
//  Updatable.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

/// Represents an object that can be updated with an URLRequest
public protocol Updatable {

    // MARK: - Functions

    /// Returns a PUT **URLRequest** based on the identifier property of the supplied JSS object.
    func update() -> URLRequest?
}

// MARK: - Implementation

public extension Updatable where Self: Endpoint & Identifiable & Requestable {

    // MARK: - Functions

    func update() -> URLRequest? {
        return SessionManager.instance.updateRequest(for: self, key: BaseObject.CodingKeys.identifier.rawValue, value: String(identifier))
    }

    /// Returns a PUT **URLRequest** based on the name property of the supplied JSS object.
    func updateWithName() -> URLRequest? {
        return SessionManager.instance.updateRequest(for: self, key: BaseObject.CodingKeys.name.rawValue, value: name)
    }
}
