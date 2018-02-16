//
//  Readable.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

/// Represents an object that can be read with an URLRequest
@objc(JMFKReadable)
public protocol Readable {

    // MARK: - Functions

    func read() -> URLRequest?
}
