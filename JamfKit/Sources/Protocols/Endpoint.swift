//
//  Endpoint.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

/// Represents any JSS object that is matched by a JSS endpoint
@objc(JMFKEndpoint)
public protocol Endpoint {

    // MARK: - Properties

    @objc
    var endpoint: String { get }
}
