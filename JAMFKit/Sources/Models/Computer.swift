//
//  Computer.swift
//  JAMFKit
//
//  Copyright © 2018 JAMFKit. All rights reserved.
//

public final class Computer: Hardware, CustomStringConvertible {

    // MARK: - Properties

    public var description: String {
        let baseDescription = "[\(String(describing: Computer.self))]"

        if let general = self.general {
            return "\(baseDescription)[\(general.identifier). \(general.name)]"
        }

        return baseDescription
    }
}
