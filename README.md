# JamfKit #

<p align="center"><img src="Assets/JamfKit_256.png" alt="JamfKit"></p>

![Swift](https://img.shields.io/badge/Swift-4.1+-lightgrey.svg?style=flat-square)
![iOS](https://img.shields.io/badge/iOS-9+-lightgrey.svg?style=flat-square)
![macOS](https://img.shields.io/badge/macOS-10.10+-lightgrey.svg?style=flat-square)

[![Travis branch](https://img.shields.io/travis/Ethenyl/JamfKit/master.svg?style=flat-square)](https://travis-ci.org/Ethenyl/JamfKit)
[![Codecov](https://img.shields.io/codecov/c/github/Ethenyl/JamfKit.svg?style=flat-square)](https://codecov.io/gh/Ethenyl/JamfKit)
[![Carthage compatible](https://img.shields.io/badge/carthage-compatible-4BC51D.svg?style=flat-square)](https://github.com/Carthage/Carthage)
[![CocoaPods](https://img.shields.io/cocoapods/v/JAMFKit.svg?style=flat-square)](https://cocoapods.org/pods/JamfKit)

[![GitHub license](https://img.shields.io/github/license/Ethenyl/JamfKit.svg?style=flat-square)](https://github.com/Ethenyl/JamfKit/blob/master/LICENSE)

`JamfKit` is an iOS / macOS framework to communicate with the JSS API offered by any Jamf host.

## Summary ##

- [Features](#features)
- [Installation](#installation)
  - [Carthage](#carthage)
  - [CocoaPods](#cocoapods)
- [Architecture](#architecture)
  - [Protocols](#protocols)
  - [Classes](#classes)
- [Usage](#usage)
  - [Getting started](#getting-started)
- [Contributing](#contributing)
- [Code of conduct](#code-of-conduct)
- [FAQ](#faq)
- [Credits](#credits)
- [License](#license)

## Features ##

- [x] Includes JSON encoding / decoding support for most of the JSS objects
- [x] Includes Objective-C support
- [x] Includes Swift 4 support
- [x] Includes ready-for-consumption CRUD `URLRequest` for JSS endpoints
- [x] Includes demonstration playgrounds for class handling or request generation

## Installation ##

### Carthage ###

To integrate `JamfKit` into your project, add the following line in your `Cartfile`:

```ogdl
github "Ethenyl/JamfKit"
```

Then run the following command:

`$ carthage update`

### Cocoapods ###

To integrate `JamfKit` into your project, add the following line in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'JAMFKit'
end
```

Then run the following command:

`$ pod install`

## Architecture ##

### Protocols ###

|Protocol|Description|
|-----|-----|
|`Endpoint`|Represents any JSS object that is matched by a JSS endpoint.|
|`Identifiable`|Represents any JSS object that can be identified (either by ID or by name).|
|`Requestable`|Represents an object that can be used to perform requests with any JSS endpoint.|
|`Subset`|Represents any JSS object that contains a general object that can identify it.|

#### Requestable conformance ####

 The class that conform to `Requestable` exposes the following elements:

- An failable initializer that takes a JSON payload and return the instantiated object
- A function to return the JSON payload that represents the instance of the object

### Classes ###

|Class|Desscription|
|-----|-----|
|`BaseObject`|Represents the common denominator between most of the JSS objects which must contains at least an `identifier` and a `name` properties.|
|`Building`|Represents a physical building.|
|`Computer`|Represents a computer managed by Jamf, contains the general / location / purchasing information about the hardware.|
|`ComputerCommand`|Represents a logical command that can be executed on any hardware element manageg by Jamf.|
|`ComputerGroup`|Represents a group of computers managed by Jamf, contains grouping information.|
|`Department`|Represents a physical department.|
|`DirectoryBinding`|Represents a logical binding between a computer and an active directory user.|
|`MobileDevice`|Represents a mobile device managed by Jamf, contains the general information about the device.|
|`MobileDeviceGroup`|Represents a group of mobile devices managed by Jamf, contains grouping information.|
|`NetbootServer`|Represents a physical netboot server, contains information about the server and it's configuration.|
|`NetworkSegment`|Represents a physical network segment, contains information about the segment and it's configuration.|
|`Package`|Represents a logical application package, contains information about the application requirements and capabilities.|
|`Partition`|Represents a logical partition for an hard drive installed inside an hardware element managed by Jamf.|
|`Policy`|Reprents as logical policy that can be applied to any hardware element managed by Jamf.|
|`PreciseDate`|Represents a logical date within JSS api, contains 3 properties, the date itself, an epoch variant of the date and an UTC version of the date.|
|`Printer`|Represents a physical printer, contains information about the printer and it's configuration.|
|`Script`|Represents a logical script that can be executed on one (or more) machine managed by Jamf.|
|`Site`|Represents a physical location (building, office, etc.).|
|`SMTPServer`|Represents the physical SMTP server configuration.|
|`User`|Represents a Jamf user and contains the identification properties that are required to contact the actual user and identify the hardware devices assigned to him / her.|

## Usage ##

### Getting started ###

#### Playgrounds ####

To get a quick look on how you can use `JamfKit` in your `Jamf` related features, you can check the `Playgrounds` included within the workspace.

Also check the unit tests, they should cover most of your needs.

#### Models ####

Most of the classes can be initialized with the bare minimul values, all the properties are then available for modification.

#### Requests ####

By adhering to the different CRUD protocols (`Creatable`, `Readable`, `Updatable` & `Deletable`), most of the JSS objects listed above are capable of supplying varying `URLRequest` that should fit any needs.

You'll find below the basic functions to get `URLRequest`:

|Function|Type|HTTP Method|Example|
|-----|:-----:|:-----:|-----|
|`create()`|`instance`|`POST`|http://jamf.com/jss/objects/1|
|`readAll()`|`static`|`GET`|http://jamf.com/jss/objects|
|`read(identifier:)`|`static`|`GET`|http://jamf.com/jss/objects/1|
|`read()`|`instance`|`GET`|http://jamf.com/jss/objects/1|
|`update()`|`instance`|`PUT`|http://jamf.com/jss/objects/1|
|`delete(identifier:)`|`static`|`DELETE`|http://jamf.com/jss/objects/1|
|`delete()`|`instance`|`DELETE`|http://jamf.com/jss/objects/1|

Some objects will offer variants of those requests, like `MobileDevice` with `readWithName()` or `readWithSerialNumber()` (with both `static` and `instance` variants).

## Contributing ##

So, you want to help improve `JamfKit`? That's great! Any useful contribution is welcome!

Check [CONTRIBUTING](https://github.com/Ethenyl/JamfKit/blob/master/CONTRIBUTING.md) for more details on how you can contribute to `JamfKit`.

## Code of conduct ##

Any contributions (issues, pull requests, comments, etc.) to `JamfKit` are more than welcome.

But before making any contribution, please make sure that you follow the [CODE OF CONDUCT](https://github.com/Ethenyl/JamfKit/blob/master/CODE_OF_CONDUCT.md).

Otherwise, there's a great chance that your contribution will be removed / blocked / hidden.

## FAQ ##

None for the moment.

## Credits ##

`JamfKit` is owned and maintained by [Ethenyl](https://github.com/Ethenyl).

You can join the list by contributing to the repository.

## License ##

`JamfKit` is released under the MIT license. See [LICENSE](https://github.com/Ethenyl/JamfKit/blob/master/LICENSE) for more details.
