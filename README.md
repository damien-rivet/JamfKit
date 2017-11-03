# JAMFKit #

[![Travis branch](https://img.shields.io/travis/Ethenyl/JAMFKit/master.svg?style=flat-square)](https://travis-ci.org/Ethenyl/JAMFKit)
[![Codecov](https://img.shields.io/codecov/c/github/Ethenyl/JAMFKit.svg?style=flat-square)](https://codecov.io/gh/Ethenyl/JAMFKit)
[![GitHub issues](https://img.shields.io/github/issues/Ethenyl/JAMFKit.svg?style=flat-square)](https://github.com/Ethenyl/JAMFKit/issues)
[![Carthage compatible](https://img.shields.io/badge/carthage-compatible-4BC51D.svg?style=flat-square)](https://github.com/Carthage/Carthage)
[![CocoaPods](https://img.shields.io/cocoapods/p/JAMFKit.svg?style=flat-square)](https://cocoapods.org/pods/JAMFKit)
[![GitHub license](https://img.shields.io/github/license/Ethenyl/JAMFKit.svg?style=flat-square)](https://github.com/Ethenyl/JAMFKit/blob/master/LICENSE)

`JAMFKit` is an SDK to communicate with the JSS API from any JAMF host.

## Summary ##

- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
  - [Carthage](#carthage)
  - [CocoaPods](#cocoapods)
- [Architecture](#architecture)
  - [Protocols](#protocols)
  - [Classes](#classes)
- [Usage](#usage)
  - [First steps](#first-steps)
- [Contributing](#contributing)
- [FAQ](#faq)
- [Credits](#credits)
- [License](#license)

## Features ##

- [ ] Full JSON encoding / decoding support for JSS objects
- [ ] Default REST services for out-of-the-box usage
- [ ] Public REST service protocols to implement custom networking layer
- [ ] Centralized manager with interchangeable services based on public protocols

## Requirements ##

- iOS 9+ / macOS 10.10+
- XCode 8.3+
- Swift 3.1+

## Installation ##

### Carthage ###

To integrate `JAMFKit` into your project, add the following line in your `Cartfile`:

```ogdl
github "Ethenyl/JAMFKit"
```

Then run the following command:

`$ carthage update`

### Cocoapods ###

To integrate `JAMFKit` into your project, add the following line in your `Podfile`:

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

#### Identifiable ####

Represents all objects that can be received from / sent to the JAMF host. Its exposes two criticals elements:

- An failable initializer that takes a JSON payload and return the instantiated `Identifiable` object
- A function to return the JSON payload that represents the instance of the `Identifiable` object

### Classes ###

#### BaseObject ####

Represents the common denominator between all the JAMF objects which must contains at least an `identifier` and a `name` properties.

#### Site ####

Represents a physical location (building, office, etc.).

#### User ####

Represents a JAMF user and contains the identification properties that are required to contact the actual user and identify the hardware assigned to him.

## Usage ##

### First steps ###

🚧 &nbsp;Under construction 🚧

## Contributing ##

If you think that something is either wrong or missing, please check the [issues](https://github.com/Ethenyl/JAMFKit/issues) and if you can't find anything related to your find, please file a new issue.

If you feel like contributing to the repository (either to solve an issue or just to improve it), feel free to clone it and open a pull-request with your changes.

## FAQ ##

None for the moment.

## Credits ##

`JAMFKit` is owned and maintained by [Ethenyl](https://github.com/Ethenyl).

You can join the list by contributing to the repository.

## License ##

`JAMFKit` is released under the MIT license. [See LICENSE](https://github.com/Ethenyl/JAMFKit/blob/master/LICENSE) for details.
