//
//  Location.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

@objc(JMFKComputerLocation)
public final class ComputerLocation: NSObject, Requestable {

    // MARK: - Constants

    static let UsernameKey = "username"
    static let RealNameKey = "real_name"
    static let EmailAddressKey = "email_address"
    static let PositionKey = "position"
    static let PhoneNumberKey = "phone_number"
    static let DepartementKey = "department"
    static let BuildingKey = "building"
    static let RoomKey = "room"

    // MARK: - Properties

    @objc
    public var username: String

    @objc
    public var realName: String

    @objc
    public var emailAddress: String

    @objc
    public var position: String

    @objc
    public var phoneNumber: String

    @objc
    public var department: String

    @objc
    public var building: String

    @objc
    public var room: UInt

    // MARK: - Initialization

    public init?(json: [String: Any], node: String = "") {
        username = json[ComputerLocation.UsernameKey] as? String ?? ""
        realName = json[ComputerLocation.RealNameKey] as? String ?? ""
        emailAddress = json[ComputerLocation.EmailAddressKey] as? String ?? ""
        position = json[ComputerLocation.PositionKey] as? String ?? ""
        phoneNumber = json[ComputerLocation.PhoneNumberKey] as? String ?? ""
        department = json[ComputerLocation.DepartementKey] as? String ?? ""
        building = json[ComputerLocation.BuildingKey] as? String ?? ""
        room = json[ComputerLocation.RoomKey] as? UInt ?? 0
    }

    // MARK: - Functions

    public func toJSON() -> [String: Any] {
        var json = [String: Any]()

        json[ComputerLocation.UsernameKey] = username
        json[ComputerLocation.RealNameKey] = realName
        json[ComputerLocation.EmailAddressKey] = emailAddress
        json[ComputerLocation.PositionKey] = position
        json[ComputerLocation.PhoneNumberKey] = phoneNumber
        json[ComputerLocation.DepartementKey] = department
        json[ComputerLocation.BuildingKey] = building
        json[ComputerLocation.RoomKey] = room

        return json
    }
}
