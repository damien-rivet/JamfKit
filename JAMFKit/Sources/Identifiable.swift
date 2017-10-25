//
//  Identifiable.swift
//  JAMFKit
//
//  Created by Damien Rivet on 25.10.17.
//  Copyright © 2017 JAMFKit. All rights reserved.
//

protocol Identifiable {

    // MARK: - Initialization

    init?(json: [String: Any])

    // MARK: - Functions

    func toJSON() -> [String: Any]
}
