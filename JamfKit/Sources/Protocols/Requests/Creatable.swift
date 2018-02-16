//
//  Creatable.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

/// Represents an object that can be created with an URLRequest
public protocol Creatable {

    // MARK: - Functions

    /**
     * Returns a CREATE **URLRequest** for the supplied JSS object.
     *
     * - Parameter key: The creation key to use for generating the URLRequest
     */
    func create(with key: String) -> URLRequest?
}

// MARK: - Protocols

public extension Creatable where Self: Endpoint & Identifiable {

    // MARK: - Functions

    func create(with key: String = "id") -> URLRequest? {
        return SessionManager.instance.createRequest(for: self, key: key, value: String(self.identifier))
    }
}
