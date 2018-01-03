//
//  Purchasing.swift
//  JAMFKit
//
//  Copyright © 2017 JAMFKit. All rights reserved.
//

public final class HardwarePurchasing: Identifiable {

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

    public var isPurchased: Bool
    public var isLeased: Bool
    public var poNumber: String
    public var vendor: String
    public var appleCareIdentifier: String
    public var purchasePrice: String
    public var purchasingAccount: String
    public var purchasingContact: String
    public var poDate: PreciseDate?
    public var warrantyExpires: PreciseDate?
    public var leaseExpires: PreciseDate?
    public var lifeExpectancy: UInt

    // MARK: - Initialization

    init?(json: [String: Any], node: String = "") {
        isPurchased = json[HardwarePurchasing.IsPurchasedKey] as? Bool ?? false
        isLeased = json[HardwarePurchasing.IsLeasedKey] as? Bool ?? false
        poNumber = json[HardwarePurchasing.PoNumberKey] as? String ?? ""
        vendor = json[HardwarePurchasing.VendorKey] as? String ?? ""
        appleCareIdentifier = json[HardwarePurchasing.AppleCareIdentifierKey] as? String ?? ""
        purchasePrice = json[HardwarePurchasing.PurchasePriceKey] as? String ?? ""
        purchasingAccount = json[HardwarePurchasing.PurchasingAccountKey] as? String ?? ""
        purchasingContact = json[HardwarePurchasing.PurchasingContactKey] as? String ?? ""
        poDate = PreciseDate(json: json, node: HardwarePurchasing.PoDateKey)
        warrantyExpires = PreciseDate(json: json, node: HardwarePurchasing.WarrantyExpiresKey)
        leaseExpires = PreciseDate(json: json, node: HardwarePurchasing.LeaseExpiresKey)
        lifeExpectancy = json[HardwarePurchasing.LifeExpectancyKey] as? UInt ?? 0
    }

    // MARK: - Functions

    func toJSON() -> [String: Any] {
        var json = [String: Any]()

        json[HardwarePurchasing.IsPurchasedKey] = isPurchased
        json[HardwarePurchasing.IsLeasedKey] = isLeased
        json[HardwarePurchasing.PoNumberKey] = poNumber
        json[HardwarePurchasing.VendorKey] = vendor
        json[HardwarePurchasing.AppleCareIdentifierKey] = appleCareIdentifier
        json[HardwarePurchasing.PurchasePriceKey] = purchasePrice
        json[HardwarePurchasing.PurchasingAccountKey] = purchasingAccount
        json[HardwarePurchasing.PurchasingContactKey] = purchasingContact

        if let poDate = poDate {
            json.merge(poDate.toJSON()) { (_, new) in new }
        }

        if let warrantyExpires = warrantyExpires {
            json.merge(warrantyExpires.toJSON()) { (_, new) in new }
        }

        if let leaseExpires = leaseExpires {
            json.merge(leaseExpires.toJSON()) { (_, new) in new }
        }

        json[HardwarePurchasing.LifeExpectancyKey] = lifeExpectancy

        return json
    }
}
