//
//  Site.swift
//  JamfKit
//
//  Copyright © 2017 JamfKit. All rights reserved.
//

/// Represents a physical location (building, office, etc.).
public final class Site: BaseObject {

    // MARK: - Properties

    public override var description: String {
        return "[\(String(describing: Site.self))][\(identifier). \(self.name)]"
    }
}
