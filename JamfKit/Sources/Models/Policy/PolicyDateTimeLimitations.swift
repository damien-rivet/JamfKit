//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

@objc(JMFKPolicyDateTimeLimitations)
public final class PolicyDateTimeLimitations: NSObject, Requestable {

    // MARK: - Constants

    static let ActivationDateKey = "activation_date"
    static let ExpirationDateKey = "expiration_date"
    static let NoExecuteOnKey = "no_execute_on"
    static let NoExecuteStartKey = "no_execute_start"
    static let NoExecuteEndKey = "no_execute_end"

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

    public init?(json: [String: Any], node: String = "") {
        activationDate = PreciseDate(json: json, node: PolicyDateTimeLimitations.ActivationDateKey)
        expirationDate = PreciseDate(json: json, node: PolicyDateTimeLimitations.ExpirationDateKey)
        noExecutionOn = json[PolicyDateTimeLimitations.NoExecuteOnKey] as? [String: String] ?? [String: String]()
        noExecutionStart = json[PolicyDateTimeLimitations.NoExecuteStartKey] as? String ?? ""
        noExecutionEnd = json[PolicyDateTimeLimitations.NoExecuteEndKey] as? String ?? ""
    }

    public override init() {
        super.init()
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
            json[PolicyDateTimeLimitations.NoExecuteOnKey] = noExecutionOn
        }

        json[PolicyDateTimeLimitations.NoExecuteStartKey] = noExecutionStart
        json[PolicyDateTimeLimitations.NoExecuteEndKey] = noExecutionEnd

        return json
    }
}
