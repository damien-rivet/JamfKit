//
//  NetworkSegment.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

/// Represents a physical network segment, contains information about the segment and it's configuration.
@objc(JMFKNetworkSegment)
public final class NetworkSegment: BaseObject {

    // MARK: - Constants

    enum CodingKeys: String, CodingKey {
        case startingAddress = "starting_address"
        case endingAddress = "ending_address"
        case distributionServer = "distribution_server"
        case distributionPoint = "distribution_point"
        case url = "url"
        case netbootServer = "netboot_server"
        case swuServer = "swu_server"
        case building = "building"
        case department = "department"
        case overrideBuildings = "override_buildings"
        case overrideDepartments = "override_departments"
    }

    // MARK: - Properties

    @objc
    public var startingAddress = ""

    @objc
    public var endingAddress = ""

    @objc
    public var distributionServer = ""

    @objc
    public var distributionPoint = ""

    @objc
    public var url = ""

    @objc
    public var netbootServer = ""

    @objc
    public var swuServer = ""

    @objc
    public var building = ""

    @objc
    public var department = ""

    @objc
    public var overridesBuildings = false

    @objc
    public var overridesDepartments = false

    // MARK: - Initialization

    public override init?(identifier: UInt, name: String) {
        super.init(identifier: identifier, name: name)
    }

    public required init?(json: [String: Any], node: String = "") {
        startingAddress = json[CodingKeys.startingAddress.rawValue] as? String ?? ""
        endingAddress = json[CodingKeys.endingAddress.rawValue] as? String ?? ""
        distributionServer = json[CodingKeys.distributionServer.rawValue] as? String ?? ""
        distributionPoint = json[CodingKeys.distributionPoint.rawValue] as? String ?? ""
        url = json[CodingKeys.url.rawValue] as? String ?? ""
        netbootServer = json[CodingKeys.netbootServer.rawValue] as? String ?? ""
        swuServer = json[CodingKeys.swuServer.rawValue] as? String ?? ""
        building = json[CodingKeys.building.rawValue] as? String ?? ""
        department = json[CodingKeys.department.rawValue] as? String ?? ""
        overridesBuildings = json[CodingKeys.overrideBuildings.rawValue] as? Bool ?? false
        overridesDepartments = json[CodingKeys.overrideDepartments.rawValue] as? Bool ?? false

        super.init(json: json)
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        startingAddress = try container.decode(String.self, forKey: .startingAddress)
        endingAddress = try container.decode(String.self, forKey: .endingAddress)
        distributionServer = try container.decode(String.self, forKey: .distributionServer)
        distributionPoint = try container.decode(String.self, forKey: .distributionPoint)
        url = try container.decode(String.self, forKey: .url)
        netbootServer = try container.decode(String.self, forKey: .netbootServer)
        swuServer = try container.decode(String.self, forKey: .swuServer)
        building = try container.decode(String.self, forKey: .building)
        department = try container.decode(String.self, forKey: .department)
        overridesBuildings = try container.decode(Bool.self, forKey: .overrideBuildings)
        overridesDepartments = try container.decode(Bool.self, forKey: .overrideDepartments)

        try super.init(from: decoder)
    }

    // MARK: - Functions

    public override func toJSON() -> [String: Any] {
        var json = super.toJSON()

        json[CodingKeys.startingAddress.rawValue] = startingAddress
        json[CodingKeys.endingAddress.rawValue] = endingAddress
        json[CodingKeys.distributionServer.rawValue] = distributionServer
        json[CodingKeys.distributionPoint.rawValue] = distributionPoint
        json[CodingKeys.url.rawValue] = url
        json[CodingKeys.netbootServer.rawValue] = netbootServer
        json[CodingKeys.swuServer.rawValue] = swuServer
        json[CodingKeys.building.rawValue] = building
        json[CodingKeys.department.rawValue] = department
        json[CodingKeys.overrideBuildings.rawValue] = overridesBuildings
        json[CodingKeys.overrideDepartments.rawValue] = overridesDepartments

        return json
    }

    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(startingAddress, forKey: .startingAddress)
        try container.encode(endingAddress, forKey: .endingAddress)
        try container.encode(distributionServer, forKey: .distributionServer)
        try container.encode(distributionPoint, forKey: .distributionPoint)
        try container.encode(url, forKey: .url)
        try container.encode(netbootServer, forKey: .netbootServer)
        try container.encode(swuServer, forKey: .swuServer)
        try container.encode(building, forKey: .building)
        try container.encode(department, forKey: .department)
        try container.encode(overridesBuildings, forKey: .overrideBuildings)
        try container.encode(overridesDepartments, forKey: .overrideDepartments)

        try super.encode(to: encoder)
    }
}
