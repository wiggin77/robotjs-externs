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
package testcases;

import utest.Assert;
import js.robotjs.Robot;

/**
 *  Test cases for RobotJS screen methods.
 */
class TestScreen
{
	/**
	 *  Contructor
	 */
	public function new() {}

	/**
	 *  Test for `getScreenSize`
	 */
	public function testGetScreenSize() : Void
	{
		var size = Robot.getScreenSize();

		Assert.isTrue(size.width > 0, "screen width");
		Assert.isTrue(size.height > 0, "screen height");
	}

	/**
	 *  Test for `getPixelColor`
	 */
	public function testGetPixelColor() : Void
	{
		var strColor = Robot.getPixelColor(50, 50);

		Assert.isTrue(strColor != null && strColor.length == 6);

		// Convert to Int.
		var strHex = "0x" + strColor;

		var iColor:Null<Int> = Std.parseInt(strHex);
		Assert.notNull(iColor);
	}

}