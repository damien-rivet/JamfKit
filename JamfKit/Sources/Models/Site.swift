//
//  Site.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

/// Represents a physical location (building, office, etc.).
@objc(JMFKSite)
public final class Site: BaseObject, Endpoint {

    // MARK: - Constants

    public static let Endpoint: String = "sites"
}

// MARK: - Protocols

extension Site: Creatable, Readable, Updatable, Deletable { }
