//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

import XCTest

extension XCTestCase {

    // MARK: - Functions

    func payload(for jsonFile: String, subfolder: String = "") -> [String: AnyObject]? {
        let bundle = Bundle(for: type(of: self)).url(forResource: "Mocks", withExtension: "bundle")!
        let urlBundle = Bundle(url: bundle)!

        if let data = try? Data(contentsOf: urlBundle.url(forResource: subfolder + jsonFile, withExtension: "json")!) {
            if let payload = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyObject] {
                return payload
            }
        }

        return [String: AnyObject]()
    }
}
