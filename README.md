# RGDoneKeyboard

[![CI Status](https://img.shields.io/travis/iRohitGaur/RGDoneKeyboard.svg?style=flat)](https://travis-ci.org/iRohitGaur/RGDoneKeyboard)
[![Version](https://img.shields.io/cocoapods/v/RGDoneKeyboard.svg?style=flat)](https://cocoapods.org/pods/RGDoneKeyboard)
[![License](https://img.shields.io/cocoapods/l/RGDoneKeyboard.svg?style=flat)](https://cocoapods.org/pods/RGDoneKeyboard)
[![Platform](https://img.shields.io/cocoapods/p/RGDoneKeyboard.svg?style=flat)](https://cocoapods.org/pods/RGDoneKeyboard)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

<img src="images/rgdk.gif" height="400">

## Installation

RGDoneKeyboard is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'RGDoneKeyboard'
```

## Usage

Turn on the accessory in storyboard. For details, check these videos:

<a href="https://www.youtube.com/playlist?list=PLSyUY9cUrmozWHqIRZ1UULgcdl2SAJCY2"><img src="images/rgdk-yt.png" height="200"></a>

Import it in the ViewController you want it to work:

```ruby
import RGDoneKeyboard
```
In your viewDidLoad function, call RGDoneKeyboard on self:

```ruby
self.RGDoneKeyboard(dismissOnTap: true)
```
If you want to dismiss the keyboard when you tap on the view, you can set dismissOnTap as true.

## Author

iRohitGaur, rohitgaur7@gmail.com

## License

RGDoneKeyboard is available under the MIT license. See the LICENSE file for more info.
