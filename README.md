# PGSideMenu

[![Version](https://img.shields.io/cocoapods/v/PGSideMenu.svg?style=flat)](http://cocoapods.org/pods/PGSideMenu)
[![License](https://img.shields.io/cocoapods/l/PGSideMenu.svg?style=flat)](http://cocoapods.org/pods/PGSideMenu)
[![Platform](https://img.shields.io/cocoapods/p/PGSideMenu.svg?style=flat)](http://cocoapods.org/pods/PGSideMenu)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

PGSideMenu is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "PGSideMenu"
```

### Example Usage

![](http://i.giphy.com/3oD3YmQTMADfYEQb4Y.gif)

See the example project or example code below.

```
let sideMenuController = PGSideMenu()
let contentController = ContentController()
let leftMenuController = LeftMenuController()
let rightMenuController = RightMenuController()
sideMenuController.addContentController(contentController)
sideMenuController.addLeftMenuController(leftMenuController)
sideMenuController.addRightMenuController(rightMenuController)
self.window?.rootViewController = sideMenuController
```

## Author

pgorzelany, piotr.gorzelany@gmail.com

## License

PGSideMenu is available under the MIT license. See the LICENSE file for more info.

## Acknowledgements

Designed taken from: https://www.invisionapp.com/do/sketchappsources
