//
//  Building.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

/// Represents a physical building.
@objc(JMFKBuilding)
public final class Building: BaseObject, Endpoint {

    // MARK: - Constants

    public static let Endpoint: String = "buildings"
}

// MARK: - Creatable

extension Building: Creatable {

    public func create() -> URLRequest? {
        return self.createRequest()
    }
}

// MARK: - Protocols

extension Building: Readable, Updatable, Deletable { }
