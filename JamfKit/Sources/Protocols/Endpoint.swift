//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

/// Represents any JSS object that is matched by a JSS endpoint.
public protocol Endpoint {

    // MARK: - Properties

    static var Endpoint: String { get }

    var endpoint: String { get }
}

extension Endpoint {

    // MARK: - Properties

    public var endpoint: String {
        return Self.Endpoint
    }
}
