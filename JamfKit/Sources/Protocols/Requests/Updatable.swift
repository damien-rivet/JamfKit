//
//  Updatable.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

/// Represents an object that can be updated with an URLRequest
@objc(JMFKUpdatable)
public protocol Updatable {

    // MARK: - Functions

    func update() -> URLRequest?
}
