# JAMFKit #

[![Build Status](https://travis-ci.org/Ethenyl/JAMFKit.svg?branch=master)](https://travis-ci.org/Ethenyl/JAMFKit)
[![GitHub issues](https://img.shields.io/github/issues/Ethenyl/JAMFKit.svg)](https://github.com/Ethenyl/JAMFKit/issues)
[![GitHub license](https://img.shields.io/github/license/Ethenyl/JAMFKit.svg)](https://github.com/Ethenyl/JAMFKit/blob/master/LICENSE)

JAMFKit is an SDK to communicate with the JSS API from any JAMF host.

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

- [] Full JSON encoding / decoding support for JSS objects
- [] Default REST services for out-of-the-box usage
- [] Public REST service protocols to implement custom networking layer
- [] Centralized manager with interchangeable services based on public protocols

## Requirements ##

- iOS 9+ / macOS 10.10+
- XCode 8.3+
- Swift 3.1+

## Installation ##

### Carthage ###

🚧 &nbsp;Under construction 🚧

To integrate JAMFKit into your project, add the following line in your `Cartfile`:

```ogdl
github "Ethenyl/JAMFKit" ~> 1.0
```

Then run the following command:

`$ carthage update`

### Cocoapods ###

🚧 &nbsp;Under construction 🚧

To integrate JAMFKit into your project, add the following line in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'JAMFKit', '~> 1.0'
end
```

Then run the following command:

`$ pod install`

## Architecture ##

### Protocols ###

#### Identifiable ####

Represents all objects that can identified from the JAMF host.

### Classes ###

#### JAMFObject ####

Represents the common denominator between all the JAMF objects which must contains at least an `identifier` and a `name` properties.

## Usage ##

### First steps ###

🚧 &nbsp;Under construction 🚧

## Contributing ##

If you think that something is either wrong or missing, please check the [issues](https://github.com/Ethenyl/JAMFKit/issues) and if you can't find anything related to your find, please file a new issue.

If you feel like contributing to the repository (either to solve an issue or just to improve it), feel free to clone it and open a pull-request with your changes.

## FAQ ##

None for the moment.

## Credits ##

JAMFKit is owned and maintained by [Ethenyl](https://github.com/Ethenyl).

You can join the list by contributing to the repository.

## License ##

JAMFKit is released under the MIT license. [See LICENSE](https://github.com/Ethenyl/JAMFKit/blob/master/LICENSE) for details.