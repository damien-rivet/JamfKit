//
//  Department.swift
//  JamfKit
//
//  Copyright © 2017 JamfKit. All rights reserved.
//

/// Represents a physical department.
public final class Department: BaseObject {

    // MARK: - Properties

    public override var description: String {
        return "[\(String(describing: Department.self))][\(identifier). \(self.name)]"
    }
}
