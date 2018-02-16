//
//  JamfKitSessionManagerRequests.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

internal enum HttpHeader: String {
    case accept = "Accept"
    case authorization = "Authorization"
    case contentType = "Content-Type"
}

internal enum HeaderContentType: String {
    case json = "application/json"
}

extension SessionManager {

    // MARK: - Functions

    /// Returns a Base64 encoded username & password pair to be used for Basic HTTP authentication
    internal static func computeAuthorizationHeader(from username: String, password: String) -> String {
        guard
            !username.isEmpty,
            !password.isEmpty,
            let authorizationData = "\(username):\(password)".data(using: String.Encoding.utf8)
        else {
            return ""
        }

        return "Basic \(authorizationData.base64EncodedString())"
    }

    /// Returns an authentified URLRequst matching the supplied configuration
    internal func authentifiedRequest(for url: URL, authorizationHeader: String, method: HttpMethod) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.setValue(authorizationHeader, forHTTPHeaderField: HttpHeader.authorization.rawValue)

        return request
    }
}

extension SessionManager {

    // MARK: - Create

    /// Returns a `CREATE` URLRequest for the supplied URL
    internal func createRequest(for object: Endpoint & Requestable, key: String, value: String) -> URLRequest? {
        guard
            let url = host?.appendingPathComponent("\(object.endpoint)/\(key)/\(value)"),
            let data = try? JSONSerialization.data(withJSONObject: object.toJSON(), options: .prettyPrinted) else {
            return nil
        }

        var request = authentifiedRequest(for: url, authorizationHeader: authorizationHeader, method: HttpMethod.post)
        request.setValue(HeaderContentType.json.rawValue, forHTTPHeaderField: HttpHeader.contentType.rawValue)
        request.httpBody = data

        return request
    }
}

extension SessionManager {

    // MARK: - Read

    /// Returns a `READ` URLRequest for the supplied JSS endpoint
    internal func readAllRequest(for endpoint: String) -> URLRequest? {
        guard let url = host?.appendingPathComponent("\(endpoint)") else {
            return nil
        }

        var request = authentifiedRequest(for: url, authorizationHeader: authorizationHeader, method: HttpMethod.get)
        request.setValue(HeaderContentType.json.rawValue, forHTTPHeaderField: HttpHeader.accept.rawValue)

        return request
    }

    /// Returns a `READ` URLRequest for the supplied endpoint type & identifier
    internal func readRequest(for endpoint: Endpoint.Type, key: String, value: String) -> URLRequest? {
        guard let url = host?.appendingPathComponent("\(endpoint.Endpoint)/\(key)/\(value)") else {
            return nil
        }

        var request = authentifiedRequest(for: url, authorizationHeader: authorizationHeader, method: HttpMethod.get)
        request.setValue(HeaderContentType.json.rawValue, forHTTPHeaderField: HttpHeader.accept.rawValue)

        return request
    }

    /// Returns a `READ` URLRequest for the supplied JSS object
    internal func readRequest(for object: Endpoint, key: String, value: String) -> URLRequest? {
        guard let url = host?.appendingPathComponent("\(object.endpoint)/\(key)/\(value)") else {
            return nil
        }

        var request = authentifiedRequest(for: url, authorizationHeader: authorizationHeader, method: HttpMethod.get)
        request.setValue(HeaderContentType.json.rawValue, forHTTPHeaderField: HttpHeader.accept.rawValue)

        return request
    }
}

extension SessionManager {

    // MARK: - Update

    /// Returns an `UPDATE` URLRequest for the supplied JSS object
    internal func updateRequest(for object: Endpoint & Requestable, key: String, value: String) -> URLRequest? {
        guard
            let url = host?.appendingPathComponent("\(object.endpoint)/\(key)/\(value)"),
            let data = try? JSONSerialization.data(withJSONObject: object.toJSON(), options: .prettyPrinted) else {
                return nil
        }

        var request = authentifiedRequest(for: url, authorizationHeader: authorizationHeader, method: HttpMethod.put)
        request.setValue(HeaderContentType.json.rawValue, forHTTPHeaderField: HttpHeader.contentType.rawValue)
        request.httpBody = data

        return request
    }
}

extension SessionManager {

    // MARK: - Delete

    /// Returns a `DELETE` URLRequest for the supplied endpoint type & identifier
    internal func deleteRequest(for object: Endpoint.Type, key: String, value: String) -> URLRequest? {
        guard let url = host?.appendingPathComponent("\(object.Endpoint)/\(key)/\(value)") else {
            return nil
        }

        return authentifiedRequest(for: url, authorizationHeader: authorizationHeader, method: HttpMethod.delete)
    }

    /// Returns a `DELETE` URLRequest for the supplied URL
    internal func deleteRequest(for object: Endpoint, key: String, value: String) -> URLRequest? {
        guard let url = host?.appendingPathComponent("\(object.endpoint)/\(key)/\(value)") else {
            return nil
        }

        return authentifiedRequest(for: url, authorizationHeader: authorizationHeader, method: HttpMethod.delete)
    }
}
