[![Build Status](https://travis-ci.org/wiggin77/robotjs-externs.svg?branch=master)](https://travis-ci.org/wiggin77/robotjs-externs)
=========
Haxe externs for [RobotJS](http://robotjs.io/).  RobotJS is a desktop automation library for Node.js.  

Inject keystrokes and mouse moves into a Node.js application.  Also capture mouse position and screen pixels.

## Samples
A simple test app for Node.js is [here](./test/simple/README.md).

A sample app for VSCode/Electron is [here](./test/vscode-electron/README.md).

## Installation
Install `robot-externs` lib for Haxe:
```
haxelib git robotjs-externs https://github.com/wiggin77/robotjs-externs.git
```
Install RobotJS module. From the directory of the project for which you want to add RobotJS support (i.e. directory containing `package.json`):
```
npm install robotjs
```
This will create a `node_modules` directory within your project directory.

## Building RobotJS
`npm` will install prebuilt binaries for Windows, Mac, and Linux. If you need to build it yourself, see [here](http://robotjs.io/docs/building).

To build for Electron see [here](http://robotjs.io/docs/electron).

## Examples
Examples modified for Haxe from [http://robotjs.io/docs/examples](http://robotjs.io/docs/examples).

### Mouse
```haxe
import js.robotjs.Robot;

class Test {
    public static function test() {
        // Speed up the mouse.
        Robot.setMouseDelay(2);

        var twoPI = Math.PI * 2.0;
        var screenSize = Robot.getScreenSize();
        var height = (screenSize.height / 2) - 10;
        var width = screenSize.width;

        for (x in 0...width)
        {
            var y = Std.int(height * Math.sin((twoPI * x) / width) + height);
            Robot.moveMouse(x, y);
        }    
    }
}
```

### Keyboard
```haxe 
import js.robotjs.Robot;
import js.robotjs.RobotHelper;

class Test {
    public static function test() {
        // Type "Hello World".
        Robot.typeString("Hello World");

        // Press enter.
        Robot.keyTap("enter");

        // Use helper for auto-shift modifier.
        RobotHelper.typeString("_Mixed shift and non-shift!");
    }
}
```

### Screen 
```haxe 
import js.robotjs.Robot;

class Test {
    public static function test() {
        // Get mouse position.
        var mouse = Robot.getMousePos();

        // Get pixel color in hex format.
        var hex = Robot.getPixelColor(mouse.x, mouse.y);
        trace("#" + hex + " at x:" + mouse.x + " y:" + mouse.y);
    }
}
```

