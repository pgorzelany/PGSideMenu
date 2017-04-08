# PGSideMenu

[![Version](https://img.shields.io/cocoapods/v/PGSideMenu.svg?style=flat)](http://cocoapods.org/pods/PGSideMenu)
[![License](https://img.shields.io/cocoapods/l/PGSideMenu.svg?style=flat)](http://cocoapods.org/pods/PGSideMenu)
[![Platform](https://img.shields.io/cocoapods/p/PGSideMenu.svg?style=flat)](http://cocoapods.org/pods/PGSideMenu)

A customizable side menu for iOS projects written in Swift. Multiple menu animation types supported!

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

PGSideMenu is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "PGSideMenu"
```

## Usage

![](https://media.giphy.com/media/l0IygGd2n9fIstiSc/giphy.gif)

See example project for usage.

Setup you side menu with a content, left and right controller.

```
let sideMenuController = PGSideMenu()
let contentController = YourContentController()
let leftMenuController = YourLeftMenuController()
let rightMenuController = YourRightMenuController()
sideMenuController.addContentController(contentController)
sideMenuController.addLeftMenuController(leftMenuController)
sideMenuController.addRightMenuController(rightMenuController)
self.window?.rootViewController = sideMenuController
```

Choose which animation mode you want to use.

```
sideMenuController.animationType = .slideInRotate

```

Toggle the menu

```
sideMenuController.toggleLeftMenu()
sideMenuController.toggleRightMenu()
```

Hide whatever menu is shown

```
sideMenuController.hideMenu()
```

Disable gesture interaction with menu

```
sideMenuController.enableMenuPanGesture
```

## Available animation type

* slideIn
* slideOver
* slideInRotate

If you have any suggestion on other animation types, let me know or leave a pull request :)

## Author

pgorzelany, piotr.gorzelany@gmail.com

## License

PGSideMenu is available under the MIT license. See the LICENSE file for more info.

## Acknowledgements

Designed taken from: https://www.invisionapp.com/do/sketchappsources
