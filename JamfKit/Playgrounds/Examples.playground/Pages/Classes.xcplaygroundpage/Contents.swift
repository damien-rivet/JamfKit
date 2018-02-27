//: [Previous](@previous)

//: # JamfKit - Requests

//: 1. Import JamfKit

import JamfKit

//: 2. Instantiate any class you need for your current usage

let building = Building(identifier: 12345, name: "Building")
let computer = Computer(identifier: 12345, name: "Computer")
let computerCommand = ComputerCommand(command: "Command", passcode: 12345)
let computerConfiguration = ComputerConfiguration(identifier: 12345, name: "Computer configuration")
let computerConfigurationProfile = ComputerConfigurationProfile(identifier: 12345, name: "Computer configuration profile")
let computerGroup = ComputerGroup(identifier: 12345, name: "Computer group")
let department = Department(identifier: 12345, name: "Department")
let directoryBinding = DirectoryBinding(identifier: 12345, name: "Directory binding")
let mobileDevice = MobileDevice(identifier: 12345, name: "Mobile device")
let mobileDeviceConfigurationProfile = MobileDeviceConfigurationProfile(identifier: 12345, name: "Mobile device configuration profile")
let mobileDeviceGroup = MobileDeviceGroup(identifier: 12345, name: "Mobile device group")
let netbootServer = NetbootServer(identifier: 12345, name: "Netboot server")
let networkSegment = NetworkSegment(identifier: 12345, name: "Network segment")
let package = Package(identifier: 12345, name: "Package")
let partition = Partition(name: "Partition")
let policy = Policy(identifier: 12345, name: "Policy")
let printer = Printer(identifier: 12345, name: "Printer")
let script = Script(identifier: 12345, name: "Script")
let site = Site(identifier: 12345, name: "Site")
let smtpServer = SMTPServer(host: "127.0.0.1", port: 1234)
let user = User(identifier: 12345, name: "User")

//: [Next](@next)
