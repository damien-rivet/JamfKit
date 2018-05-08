//
//  Location.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

@objc(JMFKComputerLocation)
public final class ComputerLocation: NSObject, Codable, Requestable {

    // MARK: - Constants

    enum CodingKeys: String, CodingKey {
        case username = "username"
        case realName = "real_name"
        case emailAddress = "email_address"
        case position = "position"
        case phoneNumber = "phone_number"
        case department = "department"
        case building = "building"
        case room = "room"
    }

    // MARK: - Properties

    @objc
    public var username = ""

    @objc
    public var realName = ""

    @objc
    public var emailAddress = ""

    @objc
    public var position = ""

    @objc
    public var phoneNumber = ""

    @objc
    public var department = ""

    @objc
    public var building = ""

    @objc
    public var room: UInt = 0

    // MARK: - Initialization

    public override init() {
        super.init()
    }

    public init?(json: [String: Any], node: String = "") {
        username = json[CodingKeys.username.rawValue] as? String ?? ""
        realName = json[CodingKeys.realName.rawValue] as? String ?? ""
        emailAddress = json[CodingKeys.emailAddress.rawValue] as? String ?? ""
        position = json[CodingKeys.position.rawValue] as? String ?? ""
        phoneNumber = json[CodingKeys.phoneNumber.rawValue] as? String ?? ""
        department = json[CodingKeys.department.rawValue] as? String ?? ""
        building = json[CodingKeys.building.rawValue] as? String ?? ""
        room = json[CodingKeys.room.rawValue] as? UInt ?? 0
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        username = try container.decode(String.self, forKey: .username)
        realName = try container.decode(String.self, forKey: .realName)
        emailAddress = try container.decode(String.self, forKey: .emailAddress)
        position = try container.decode(String.self, forKey: .position)
        phoneNumber = try container.decode(String.self, forKey: .phoneNumber)
        department = try container.decode(String.self, forKey: .department)
        building = try container.decode(String.self, forKey: .building)
        room = try container.decode(UInt.self, forKey: .room)
    }

    // MARK: - Functions

    public func toJSON() -> [String: Any] {
        var json = [String: Any]()

        json[CodingKeys.username.rawValue] = username
        json[CodingKeys.realName.rawValue] = realName
        json[CodingKeys.emailAddress.rawValue] = emailAddress
        json[CodingKeys.position.rawValue] = position
        json[CodingKeys.phoneNumber.rawValue] = phoneNumber
        json[CodingKeys.department.rawValue] = department
        json[CodingKeys.building.rawValue] = building
        json[CodingKeys.room.rawValue] = room

        return json
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(username, forKey: .username)
        try container.encode(realName, forKey: .realName)
        try container.encode(emailAddress, forKey: .emailAddress)
        try container.encode(position, forKey: .position)
        try container.encode(phoneNumber, forKey: .phoneNumber)
        try container.encode(department, forKey: .department)
        try container.encode(building, forKey: .building)
        try container.encode(room, forKey: .room)
    }
}
