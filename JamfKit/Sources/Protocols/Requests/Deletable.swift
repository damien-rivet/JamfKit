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

    func delete() -> URLRequest?
}
