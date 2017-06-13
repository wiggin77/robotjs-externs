
Test to ensure RobotJS is working within a Visual Studio Code extension.  

## Requirements
* [Visual Studio Code](https://code.visualstudio.com/)
* [Node.js](https://nodejs.org/en/download/)
* An OS compatible with Visual Studio Code and Node.js (e.g. Windows, MacOS, Linux)
* Build tools for your OS. See [here](http://robotjs.io/docs/building).

## Build
From this directory...
```
cd ../..
haxe build-test-vscode.hxml

cd test/vscode-electron
npm install
npm rebuild --runtime=electron --target=1.6.6 --disturl=https://atom.io/download/atom-shell --abi=53

npm test
```
Note: The script above rebuilds RobotJS for Electron 1.6.6 which ships with VSCode 1.13.0.  Change `target=1.6.6` to match the version of Electron you are using. 
For VSCode, you can find the version of Electron by checking the `package.json` for the version of VSCode you are using (e.g. [package.json](https://github.com/Microsoft/vscode/blob/master/package.json)).

