//
//  Identifiable.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

/// Represents any JSS object that can be identified (either by ID or by name)
@objc(JMFKIdentifiable)
public protocol Identifiable {

    // MARK: - Properties

    @objc
    var identifier: UInt { get }

    @objc
    optional var name: String { get }
}
