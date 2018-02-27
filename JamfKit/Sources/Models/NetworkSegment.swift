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

    static let StartingAddressKey = "starting_address"
    static let EndingAddressKey = "ending_address"
    static let DistributionServerKey = "distribution_server"
    static let DistributionPointKey = "distribution_point"
    static let UrlKey = "url"
    static let NetbootServerKey = "netboot_server"
    static let SwuServerKey = "swu_server"
    static let BuildingKey = "building"
    static let DepartmentKey = "department"
    static let OverrideBuildingsKey = "override_buildings"
    static let OverrideDepartmentsKey = "override_departments"

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

    public required init?(json: [String: Any], node: String = "") {
        startingAddress = json[NetworkSegment.StartingAddressKey] as? String ?? ""
        endingAddress = json[NetworkSegment.EndingAddressKey] as? String ?? ""
        distributionServer = json[NetworkSegment.DistributionServerKey] as? String ?? ""
        distributionPoint = json[NetworkSegment.DistributionPointKey] as? String ?? ""
        url = json[NetworkSegment.UrlKey] as? String ?? ""
        netbootServer = json[NetworkSegment.NetbootServerKey] as? String ?? ""
        swuServer = json[NetworkSegment.SwuServerKey] as? String ?? ""
        building = json[NetworkSegment.BuildingKey] as? String ?? ""
        department = json[NetworkSegment.DepartmentKey] as? String ?? ""
        overridesBuildings = json[NetworkSegment.OverrideBuildingsKey] as? Bool ?? false
        overridesDepartments = json[NetworkSegment.OverrideDepartmentsKey] as? Bool ?? false

        super.init(json: json)
    }

    public override init?(identifier: UInt, name: String) {
        super.init(identifier: identifier, name: name)
    }

    // MARK: - Functions

    public override func toJSON() -> [String: Any] {
        var json = super.toJSON()

        json[NetworkSegment.StartingAddressKey] = startingAddress
        json[NetworkSegment.EndingAddressKey] = endingAddress
        json[NetworkSegment.DistributionServerKey] = distributionServer
        json[NetworkSegment.DistributionPointKey] = distributionPoint
        json[NetworkSegment.UrlKey] = url
        json[NetworkSegment.NetbootServerKey] = netbootServer
        json[NetworkSegment.SwuServerKey] = swuServer
        json[NetworkSegment.BuildingKey] = building
        json[NetworkSegment.DepartmentKey] = department
        json[NetworkSegment.OverrideBuildingsKey] = overridesBuildings
        json[NetworkSegment.OverrideDepartmentsKey] = overridesDepartments

        return json
    }
}
