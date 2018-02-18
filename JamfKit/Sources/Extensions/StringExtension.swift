//
//  StringExtension.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

internal extension String {

    // MARK: - Functions

    /// Returns the String without useless characters
    func asCleanedKey() -> String {
        return self.replacingOccurrences(of: "_", with: "")
    }
}
