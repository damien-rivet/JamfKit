//
//  HostManager.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

public enum HttpMethod: String {
    case get = "GET"
    case put = "PUT"
    case post = "POST"
    case delete = "DELETE"
}

@objc(JMFKSessionManager)
public final class SessionManager: NSObject {

    // MARK: - Properties

    public static let instance = SessionManager()

    private(set) var host: URL?
    var username: String?
    var password: String?
    var authorizationHeader = ""

    // MARK: - Initialization

    private override init() { }

    // MARK: - Functions

    /**
     * Configure this instance of session manager with the supplied parameters.
     *
     * - Parameter host: The address of the JSS API server (e.g. http://my-jss.domain.com).
     * - Parameter username: The username that will be used to authenticate requests against the JSS host.
     * - Parameter password: The password that will be used to authenticate requests against the JSS host.
     * - Throws: `SessionManagerErrorCode.invalidURL` if the supplied address for the JSS host is not valid URL.
     */
    public func configure(for host: String, username: String, password: String) throws {
        guard let url = URL(string: host) else {
            throw SessionManagerError(code: .invalidURL)
        }

        try self.configure(for: url, username: username, password: password)
    }

    /**
     * Configure this instance of session manager with the supplied parameters.
     *
     * - Parameter host: The URL of the JSS API server (e.g. http://my-jss.domain.com).
     * - Parameter username: The username that will be used to authenticate requests against the JSS host.
     * - Parameter password: The password that will be used to authenticate requests against the JSS host.
     *
     * - Throws: `SessionManagerErrorCode.invalidCredentials` if the supplied credentials are not valid or if the authorization header can't be computed.
     */
    public func configure(for host: URL, username: String, password: String) throws {
        guard !username.isEmpty, !password.isEmpty else {
            throw SessionManagerError(code: .invalidCredentials)
        }

        self.host = host
        self.username = username
        self.password = password
        self.authorizationHeader = SessionManager.computeAuthorizationHeader(from: username, password: password)
    }

    /// Clear the current configuration of the session manager.
    public func clearConfiguration() {
        self.host = nil
        self.username = nil
        self.password = nil
        self.authorizationHeader = ""
    }

    /**
     * Perform a connectivity check againt the current configuration of the session manager.
     *
     * - Parameter completionBlock: The block that will be executed after the connectivity check is completed.
     *
     * - Throws: `SessionManagerErrorCode.incompleteHostConfiguration` if the configuration is not fully specified.
     */
    public func performConnectivityCheck(completion completionBlock: @escaping (Bool) -> Void) throws {
        guard let url = host else {
            throw SessionManagerError(code: .incompleteHostConfiguration)
        }

        URLSession.shared.dataTask(with: readRequest(for: url)) { (_, response, error) in
            guard error == nil else {
                completionBlock(false)
                return
            }

            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completionBlock(false)
                return
            }

            completionBlock(true)
        }.resume()
    }
}
