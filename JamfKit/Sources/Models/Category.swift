//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

@objc(JMFKCategory)
public final class Category: BaseObject {

    // MARK: - Constants

    static let PriorityKey = "priority"

    // MARK: - Properties

    @objc
    public var priority: UInt = 0

    // MARK: - Initialization

    public required init?(json: [String: Any], node: String = "") {
        guard let priority = json[Category.PriorityKey] as? UInt else {
            return nil
        }

        self.priority = priority

        super.init(json: json)
    }

    public override init?(identifier: UInt, name: String) {
        super.init(identifier: identifier, name: name)
    }

    // MARK: - Functions

    public override func toJSON() -> [String: Any] {
        var json = super.toJSON()

        json[Category.PriorityKey] = priority

        return json
    }
}
