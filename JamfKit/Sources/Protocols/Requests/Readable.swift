//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

/// Represents an object that can be read with an URLRequest
@objc(JMFKReadable)
public protocol Readable {

    // MARK: - Functions

    /// Returns a GET **URLRequest** based on the JSS object type.
    static func readAllRequest() -> URLRequest?

    /// Returns a GET **URLRequest** based on the JSS object type & the supplied identifier.
    static func readRequest(identifier: String) -> URLRequest?

    /// Returns a GET **URLRequest** based on the identifier property of the supplied JSS object.
    func readRequest() -> URLRequest?
}

// MARK: - Implementation

extension Readable where Self: Endpoint & Identifiable & Requestable {

    // MARK: - Functions

    static func getReadAllRequest() -> URLRequest? {
        return SessionManager.instance.readAllRequest(for: self.Endpoint)
    }

    static func getReadRequest(identifier: String) -> URLRequest? {
        return SessionManager.instance.readRequest(for: self, key: BaseObject.CodingKeys.identifier.rawValue, value: identifier)
    }

    func getReadRequest() -> URLRequest? {
        return SessionManager.instance.readRequest(for: self, key: BaseObject.CodingKeys.identifier.rawValue, value: String(identifier))
    }

    static func getReadRequest(name: String) -> URLRequest? {
        return SessionManager.instance.readRequest(for: self, key: BaseObject.CodingKeys.name.rawValue, value: name)
    }

    func getReadRequestWithName() -> URLRequest? {
        return SessionManager.instance.readRequest(for: self, key: BaseObject.CodingKeys.name.rawValue, value: name)
    }
}

extension Readable where Self: Endpoint & Requestable & Subset {

    public static func getReadAllRequest() -> URLRequest? {
        return SessionManager.instance.readAllRequest(for: self.Endpoint)
    }

    static func getReadRequest(identifier: String) -> URLRequest? {
        return SessionManager.instance.readRequest(for: self, key: BaseObject.CodingKeys.identifier.rawValue, value: identifier)
    }
}
