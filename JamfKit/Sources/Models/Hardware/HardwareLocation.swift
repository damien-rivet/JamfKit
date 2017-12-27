//
//  Location.swift
//  JamfKit
//
//  Copyright © 2017 JamfKit. All rights reserved.
//

public final class HardwareLocation: Identifiable {

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

    public var username: String?
    public var realName: String?
    public var emailAddress: String?
    public var position: String?
    public var phoneNumber: String?
    public var department: String?
    public var building: String?
    public var room: UInt?

    // MARK: - Initialization

    init?(json: [String : Any], node: String = "") {
        username = json[HardwareLocation.UsernameKey] as? String
        realName = json[HardwareLocation.RealNameKey] as? String
        emailAddress = json[HardwareLocation.EmailAddressKey] as? String
        position = json[HardwareLocation.PositionKey] as? String
        phoneNumber = json[HardwareLocation.PhoneNumberKey] as? String
        department = json[HardwareLocation.DepartementKey] as? String
        building = json[HardwareLocation.BuildingKey] as? String
        room = json[HardwareLocation.RoomKey] as? UInt
    }

    // MARK: - Functions

    func toJSON() -> [String : Any] {
        var json = [String: Any]()

        json[HardwareLocation.UsernameKey] = username
        json[HardwareLocation.RealNameKey] = realName
        json[HardwareLocation.EmailAddressKey] = emailAddress
        json[HardwareLocation.PositionKey] = position
        json[HardwareLocation.PhoneNumberKey] = phoneNumber
        json[HardwareLocation.DepartementKey] = department
        json[HardwareLocation.BuildingKey] = building
        json[HardwareLocation.RoomKey] = room

        return json
    }
}
