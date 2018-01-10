//
//  Purchasing.swift
//  JamfKit
//
//  Copyright © 2017 JamfKit. All rights reserved.
//

import Foundation

@objc(JMFKComputerPurchasing)
public final class ComputerPurchasing: NSObject, Identifiable {

    // MARK: - Constants

    static let IsPurchasedKey = "is_purchased"
    static let IsLeasedKey = "is_leased"
    static let PoNumberKey = "po_number"
    static let VendorKey = "vendor"
    static let AppleCareIdentifierKey = "applecare_id"
    static let PurchasePriceKey = "purchase_price"
    static let PurchasingAccountKey = "purchasing_account"
    static let PurchasingContactKey = "purchasing_contact"
    static let PoDateKey = "po_date"
    static let WarrantyExpiresKey = "warranty_expires"
    static let LeaseExpiresKey = "lease_expires"
    static let LifeExpectancyKey = "life_expectancy"

    // MARK: - Properties

    @objc
    public var isPurchased: Bool

    @objc
    public var isLeased: Bool

    @objc
    public var poNumber: String

    @objc
    public var vendor: String

    @objc
    public var appleCareIdentifier: String

    @objc
    public var purchasePrice: String

    @objc
    public var purchasingAccount: String

    @objc
    public var purchasingContact: String

    @objc
    public var poDate: PreciseDate?

    @objc
    public var warrantyExpires: PreciseDate?

    @objc
    public var leaseExpires: PreciseDate?

    @objc
    public var lifeExpectancy: UInt

    // MARK: - Initialization

    public init?(json: [String: Any], node: String = "") {
        isPurchased = json[ComputerPurchasing.IsPurchasedKey] as? Bool ?? false
        isLeased = json[ComputerPurchasing.IsLeasedKey] as? Bool ?? false
        poNumber = json[ComputerPurchasing.PoNumberKey] as? String ?? ""
        vendor = json[ComputerPurchasing.VendorKey] as? String ?? ""
        appleCareIdentifier = json[ComputerPurchasing.AppleCareIdentifierKey] as? String ?? ""
        purchasePrice = json[ComputerPurchasing.PurchasePriceKey] as? String ?? ""
        purchasingAccount = json[ComputerPurchasing.PurchasingAccountKey] as? String ?? ""
        purchasingContact = json[ComputerPurchasing.PurchasingContactKey] as? String ?? ""
        poDate = PreciseDate(json: json, node: ComputerPurchasing.PoDateKey)
        warrantyExpires = PreciseDate(json: json, node: ComputerPurchasing.WarrantyExpiresKey)
        leaseExpires = PreciseDate(json: json, node: ComputerPurchasing.LeaseExpiresKey)
        lifeExpectancy = json[ComputerPurchasing.LifeExpectancyKey] as? UInt ?? 0
    }

    // MARK: - Functions

    public func toJSON() -> [String: Any] {
        var json = [String: Any]()

        json[ComputerPurchasing.IsPurchasedKey] = isPurchased
        json[ComputerPurchasing.IsLeasedKey] = isLeased
        json[ComputerPurchasing.PoNumberKey] = poNumber
        json[ComputerPurchasing.VendorKey] = vendor
        json[ComputerPurchasing.AppleCareIdentifierKey] = appleCareIdentifier
        json[ComputerPurchasing.PurchasePriceKey] = purchasePrice
        json[ComputerPurchasing.PurchasingAccountKey] = purchasingAccount
        json[ComputerPurchasing.PurchasingContactKey] = purchasingContact

        if let poDate = poDate {
            json.merge(poDate.toJSON()) { (_, new) in new }
        }

        if let warrantyExpires = warrantyExpires {
            json.merge(warrantyExpires.toJSON()) { (_, new) in new }
        }

        if let leaseExpires = leaseExpires {
            json.merge(leaseExpires.toJSON()) { (_, new) in new }
        }

        json[ComputerPurchasing.LifeExpectancyKey] = lifeExpectancy

        return json
    }
}
