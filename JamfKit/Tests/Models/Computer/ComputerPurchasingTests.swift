//
//  ComputerPurchasingTests.swift
//  JAMFKit
//
//  Copyright © 2018 JAMFKit. All rights reserved.
//

import XCTest

@testable import JAMFKit

class ComputerPurchasingTests: XCTestCase {

    // MARK: - Constants

    let subfolder = "Computer/"
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
        let payload = self.payload(for: "computer_purchasing", subfolder: subfolder)!

        let defaultPoDate = PreciseDate(json: payload, node: "po_date")
        let defaultWarrantyExpires = PreciseDate(json: payload, node: "warranty_expires")
        let defaultLeaseExpires = PreciseDate(json: payload, node: "lease_expires")

        let actualValue = ComputerPurchasing(json: payload)

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

    func testShouldInitializeFromEmptyJSON() {
        let actualValue = ComputerPurchasing(json: [String: Any]())

        XCTAssertNotNil(actualValue)
        XCTAssertEqual(actualValue?.isPurchased, false)
        XCTAssertEqual(actualValue?.isLeased, false)
        XCTAssertEqual(actualValue?.poNumber, "")
        XCTAssertEqual(actualValue?.vendor, "")
        XCTAssertEqual(actualValue?.appleCareIdentifier, "")
        XCTAssertEqual(actualValue?.purchasePrice, "")
        XCTAssertEqual(actualValue?.purchasingAccount, "")
        XCTAssertEqual(actualValue?.purchasingContact, "")
        XCTAssertEqual(actualValue?.lifeExpectancy, 0)
    }

    func testShouldEncodeToJSON() {
        let payload = self.payload(for: "computer_purchasing", subfolder: subfolder)!

        let actualValue = ComputerPurchasing(json: payload)
        let encodedObject = actualValue?.toJSON()

        XCTAssertNotNil(encodedObject)
        XCTAssertEqual(encodedObject?.count, 18)
        XCTAssertNotNil(encodedObject?[ComputerPurchasing.IsPurchasedKey])
        XCTAssertNotNil(encodedObject?[ComputerPurchasing.IsLeasedKey])
        XCTAssertNotNil(encodedObject?[ComputerPurchasing.PoNumberKey])
        XCTAssertNotNil(encodedObject?[ComputerPurchasing.VendorKey])
        XCTAssertNotNil(encodedObject?[ComputerPurchasing.AppleCareIdentifierKey])
        XCTAssertNotNil(encodedObject?[ComputerPurchasing.PurchasePriceKey])
        XCTAssertNotNil(encodedObject?[ComputerPurchasing.PurchasingAccountKey])
        XCTAssertNotNil(encodedObject?[ComputerPurchasing.PurchasingContactKey])
        XCTAssertNotNil(encodedObject?[ComputerPurchasing.PoDateKey])
        XCTAssertNotNil(encodedObject?[ComputerPurchasing.PoDateKey + "_epoch"])
        XCTAssertNotNil(encodedObject?[ComputerPurchasing.PoDateKey + "_utc"])
        XCTAssertNotNil(encodedObject?[ComputerPurchasing.WarrantyExpiresKey])
        XCTAssertNotNil(encodedObject?[ComputerPurchasing.WarrantyExpiresKey + "_epoch"])
        XCTAssertNotNil(encodedObject?[ComputerPurchasing.WarrantyExpiresKey + "_utc"])
        XCTAssertNotNil(encodedObject?[ComputerPurchasing.LeaseExpiresKey])
        XCTAssertNotNil(encodedObject?[ComputerPurchasing.LeaseExpiresKey + "_epoch"])
        XCTAssertNotNil(encodedObject?[ComputerPurchasing.LeaseExpiresKey + "_utc"])
        XCTAssertNotNil(encodedObject?[ComputerPurchasing.LifeExpectancyKey])
    }
}
