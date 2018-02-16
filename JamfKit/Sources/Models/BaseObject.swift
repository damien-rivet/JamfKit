//
//  BaseObject.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

/// Represents the common denominator between all the JSS objects which must contains at least an `identifier` and a `name` properties.
@objc
public class BaseObject: NSObject, Requestable, Identifiable {

    // MARK: - Constants

    enum CodingKeys: String {
        case identifier = "id"
        case name = "name"
    }

    // MARK: - Properties

    @objc
    public let identifier: UInt

    @objc
    public var name: String

    public override var description: String {
        return "[\(String(describing: type(of: self)))][\(identifier) - \(self.name)]"
    }

    // MARK: - Initialization

    @objc
    public required init?(json: [String: Any], node: String = "") {
        guard
            let identifier = json[BaseObject.CodingKeys.identifier.rawValue] as? UInt,
            let name = json[BaseObject.CodingKeys.name.rawValue] as? String
            else {
                return nil
        }

        self.identifier = identifier
        self.name = name
    }

    // MARK: - Functions

    @objc
    public func toJSON() -> [String: Any] {
        var json = [String: Any]()

        json[BaseObject.CodingKeys.identifier.rawValue] = identifier
        json[BaseObject.CodingKeys.name.rawValue] = name

        return json
    }

    /**
     * Parse the supplied JSON dictionary and extract a list of elements matching the supplied type.
     *
     * - Parameter json: The JSON payload to extract the list of elements from.
     * - Parameter nodeKey: The name of the main node to extract the element from.
     * - Parameter singleNodeKey: The string key used to identify a single element within the main node.
     *
     */
    internal static func parseElements<Element: Requestable>(from json: [String: Any], nodeKey: String, singleNodeKey: String) -> [Element] {
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
