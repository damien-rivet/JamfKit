# JAMFKit #

[![GitHub issues](https://img.shields.io/github/issues/Ethenyl/JAMFKit.svg)](https://github.com/Ethenyl/JAMFKit/issues)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
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
  - [Going further](#going-further)
- [Contributing](#contributing)
- [FAQ](#faq)
- [Credits](#credits)
- [License](#license)

## Features ##

- [x] Full JSON encoding / decoding support (courtesy of [Codable])

[Codable]: https://developer.apple.com/documentation/swift/codable

## Requirements ##

- iOS 9+ / macOS 10.10+
- XCode 8.3+
- Swift 3.1+

## Installation ##

### Carthage ###

To integrate JAMFKit into your project, add the following line in your `Cartfile`:

```ogdl
github "Ethenyl/JAMFKit" ~> 1.0
```

Then run the following command:

```bash
$ carthage update
```

### Cocoapods ###

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

```bash
$ pod install
```

## Architecture ##

### Protocols ###

TODO

### Classes ###

TODO

## Usage ##

### First steps ###

TODO

### Going further ###

TODO

## Contributing ##

If you think that something is either wrong or missing, please check the [issues](https://github.com/Ethenyl/JAMFKit/issues) and if you can't find anything related to your find, please file a new issue.

If you feel like contributing to the repository (either to solve an issue or just to improve it), feel free to clone it and open a pull-request with your changes.

## FAQ ##

None for the moment.

## Credits ##

JAMFKit is owned and maintained by [Ethenyl](https://github.com/Ethenyl).

## License ##

JAMFKit is released under the MIT license. [See LICENSE](https://github.com/Ethenyl/JAMFKit/blob/master/LICENSE) for details.