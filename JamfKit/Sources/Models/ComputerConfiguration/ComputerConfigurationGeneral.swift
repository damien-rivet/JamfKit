//
//  ComputerConfigurationGeneral.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

@objc(JMFKComputerConfigurationGeneral)
public final class ComputerConfigurationGeneral: BaseObject {

    // MARK: - Constants

    enum CodingKeys: String, CodingKey {
        case description = "description"
        case type = "type"
        case parent = "parent"
        case packages = "packages"
        case scripts = "scripts"
        case printers = "printers"
        case directoryBindings = "directory_bindings"
        case management = "management"
        case homepage = "homepage"
        case partitions = "partitions"
    }

    // MARK: - Properties

    @objc
    public var desc = ""

    @objc
    public var type = ""

    @objc
    public var parent = ""

    @objc
    public var packages = [Package]()

    @objc
    public var scripts = [Script]()

    @objc
    public var printers = [Printer]()

    @objc
    public var directoryBindings = [DirectoryBinding]()

    @objc
    public var management: ComputerConfigurationManagement?

    @objc
    public var homepage = ""

    @objc
    public var partitions = [Partition]()

    // MARK: - Initialization

    public override init?(identifier: UInt, name: String) {
        super.init(identifier: identifier, name: name)
    }

    public required init?(json: [String: Any], node: String = "") {
        desc = json[CodingKeys.description.rawValue] as? String ?? ""
        type = json[CodingKeys.type.rawValue] as? String ?? ""
        parent = json[CodingKeys.parent.rawValue] as? String ?? ""
        packages = BaseObject.parseElements(from: json, nodeKey: CodingKeys.packages.rawValue, singleNodeKey: "package")
        scripts = BaseObject.parseElements(from: json, nodeKey: CodingKeys.scripts.rawValue, singleNodeKey: "script")
        printers = BaseObject.parseElements(from: json, nodeKey: CodingKeys.printers.rawValue, singleNodeKey: "printer")
        directoryBindings = BaseObject.parseElements(from: json, nodeKey: CodingKeys.directoryBindings.rawValue, singleNodeKey: "directory_binding")
        management = ComputerConfigurationGeneral.parseManagement(json: json)
        homepage = json[CodingKeys.homepage.rawValue] as? String ?? ""
        partitions = BaseObject.parseElements(from: json, nodeKey: CodingKeys.partitions.rawValue, singleNodeKey: "partition")

        super.init(json: json)
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        desc = try container.decode(String.self, forKey: .description)
        type = try container.decode(String.self, forKey: .type)
        parent = try container.decode(String.self, forKey: .parent)
        packages = try container.decode([Package].self, forKey: .packages)
        scripts = try container.decode([Script].self, forKey: .scripts)
        printers = try container.decode([Printer].self, forKey: .printers)
        directoryBindings = try container.decode([DirectoryBinding].self, forKey: .directoryBindings)
        management = try container.decode(ComputerConfigurationManagement.self, forKey: .management)
        homepage = try container.decode(String.self, forKey: .homepage)
        partitions = try container.decode([Partition].self, forKey: .partitions)

        try super.init(from: decoder)
    }

    // MARK: - Functions

    public override func toJSON() -> [String: Any] {
        var json = super.toJSON()

        json[CodingKeys.description.rawValue] = desc
        json[CodingKeys.type.rawValue] = type
        json[CodingKeys.parent.rawValue] = parent

        if !packages.isEmpty {
            json[CodingKeys.packages.rawValue] = packages.map { package -> [String: [String: Any]] in
                return ["package": package.toJSON()]
            }
        }

        if !scripts.isEmpty {
            json[CodingKeys.scripts.rawValue] = scripts.map { script -> [String: [String: Any]] in
                return ["script": script.toJSON()]
            }
        }

        if !printers.isEmpty {
            json[CodingKeys.printers.rawValue] = printers.map { printer -> [String: [String: Any]] in
                return ["printer": printer.toJSON()]
            }
        }

        if !directoryBindings.isEmpty {
            json[CodingKeys.directoryBindings.rawValue] = directoryBindings.map { directoryBinding -> [String: [String: Any]] in
                return ["directory_binding": directoryBinding.toJSON()]
            }
        }

        json[CodingKeys.management.rawValue] = management?.toJSON()
        json[CodingKeys.homepage.rawValue] = homepage

        if !partitions.isEmpty {
            json[CodingKeys.partitions.rawValue] = partitions.map { partition -> [String: [String: Any]] in
                return ["parition": partition.toJSON()]
            }
        }

        return json
    }

    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(desc, forKey: .description)
        try container.encode(type, forKey: .type)
        try container.encode(parent, forKey: .parent)
        try container.encode(packages, forKey: .packages)
        try container.encode(scripts, forKey: .scripts)
        try container.encode(printers, forKey: .printers)
        try container.encode(directoryBindings, forKey: .directoryBindings)
        try container.encode(management, forKey: .management)
        try container.encode(homepage, forKey: .homepage)
        try container.encode(partitions, forKey: .partitions)

        try super.encode(to: encoder)
    }

    private static func parseManagement(json: [String: Any]) -> ComputerConfigurationManagement? {
        guard
            let rawManagement = json[CodingKeys.management.rawValue] as? [String: Any],
            let management = ComputerConfigurationManagement(json: rawManagement) else {
                return nil
        }

        return management
    }
}
