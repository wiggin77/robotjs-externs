/*
 * Copyright (c) 2017 Wiggin77
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of
 * this software and associated documentation files (the "Software"), to deal in
 * the Software without restriction, including without limitation the rights to use,
 * copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the
 * Software, and to permit persons to whom the Software is furnished to do so,
 * subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
 * FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
 * COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
 * AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH
 * THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/
package js.robotjs;

typedef Position = {x:Int, y:Int}
typedef Size = {width:Int, height:Int}

@:enum abstract Modifier(String)
{
	var Alt = "alt";
	var Command = "command";
	var Control = "control";
	var Shift = "shift";
}

@:enum abstract UpDown(String)
{
	var Up = "up";
	var Down = "down";
}

@:enum abstract Button(String)
{
	var Left = "left";
	var Right = "right";
	var Middle = "middle";
}

@:enum abstract Direction(String)
{
	var Up = "up";
	var Down = "down";
}

/**
 *  Provides methods for simulating keystrokes and mouse moves, and fetching mouse position and pixels.
 */
@:jsRequire("robotjs") 
@:native("robot") 
extern class Robot
{
	/**
	 *  Screen object provides methods for capturing screen pixels.
	 */
	public static var screen(default,null):Screen;

	/**
	 *  Sets the delay in milliseconds to sleep after a keyboard event. This is 10ms by default.
	 *  @param ms - delay in milliseconds
	 */
	public static function setKeyboardDelay(ms:Int) : Void;

	/**
	 *  Press a single key.
	 *  @param key - the key to press
	 *  @param modifier - optional `Modifier`
	 *  @see http://robotjs.io/docs/syntax#keys
	 */
	@:overload(function(key:String, ?modifier:Array<Modifier>) : Void {})
	public static function keyTap(key:String, ?modifier:Modifier) : Void;

	/**
	 *  Hold down or release a key.
	 *  @param key - the key to hold down or release
	 *  @param down - `UpDown` determines if hold down or release
	 *  @param modifier - optional `Modifier`
	 *  @see http://robotjs.io/docs/syntax#keys
	 */
	@:overload(function(key:String, down:UpDown, ?modifier:Array<Modifier>) : Void {})
	public static function keyToggle(key:String, down:UpDown, ?modifier:Modifier) : Void;

	/**
	 *  Performs a `keyTap` for all characters in a string.
	 *  @param str - the string to `keyTap`
	 */
	public static function typeString(str:String) : Void;

	/**
	 *  Performs a `keyTap` for all characters in a string at a specific rate.
	 *  @param str - the string to `keyTap`
	 *  @param cpm - characters per minute
	 */
	public static function typeStringDelayed(str:String, cpm:Int) : Void;

	/**
	 *  Sets the delay in milliseconds to sleep after a mouse event. This is 10ms by default.
	 *  @param delay - delay in milliseconds
	 */
	public static function setMouseDelay(delay:Int) : Void;

	/**
	 *  Moves mouse to x, y instantly, with the mouse button up.
	 *  @param x - new x position
	 *  @param y - new y position
	 */
	public static function moveMouse(x:Int, y:Int) : Void;

	/**
	 *  Moves mouse to x, y human like, with the mouse button up.
	 *  @param x - new x position
	 *  @param y - new y position
	 */
	public static function moveMouseSmooth(x:Int, y:Int) : Void;

	/**
	 *  Clicks the mouse.
	 *  @param button - `Button` determines which mouse button to click
	 *  @param double - if true then the button is double-clicked
	 */
	public static function mouseClick(?button:Button, ?double:Bool) : Void;

	/**
	 *  Toggles mouse button.
	 *  @param down - `UpDown` determines if click down or release
	 *  @param button - `Button` determines which mouse button to toggle
	 */
	public static function mouseToggle(?down:String, ?button:Button) : Void;

	/**
	 *  Moves mouse to x, y instantly, with the mouse button held down.
	 *  @param x - new x position
	 *  @param y - new y position
	 */
	public static function dragMouse(x:Int, y:Int) : Void;

	/**
	 *  Scrolls the mouse either up or down.
	 *  @param magnitude - the amount to scroll
	 *  @param direction - `Direction` determines direction of scroll
	 */
	public static function scrollMouse(magnitude:Int, direction:Direction) : Void;

	/**
	 *  Gets the mouse coordinates.
	 *  @return `Position` - current x, y coordinates
	 */
	public static function getMousePos() : Position;

	/**
	 *  Gets the pixel color at x, y. This function is perfect for getting a pixel or two, 
	 *  but if you’ll be reading large portions of the screen use `screen.capture`.
	 *  @param x - x position to fetch
	 *  @param y - y position to fetch
	 *  @return String - hex color code of the pixel at x, y
	 */
	public static function getPixelColor(x:Int, y:Int) : String;

	/**
	 *  Gets the screen width and height.
	 *  @return Size - the screen width and height
	 */
	public static function getScreenSize() : Size;
}

/**
 *  Provides method for capturing screen pixels.
 */
@:native("screen") extern interface Screen
{
	/**
	 *  Gets part or all of the screen. If no arguments are provided, screen.capture will get the full screen.
	 *  
	 *  @param x - left-most position to capture from
	 *  @param y - top-most position to capture from
	 *  @param width - number of pixel to capture on x-axis
	 *  @param height - number of pixel to capture on y-axis
	 *  @return a `Bitmap` object containing pixels captured
	 */
	public function capture(?x:Int, ?y:Int, ?width:Int, ?height:Int) : Bitmap;
}

/**
 *  Bitmap object returned from `Screen.capture`.
 */
@:native("bitmap") extern class Bitmap
{
	/** Width of the bitmap in pixels */
	public var width(default,null) : Int;
	/** Height of the bitmap in pixels */
	public var height(default,null) : Int;
	/** Width of the bitmap in bytes */
	public var byteWidth(default,null) : Int;
	/** Bits per pixel */
	public var bitsPerPixel(default,null) : Int;
	/** Bytes per pixel */
	public var bytesPerPixel(default,null) : Int;
	/** Raw image data. Array of uint8 **/
	public var image(default,null) : Dynamic;

	/**
	 *  Gets the pixel color at x, y.
	 *  @param x - x position to fetch
	 *  @param y - y position to fetch
	 *  @return String - hex color code of the pixel at x, y
	 */
	public function colorAt(x:Int, y:Int) : String;
}