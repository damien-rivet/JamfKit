//
//  HardwarePurchasingTests.swift
//  JAMFKit
//
//  Copyright © 2018 JAMFKit. All rights reserved.
//

import XCTest

@testable import JAMFKit

class HardwarePurchasingTests: XCTestCase {

    // MARK: - Constants

    let defaultIsPurchased = true
    let defaultIsLeased = true
    let defaultPoNumber = "po_number"
    let defaultVendor = "vendor"
    let defaultAppleCareIdentifier = "applecare_id"
    let defaultPurchasePrice = "purchase_price"
    let defaultPurchasingAccount = "purchasing_account"
    let defaultPurchasingContact = "purchasing_contact"
    let defaultLifeExpectancy: UInt = 0

    // MARK: - Tests

    func testShouldInitializeFromJSON() {
        let payload = self.payload(for: "hardware_purchasing")!

        let defaultPoDate = PreciseDate(json: payload, node: "po_date")
        let defaultWarrantyExpires = PreciseDate(json: payload, node: "warranty_expires")
        let defaultLeaseExpires = PreciseDate(json: payload, node: "lease_expires")

        let actualValue = HardwarePurchasing(json: payload)

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.isPurchased, defaultIsPurchased)
        XCTAssertEqual(actualValue?.isLeased, defaultIsLeased)
        XCTAssertEqual(actualValue?.poNumber, defaultPoNumber)
        XCTAssertEqual(actualValue?.vendor, defaultVendor)
        XCTAssertEqual(actualValue?.appleCareIdentifier, defaultAppleCareIdentifier)
        XCTAssertEqual(actualValue?.purchasePrice, defaultPurchasePrice)
        XCTAssertEqual(actualValue?.purchasingAccount, defaultPurchasingAccount)
        XCTAssertEqual(actualValue?.purchasingContact, defaultPurchasingContact)
        XCTAssertEqual(actualValue?.poDate?.date, defaultPoDate?.date)
        XCTAssertEqual(actualValue?.poDate?.epoch, defaultPoDate?.epoch)
        XCTAssertEqual(actualValue?.poDate?.dateUTC, defaultPoDate?.dateUTC)
        XCTAssertEqual(actualValue?.warrantyExpires?.date, defaultWarrantyExpires?.date)
        XCTAssertEqual(actualValue?.warrantyExpires?.epoch, defaultWarrantyExpires?.epoch)
        XCTAssertEqual(actualValue?.warrantyExpires?.dateUTC, defaultWarrantyExpires?.dateUTC)
        XCTAssertEqual(actualValue?.leaseExpires?.date, defaultLeaseExpires?.date)
        XCTAssertEqual(actualValue?.leaseExpires?.epoch, defaultLeaseExpires?.epoch)
        XCTAssertEqual(actualValue?.leaseExpires?.dateUTC, defaultLeaseExpires?.dateUTC)
        XCTAssertEqual(actualValue?.lifeExpectancy, defaultLifeExpectancy)
    }

    func testShouldEncodeToJSON() {
        let payload = self.payload(for: "hardware_purchasing")!

        let actualValue = HardwarePurchasing(json: payload)
        let encodedObject = actualValue?.toJSON()

        XCTAssertNotNil(encodedObject)
        XCTAssertEqual(encodedObject?.count, 18)
        XCTAssertNotNil(encodedObject?[HardwarePurchasing.IsPurchasedKey])
        XCTAssertNotNil(encodedObject?[HardwarePurchasing.IsLeasedKey])
        XCTAssertNotNil(encodedObject?[HardwarePurchasing.PoNumberKey])
        XCTAssertNotNil(encodedObject?[HardwarePurchasing.VendorKey])
        XCTAssertNotNil(encodedObject?[HardwarePurchasing.AppleCareIdentifierKey])
        XCTAssertNotNil(encodedObject?[HardwarePurchasing.PurchasePriceKey])
        XCTAssertNotNil(encodedObject?[HardwarePurchasing.PurchasingAccountKey])
        XCTAssertNotNil(encodedObject?[HardwarePurchasing.PurchasingContactKey])
        XCTAssertNotNil(encodedObject?[HardwarePurchasing.PoDateKey])
        XCTAssertNotNil(encodedObject?[HardwarePurchasing.PoDateKey + "_epoch"])
        XCTAssertNotNil(encodedObject?[HardwarePurchasing.PoDateKey + "_utc"])
        XCTAssertNotNil(encodedObject?[HardwarePurchasing.WarrantyExpiresKey])
        XCTAssertNotNil(encodedObject?[HardwarePurchasing.WarrantyExpiresKey + "_epoch"])
        XCTAssertNotNil(encodedObject?[HardwarePurchasing.WarrantyExpiresKey + "_utc"])
        XCTAssertNotNil(encodedObject?[HardwarePurchasing.LeaseExpiresKey])
        XCTAssertNotNil(encodedObject?[HardwarePurchasing.LeaseExpiresKey + "_epoch"])
        XCTAssertNotNil(encodedObject?[HardwarePurchasing.LeaseExpiresKey + "_utc"])
        XCTAssertNotNil(encodedObject?[HardwarePurchasing.LifeExpectancyKey])
    }
}
