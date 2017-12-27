//
//  Site.swift
//  JamfKit
//
//  Copyright © 2017 JamfKit. All rights reserved.
//

public final class Site: BaseObject {

    // MARK: - Properties

    public override var description: String {
        return "[\(String(describing: Site.self))][\(identifier). \(self.name)]"
    }
}
