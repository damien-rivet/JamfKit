//
//  Identifiable.swift
//  JamfKit
//
//  Copyright © 2017 JamfKit. All rights reserved.
//

import Foundation

@objc(JMFKIdentifiable)
public protocol Identifiable {

    // MARK: - Initialization

    @objc
    init?(json: [String: Any], node: String)

    // MARK: - Functions

    @objc
    func toJSON() -> [String: Any]
}
