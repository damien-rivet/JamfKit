//
//  PolicyDateTimeLimitations.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

@objc(JMFKPolicyDateTimeLimitations)
public final class PolicyDateTimeLimitations: NSObject, Codable, Requestable {

    // MARK: - Constants

    enum CodingKeys: String, CodingKey {
        case activationDate = "activation_date"
        case expirationDate = "expiration_date"
        case noExecuteOn = "no_execute_on"
        case noExecuteStart = "no_execute_start"
        case noExecuteEnd = "no_execute_end"
    }

    // MARK: - Properties

    @objc
    public var activationDate: PreciseDate?

    @objc
    public var expirationDate: PreciseDate?

    @objc
    public var noExecutionOn = [String: String]()

    @objc
    public var noExecutionStart = ""

    @objc
    public var noExecutionEnd = ""

    // MARK: - Initialization

    public override init() {
        super.init()
    }

    public init?(json: [String: Any], node: String = "") {
        activationDate = PreciseDate(json: json, node: CodingKeys.activationDate.rawValue)
        expirationDate = PreciseDate(json: json, node: CodingKeys.expirationDate.rawValue)
        noExecutionOn = json[CodingKeys.noExecuteOn.rawValue] as? [String: String] ?? [String: String]()
        noExecutionStart = json[CodingKeys.noExecuteStart.rawValue] as? String ?? ""
        noExecutionEnd = json[CodingKeys.noExecuteEnd.rawValue] as? String ?? ""
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        activationDate = try container.decode(PreciseDate.self, forKey: .activationDate)
        expirationDate = try container.decode(PreciseDate.self, forKey: .expirationDate)
        noExecutionOn = try container.decode([String: String].self, forKey: .noExecuteOn)
        noExecutionStart = try container.decode(String.self, forKey: .noExecuteStart)
        noExecutionEnd = try container.decode(String.self, forKey: .noExecuteEnd)
    }

    // MARK: - Functions

    public func toJSON() -> [String: Any] {
        var json = [String: Any]()

        if let activationDate = activationDate {
            json.merge(activationDate.toJSON()) { (_, new) in new }
        }

        if let expirationDate = expirationDate {
            json.merge(expirationDate.toJSON()) { (_, new) in new }
        }

        if !noExecutionOn.isEmpty {
            json[CodingKeys.noExecuteOn.rawValue] = noExecutionOn
        }

        json[CodingKeys.noExecuteStart.rawValue] = noExecutionStart
        json[CodingKeys.noExecuteEnd.rawValue] = noExecutionEnd

        return json
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(activationDate, forKey: .activationDate)
        try container.encode(expirationDate, forKey: .expirationDate)
        try container.encode(noExecutionOn, forKey: .noExecuteOn)
        try container.encode(noExecutionStart, forKey: .noExecuteStart)
        try container.encode(noExecutionEnd, forKey: .noExecuteEnd)
    }
}
