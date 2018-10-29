//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

/// Represents an object that can be updated with an URLRequest
@objc(JMFKUpdatable)
public protocol Updatable {

    // MARK: - Functions

    /// Returns a PUT **URLRequest** based on the identifier property of the supplied JSS object.
    func updateRequest() -> URLRequest?
}

// MARK: - Implementation

extension Updatable where Self: Endpoint & Identifiable & Requestable {

    func getUpdateRequest() -> URLRequest? {
        return SessionManager.instance.updateRequest(for: self, key: BaseObject.CodingKeys.identifier.rawValue, value: String(identifier))
    }

    func getUpdateRequestWithName() -> URLRequest? {
        return SessionManager.instance.updateRequest(for: self, key: BaseObject.CodingKeys.name.rawValue, value: name)
    }
}
