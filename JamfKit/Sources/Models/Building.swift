//
//  Building.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

/// Represents a physical building.
@objc(JMFKBuilding)
public final class Building: BaseObject { }

// MARK: - Protocols

extension Building: Endpoint, Creatable, Readable, Updatable, Deletable {

    // MARK: - Constants

    public static var Endpoint: String = "buildings"
}
