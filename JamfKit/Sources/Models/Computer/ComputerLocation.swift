//
//  Location.swift
//  JamfKit
//
//  Copyright © 2017 JamfKit. All rights reserved.
//

public final class ComputerLocation: Identifiable {

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

    public var username: String
    public var realName: String
    public var emailAddress: String
    public var position: String
    public var phoneNumber: String
    public var department: String
    public var building: String
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
