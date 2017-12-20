//
//  Department.swift
//  JAMFKit
//
//  Copyright © 2017 JAMFKit. All rights reserved.
//

public final class Department: BaseObject {

    // MARK: - Properties

    public override var description: String {
        return "[\(String(describing: Department.self))][\(identifier). \(self.name)]"
    }
}
