//
//  JamfKitSessionManagerRequests.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

enum HttpHeader: String {
    case accept = "Accept"
    case authorization = "Authorization"
    case contentType = "Content-Type"
}

enum HeaderContentType: String {
    case json = "application/json"
}

extension SessionManager {

    // MARK: - Functions

    /// Returns a Base64 encoded username & password pair to be used for Basic HTTP authentication
    static func computeAuthorizationHeader(from username: String, password: String) -> String {
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
    func authentifiedRequest(for url: URL, authorizationHeader: String, method: HttpMethod) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.setValue(authorizationHeader, forHTTPHeaderField: HttpHeader.authorization.rawValue)

        return request
    }

    func baseRequest(endpoint: String, key: String, value: String, method: HttpMethod) -> URLRequest? {
        guard let url = host?.appendingPathComponent("\(endpoint)/\(key.asCleanedKey())/\(value)") else {
            return nil
        }

        return authentifiedRequest(for: url, authorizationHeader: authorizationHeader, method: method)
    }
}

// MARK: - Create

extension SessionManager {

    /// Returns a `CREATE` URLRequest for the supplied URL
    func createRequest(for object: Endpoint & Requestable, key: String, value: String) -> URLRequest? {
        guard
            var request = baseRequest(endpoint: object.endpoint, key: key, value: value, method: .post),
            let data = try? JSONSerialization.data(withJSONObject: object.toJSON(), options: .prettyPrinted) else {
            return nil
        }

        request.setValue(HeaderContentType.json.rawValue, forHTTPHeaderField: HttpHeader.contentType.rawValue)
        request.httpBody = data

        return request
    }
}

// MARK: - Read

extension SessionManager {

    /// Returns a `READ` URLRequest for the supplied JSS endpoint
    func readAllRequest(for endpoint: String) -> URLRequest? {
        guard let url = host?.appendingPathComponent("\(endpoint)") else {
            return nil
        }

        var request = authentifiedRequest(for: url, authorizationHeader: authorizationHeader, method: HttpMethod.get)
        request.setValue(HeaderContentType.json.rawValue, forHTTPHeaderField: HttpHeader.accept.rawValue)

        return request
    }

    /// Returns a `READ` URLRequest for the supplied endpoint type & identifier
    func readRequest(for endpoint: Endpoint.Type, key: String, value: String) -> URLRequest? {
        guard var request = baseRequest(endpoint: endpoint.Endpoint, key: key, value: value, method: .get) else {
            return nil
        }

        request.setValue(HeaderContentType.json.rawValue, forHTTPHeaderField: HttpHeader.accept.rawValue)

        return request
    }

    /// Returns a `READ` URLRequest for the supplied JSS object
    func readRequest(for object: Endpoint) -> URLRequest? {
        guard let url = host?.appendingPathComponent("\(object.endpoint)") else {
            return nil
        }

        var request = authentifiedRequest(for: url, authorizationHeader: authorizationHeader, method: HttpMethod.get)
        request.setValue(HeaderContentType.json.rawValue, forHTTPHeaderField: HttpHeader.accept.rawValue)

        return request
    }

    /// Returns a `READ` URLRequest for the supplied JSS object
    func readRequest(for object: Endpoint, key: String, value: String) -> URLRequest? {
        guard var request = baseRequest(endpoint: object.endpoint, key: key, value: value, method: .get) else {
            return nil
        }

        request.setValue(HeaderContentType.json.rawValue, forHTTPHeaderField: HttpHeader.accept.rawValue)

        return request
    }
}

// MARK: - Update

extension SessionManager {

    /// Returns an `UPDATE` URLRequest for the supplied JSS object
    func updateRequest(for object: Endpoint & Requestable) -> URLRequest? {
        guard
            let url = host?.appendingPathComponent("\(object.endpoint)"),
            let data = try? JSONSerialization.data(withJSONObject: object.toJSON(), options: .prettyPrinted) else {
                return nil
        }

        var request = authentifiedRequest(for: url, authorizationHeader: authorizationHeader, method: HttpMethod.put)
        request.setValue(HeaderContentType.json.rawValue, forHTTPHeaderField: HttpHeader.contentType.rawValue)
        request.httpBody = data

        return request
    }

    /// Returns an `UPDATE` URLRequest for the supplied JSS object
    func updateRequest(for object: Endpoint & Requestable, key: String, value: String) -> URLRequest? {
        guard
            var request = self.baseRequest(endpoint: object.endpoint, key: key, value: value, method: .put),
            let data = try? JSONSerialization.data(withJSONObject: object.toJSON(), options: .prettyPrinted) else {
                return nil
        }

        request.setValue(HeaderContentType.json.rawValue, forHTTPHeaderField: HttpHeader.contentType.rawValue)
        request.httpBody = data

        return request
    }
}

// MARK: - Delete

extension SessionManager {

    /// Returns a `DELETE` URLRequest for the supplied endpoint type & identifier
    func deleteRequest(for endpoint: Endpoint.Type, key: String, value: String) -> URLRequest? {
        return baseRequest(endpoint: endpoint.Endpoint, key: key, value: value, method: .delete)
    }

    /// Returns a `DELETE` URLRequest for the supplied URL
    func deleteRequest(for object: Endpoint, key: String, value: String) -> URLRequest? {
        return baseRequest(endpoint: object.endpoint, key: key, value: value, method: .delete)
    }
}
