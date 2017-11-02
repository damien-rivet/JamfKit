//
//  Site.swift
//  JAMFKit
//
//  Created by Damien Rivet on 02.11.17.
//  Copyright © 2017 JAMFKit. All rights reserved.
//

public final class Site: BaseObject {

    public override var description: String {
        return "[\(String(describing: Site.self))][\(identifier). \(self.name)]"
    }

    // MARK: - Initialization

    public required init?(json: [String : Any]) {
        super.init(json: json)
    }
}
