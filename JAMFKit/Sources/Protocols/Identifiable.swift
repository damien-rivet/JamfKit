//
//  Identifiable.swift
//  JAMFKit
//
//  Copyright © 2017 JAMFKit. All rights reserved.
//

protocol Identifiable {

    // MARK: - Initialization

    init?(json: [String: Any], node: String)

    // MARK: - Functions

    func toJSON() -> [String: Any]
}
