//
//  Identifiable.swift
//  JAMFKit
//
//  Created by Damien Rivet on 25.10.17.
//  Copyright © 2017 JAMFKit. All rights reserved.
//

public class BaseObject: Identifiable, CustomStringConvertible {

    // MARK: - Constants

    static let IdentifierKey = "id"
    static let NameKey = "name"

    // MARK: - Properties

    let identifier: UInt
    let name: String

    public var description: String {
        return "[\(identifier). \(self.name)]"
    }

    // MARK: - Initialization

    public required init?(json: [String: Any], node: String = "") {
        guard
            let identifier = json[BaseObject.IdentifierKey] as? UInt,
            let name = json[BaseObject.NameKey] as? String
            else {
                return nil
        }

        self.identifier = identifier
        self.name = name
    }

    // MARK: - Functions

    func toJSON() -> [String : Any] {
        var json = [String: Any]()

        json[BaseObject.IdentifierKey] = identifier
        json[BaseObject.NameKey] = name

        return json
    }
}
