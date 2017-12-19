//
//  Site.swift
//  JAMFKit
//
//  Created by Damien Rivet on 02.11.17.
//  Copyright © 2017 JAMFKit. All rights reserved.
//

public final class Site: BaseObject {

    // MARK: - Properties

    public override var description: String {
        return "[\(String(describing: Site.self))][\(identifier). \(self.name)]"
    }
}
