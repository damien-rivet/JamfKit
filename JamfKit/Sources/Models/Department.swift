//
//  Department.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

/// Represents a physical department.
@objc(JMFKDepartment)
public final class Department: BaseObject { }

// MARK: - Protocols

extension Department: Endpoint, Creatable {

    // MARK: - Properties

    public var endpoint: String {
        return "departments"
    }
}
