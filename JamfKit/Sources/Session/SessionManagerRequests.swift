//
//  JamfKitSessionManagerRequests.swift
//  JamfKit
//
//  Copyright © 2018 JamfKit. All rights reserved.
//

import Foundation

public enum HttpHeader: String {
    case accept = "Accept"
    case authorization = "Authorization"
    case contentType = "Content-Type"
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

    /// Returns a `CREATE` URLRequest for the supplied URL
    internal func createRequest(for url: URL) -> URLRequest {
        return authentifiedRequest(for: url, authorizationHeader: authorizationHeader, method: HttpMethod.post)
    }

    /// Returns a `READ` URLRequest for the supplied URL
    internal func readRequest(for url: URL) -> URLRequest {
        return authentifiedRequest(for: url, authorizationHeader: authorizationHeader, method: HttpMethod.get)
    }

    /// Returns an `UPDATE` URLRequest for the supplied URL
    internal func updateRequest(for url: URL) -> URLRequest {
        return authentifiedRequest(for: url, authorizationHeader: authorizationHeader, method: HttpMethod.put)
    }

    /// Returns a `DELETE` URLRequest for the supplied URL
    internal func deleteRequest(for url: URL) -> URLRequest {
        return authentifiedRequest(for: url, authorizationHeader: authorizationHeader, method: HttpMethod.delete)
    }
}
