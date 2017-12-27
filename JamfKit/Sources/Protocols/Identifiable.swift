//
//  Identifiable.swift
//  JamfKit
//
//  Copyright © 2017 JamfKit. All rights reserved.
//

protocol Identifiable {

    // MARK: - Initialization

    init?(json: [String: Any], node: String)

    // MARK: - Functions

    func toJSON() -> [String: Any]
}
