//
//  Department.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

/// Represents a physical department.
@objc(JMFKDepartment)
public final class Department: BaseObject, Endpoint {

    // MARK: - Constants

    public static let Endpoint: String = "departments"
}

// MARK: - Creatable

extension Department: Creatable {

    public func create() -> URLRequest? {
        return self.createRequest()
    }
}

// MARK: - Protocols

extension Department: Readable, Updatable, Deletable { }
