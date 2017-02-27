
Simple test to ensure RobotJS is working on your platform.  

## Requirements
* [Node.js](https://nodejs.org/en/download/)
* An OS compatible with Node.js (e.g. Windows, MacOS, Linux)

## Build
From this directory...
```
cd ../../
haxe build-test-simple.hxml

cd test/simple
npm install

node test.js
```

## Result
You should see your mouse move across your screen in a sine wave pattern.  The final mouse position and color of that pixel is output.

```
$ node test.js
#020100 at x:5519 y:589
```