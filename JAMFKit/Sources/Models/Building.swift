//
//  Building.swift
//  JAMFKit
//
//  Created by Damien Rivet on 20.12.17.
//  Copyright © 2017 JAMFKit. All rights reserved.
//

public final class Building: BaseObject {

    // MARK: - Properties

    public override var description: String {
        return "[\(String(describing: Building.self))][\(identifier). \(self.name)]"
    }
}
