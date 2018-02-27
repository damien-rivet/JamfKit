//
//  Requestable.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

/// Represents an object that can be used to perform requests with any JSS endpoint.
@objc(JMFKRequestable)
public protocol Requestable {

    // MARK: - Initialization

    /**
     * Returns a JSS object instantiated from the supplied JSON payload.
     *
     * - Parameter json: The creation key to use for generating the URLRequest
     * - Parameter node: Some JSS object can be nested inside a specific node, this parameter can be used to enforce it
     */
    init?(json: [String: Any], node: String)

    // MARK: - Functions

    /// Returns a JSS object as a JSON payload.
    func toJSON() -> [String: Any]
}
