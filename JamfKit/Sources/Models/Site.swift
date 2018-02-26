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

    public func createRequest() -> URLRequest? {
        return getCreateRequest()
    }
}

// MARK: - Readable

extension Site: Readable {

    public static func readAllRequest() -> URLRequest? {
        return getReadAllRequest()
    }

    public static func readRequest(identifier: String) -> URLRequest? {
        return getReadRequest(identifier: identifier)
    }

    public func readRequest() -> URLRequest? {
        return getReadRequest()
    }

    /// Returns a GET **URLRequest** based on the supplied name.
    public static func readRequest(name: String) -> URLRequest? {
        return getReadRequest(name: name)
    }

    /// Returns a GET **URLRequest** based on the email.
    public func readRequestWithName() -> URLRequest? {
        return getReadRequestWithName()
    }
}

// MARK: - Updatable

extension Site: Updatable {

    public func updateRequest() -> URLRequest? {
        return getUpdateRequest()
    }

    /// Returns a PUT **URLRequest** based on the name.
    public func updateRequestWithName() -> URLRequest? {
        return getUpdateRequestWithName()
    }
}

// MARK: - Deletable

extension Site: Deletable {

    public static func deleteRequest(identifier: String) -> URLRequest? {
        return getDeleteRequest(identifier: identifier)
    }

    public func deleteRequest() -> URLRequest? {
        return getDeleteRequest()
    }

    /// Returns a DELETE **URLRequest** based on the supplied name.
    public static func deleteRequest(name: String) -> URLRequest? {
        return getDeleteRequest(name: name)
    }

    /// Returns a DELETE **URLRequest** based on the name.
    public func deleteRequestWithName() -> URLRequest? {
        return getDeleteRequestWithName()
    }
}
