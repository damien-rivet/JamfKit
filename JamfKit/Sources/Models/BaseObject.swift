//
//  Identifiable.swift
//  JamfKit
//
//  Copyright © 2017 JamfKit. All rights reserved.
//

import Foundation

/// Represents the common denominator between all the JSS objects which must contains at least an `identifier` and a `name` properties.
@objc
public class BaseObject: NSObject, Identifiable {

    // MARK: - Constants

    static let IdentifierKey = "id"
    static let NameKey = "name"

    // MARK: - Properties

    @objc
    public let identifier: UInt

    @objc
    public let name: String

    public override var description: String {
        return "[\(String(describing: type(of: self)))][\(identifier) - \(self.name)]"
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

    public func toJSON() -> [String: Any] {
        var json = [String: Any]()

        json[BaseObject.IdentifierKey] = identifier
        json[BaseObject.NameKey] = name

        return json
    }

    /**
     * Parse the supplied JSON dictionary and extract a list of elements matching the supplied type.
     *
     * @param json The JSON payload to extract the list of elements from.
     * @param singleNodeKey The string key used to identify a single element.
     *
     */
    internal static func parseElements<Element: Identifiable>(from json: [String: Any], nodeKey: String, singleNodeKey: String) -> [Element] {
        var elements = [Element]()

        guard let elementsNode = json[nodeKey] as? [[String: [String: Any]]] else {
            return elements
        }

        let newElements = elementsNode.map { $0[singleNodeKey] }.flatMap { rawElementNode -> Element? in
            guard let rawElement = rawElementNode else {
                return nil
            }

            return Element(json: rawElement, node: "")
        }

        elements.append(contentsOf: newElements)

        return elements
    }
}
