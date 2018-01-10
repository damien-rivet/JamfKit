//
//  Building.swift
//  JamfKit
//
//  Copyright © 2017 JamfKit. All rights reserved.
//

/// Represents a physical building.
public final class Building: BaseObject {

    // MARK: - Properties

    public override var description: String {
        return "[\(String(describing: Building.self))][\(identifier). \(self.name)]"
    }
}
