//
//  JSONHelper.swift
//  JAMFKit
//
//  Copyright © 2017 JAMFKit. All rights reserved.
//

import XCTest

extension XCTestCase {

    // MARK: - Functions

    func payload(for jsonFile: String) -> [String: AnyObject]? {
        let bundle = Bundle(for: type(of: self)).url(forResource: "Mocks", withExtension: "bundle")!
        let urlBundle = Bundle(url: bundle)!

        if let data = try? Data(contentsOf: urlBundle.url(forResource: jsonFile, withExtension: "json")!) {
            if let payload = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyObject] {
                return payload
            }
        }

        return [String: AnyObject]()
    }
}
