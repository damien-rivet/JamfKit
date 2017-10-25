//
//  Identifiable.swift
//  JAMFKit
//
//  Created by Damien Rivet on 25.10.17.
//  Copyright © 2017 JAMFKit. All rights reserved.
//

public class JAMFObject: Identifiable {

    // MARK: - Properties

    let identifier: UInt
    let name: String

    // MARK: - Initialization

    public required init?(json: [String: Any]) {
        guard
            let identifier = json["identifier"] as? UInt,
            let name = json["name"] as? String
            else {
                return nil
        }

        self.identifier = identifier
        self.name = name
    }

    // MARK: - Functions

    func toJSON() -> [String : Any] {
        var json = [String: Any]()

        json["identifier"] = identifier
        json["name"] = name

        return json
    }
}
