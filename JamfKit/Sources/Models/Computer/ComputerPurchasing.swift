//
//  Purchasing.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

@objc(JMFKComputerPurchasing)
public final class ComputerPurchasing: NSObject, Codable, Requestable {

    // MARK: - Constants

    enum CodingKeys: String, CodingKey {
        case isPurchased = "is_purchased"
        case isLeased = "is_leased"
        case poNumber = "po_number"
        case vendor = "vendor"
        case appleCareIdentifier = "applecare_id"
        case purchasePrice = "purchase_price"
        case purchasingAccount = "purchasing_account"
        case purchasingContact = "purchasing_contact"
        case poDate = "po_date"
        case warrantyExpires = "warranty_expires"
        case leaseExpires = "lease_expires"
        case lifeExpectancy = "life_expectancy"
    }

    // MARK: - Properties

    @objc
    public var isPurchased = false

    @objc
    public var isLeased = false

    @objc
    public var poNumber = ""

    @objc
    public var vendor = ""

    @objc
    public var appleCareIdentifier = ""

    @objc
    public var purchasePrice = ""

    @objc
    public var purchasingAccount = ""

    @objc
    public var purchasingContact = ""

    @objc
    public var poDate: PreciseDate?

    @objc
    public var warrantyExpires: PreciseDate?

    @objc
    public var leaseExpires: PreciseDate?

    @objc
    public var lifeExpectancy: UInt = 0

    // MARK: - Initialization

    public override init() {
        super.init()
    }

    public init?(json: [String: Any], node: String = "") {
        isPurchased = json[CodingKeys.isPurchased.rawValue] as? Bool ?? false
        isLeased = json[CodingKeys.isLeased.rawValue] as? Bool ?? false
        poNumber = json[CodingKeys.poNumber.rawValue] as? String ?? ""
        vendor = json[CodingKeys.vendor.rawValue] as? String ?? ""
        appleCareIdentifier = json[CodingKeys.appleCareIdentifier.rawValue] as? String ?? ""
        purchasePrice = json[CodingKeys.purchasePrice.rawValue] as? String ?? ""
        purchasingAccount = json[CodingKeys.purchasingAccount.rawValue] as? String ?? ""
        purchasingContact = json[CodingKeys.purchasingContact.rawValue] as? String ?? ""
        poDate = PreciseDate(json: json, node: CodingKeys.poDate.rawValue)
        warrantyExpires = PreciseDate(json: json, node: CodingKeys.warrantyExpires.rawValue)
        leaseExpires = PreciseDate(json: json, node: CodingKeys.leaseExpires.rawValue)
        lifeExpectancy = json[CodingKeys.lifeExpectancy.rawValue] as? UInt ?? 0
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        isPurchased = try container.decode(Bool.self, forKey: .isPurchased)
        isLeased = try container.decode(Bool.self, forKey: .isLeased)
        poNumber = try container.decode(String.self, forKey: .poNumber)
        vendor = try container.decode(String.self, forKey: .vendor)
        appleCareIdentifier = try container.decode(String.self, forKey: .appleCareIdentifier)
        purchasePrice = try container.decode(String.self, forKey: .purchasePrice)
        purchasingAccount = try container.decode(String.self, forKey: .purchasingAccount)
        purchasingContact = try container.decode(String.self, forKey: .purchasingContact)
        poDate = try container.decode(PreciseDate.self, forKey: .poDate)
        warrantyExpires = try container.decode(PreciseDate.self, forKey: .warrantyExpires)
        leaseExpires = try container.decode(PreciseDate.self, forKey: .leaseExpires)
        lifeExpectancy = try container.decode(UInt.self, forKey: .lifeExpectancy)
    }

    // MARK: - Functions

    public func toJSON() -> [String: Any] {
        var json = [String: Any]()

        json[CodingKeys.isPurchased.rawValue] = isPurchased
        json[CodingKeys.isLeased.rawValue] = isLeased
        json[CodingKeys.poNumber.rawValue] = poNumber
        json[CodingKeys.vendor.rawValue] = vendor
        json[CodingKeys.appleCareIdentifier.rawValue] = appleCareIdentifier
        json[CodingKeys.purchasePrice.rawValue] = purchasePrice
        json[CodingKeys.purchasingAccount.rawValue] = purchasingAccount
        json[CodingKeys.purchasingContact.rawValue] = purchasingContact

        if let poDate = poDate {
            json.merge(poDate.toJSON()) { (_, new) in new }
        }

        if let warrantyExpires = warrantyExpires {
            json.merge(warrantyExpires.toJSON()) { (_, new) in new }
        }

        if let leaseExpires = leaseExpires {
            json.merge(leaseExpires.toJSON()) { (_, new) in new }
        }

        json[CodingKeys.lifeExpectancy.rawValue] = lifeExpectancy

        return json
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(isPurchased, forKey: .isPurchased)
        try container.encode(isLeased, forKey: .isLeased)
        try container.encode(poNumber, forKey: .poNumber)
        try container.encode(vendor, forKey: .vendor)
        try container.encode(appleCareIdentifier, forKey: .appleCareIdentifier)
        try container.encode(purchasePrice, forKey: .purchasePrice)
        try container.encode(purchasingAccount, forKey: .purchasingAccount)
        try container.encode(purchasingContact, forKey: .purchasingContact)
        try container.encode(poDate, forKey: .poDate)
        try container.encode(warrantyExpires, forKey: .warrantyExpires)
        try container.encode(leaseExpires, forKey: .leaseExpires)
        try container.encode(lifeExpectancy, forKey: .lifeExpectancy)
    }
}
