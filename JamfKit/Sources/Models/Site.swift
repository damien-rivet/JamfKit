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

// MARK: - Creatable

extension Site: Creatable {

    public func create() -> URLRequest? {
        return self.createRequest()
    }
}

// MARK: - Protocols

extension Site: Readable, Updatable, Deletable { }
