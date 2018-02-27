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

    static let DescriptionKey = "description"
    static let TypeKey = "type"
    static let ParentKey = "parent"
    static let PackagesKey = "packages"
    static let ScriptsKey = "scripts"
    static let PrintersKey = "printers"
    static let DirectoryBindingsKey = "directory_bindings"
    static let ManagementKey = "management"
    static let HomepageKey = "homepage"
    static let PartitionsKey = "partitions"

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

    public required init?(json: [String: Any], node: String = "") {
        desc = json[ComputerConfigurationGeneral.DescriptionKey] as? String ?? ""
        type = json[ComputerConfigurationGeneral.TypeKey] as? String ?? ""
        parent = json[ComputerConfigurationGeneral.ParentKey] as? String ?? ""
        packages = ComputerConfigurationGeneral.parsePackages(json: json)
        scripts = ComputerConfigurationGeneral.parseScripts(json: json)
        printers = ComputerConfigurationGeneral.parsePrinters(json: json)
        directoryBindings = ComputerConfigurationGeneral.parseDirectoryBindings(json: json)
        management = ComputerConfigurationGeneral.parseManagement(json: json)
        homepage = json[ComputerConfigurationGeneral.HomepageKey] as? String ?? ""
        partitions = ComputerConfigurationGeneral.parsePartitions(json: json)

        super.init(json: json)
    }

    public override init?(identifier: UInt, name: String) {
        super.init(identifier: identifier, name: name)
    }

    // MARK: - Functions

    public override func toJSON() -> [String: Any] {
        var json = super.toJSON()

        json[ComputerConfigurationGeneral.DescriptionKey] = desc
        json[ComputerConfigurationGeneral.TypeKey] = type
        json[ComputerConfigurationGeneral.ParentKey] = parent

        if !packages.isEmpty {
            json[ComputerConfigurationGeneral.PackagesKey] = packages.map { package -> [String: [String: Any]] in
                return ["package": package.toJSON()]
            }
        }

        if !scripts.isEmpty {
            json[ComputerConfigurationGeneral.ScriptsKey] = scripts.map { script -> [String: [String: Any]] in
                return ["script": script.toJSON()]
            }
        }

        if !printers.isEmpty {
            json[ComputerConfigurationGeneral.PrintersKey] = printers.map { printer -> [String: [String: Any]] in
                return ["printer": printer.toJSON()]
            }
        }

        if !directoryBindings.isEmpty {
            json[ComputerConfigurationGeneral.DirectoryBindingsKey] = directoryBindings.map { directoryBinding -> [String: [String: Any]] in
                return ["directory_binding": directoryBinding.toJSON()]
            }
        }

        json[ComputerConfigurationGeneral.ManagementKey] = management?.toJSON()
        json[ComputerConfigurationGeneral.HomepageKey] = homepage

        if !partitions.isEmpty {
            json[ComputerConfigurationGeneral.PartitionsKey] = partitions.map { partition -> [String: [String: Any]] in
                return ["parition": partition.toJSON()]
            }
        }

        return json
    }

    private static func parsePackages(json: [String: Any]) -> [Package] {
        return BaseObject.parseElements(from: json, nodeKey: ComputerConfigurationGeneral.PackagesKey, singleNodeKey: "package")
    }

    private static func parseScripts(json: [String: Any]) -> [Script] {
        return BaseObject.parseElements(from: json, nodeKey: ComputerConfigurationGeneral.ScriptsKey, singleNodeKey: "script")
    }

    private static func parsePrinters(json: [String: Any]) -> [Printer] {
        return BaseObject.parseElements(from: json, nodeKey: ComputerConfigurationGeneral.PrintersKey, singleNodeKey: "printer")
    }

    private static func parseDirectoryBindings(json: [String: Any]) -> [DirectoryBinding] {
        return BaseObject.parseElements(from: json, nodeKey: ComputerConfigurationGeneral.DirectoryBindingsKey, singleNodeKey: "directory_binding")
    }

    private static func parseManagement(json: [String: Any]) -> ComputerConfigurationManagement? {
        guard
            let rawManagement = json[ComputerConfigurationGeneral.ManagementKey] as? [String: Any],
            let management = ComputerConfigurationManagement(json: rawManagement) else {
                return nil
        }

        return management
    }

    private static func parsePartitions(json: [String: Any]) -> [Partition] {
        return BaseObject.parseElements(from: json, nodeKey: ComputerConfigurationGeneral.PartitionsKey, singleNodeKey: "partition")
    }
}
