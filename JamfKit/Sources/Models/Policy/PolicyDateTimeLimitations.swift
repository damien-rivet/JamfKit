//
//  PolicyDateTimeLimitations.swift
//  JAMFKit
//
//  Copyright © 2018 JAMFKit. All rights reserved.
//

public final class PolicyDateTimeLimitations: Identifiable {

    // MARK: - Constants

    static let ActivationDateKey = "activation_date"
    static let ExpirationDateKey = "expiration_date"
    static let NoExecuteOnKey = "no_execute_on"
    static let NoExecuteStartKey = "no_execute_start"
    static let NoExecuteEndKey = "no_execute_end"

    // MARK: - Properties

    public var activationDate: PreciseDate?
    public var expirationDate: PreciseDate?
    public var noExecutionOn: [String: String]
    public var noExecutionStart: String
    public var noExecutionEnd: String

    // MARK: - Initialization

    public init?(json: [String: Any], node: String = "") {
        activationDate = PreciseDate(json: json, node: PolicyDateTimeLimitations.ActivationDateKey)
        expirationDate = PreciseDate(json: json, node: PolicyDateTimeLimitations.ExpirationDateKey)
        noExecutionOn = json[PolicyDateTimeLimitations.NoExecuteOnKey] as? [String: String] ?? [String: String]()
        noExecutionStart = json[PolicyDateTimeLimitations.NoExecuteStartKey] as? String ?? ""
        noExecutionEnd = json[PolicyDateTimeLimitations.NoExecuteEndKey] as? String ?? ""
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

        if noExecutionOn.count > 0 {
            json[PolicyDateTimeLimitations.NoExecuteOnKey] = noExecutionOn
        }

        json[PolicyDateTimeLimitations.NoExecuteStartKey] = noExecutionStart
        json[PolicyDateTimeLimitations.NoExecuteEndKey] = noExecutionEnd

        return json
    }
}
