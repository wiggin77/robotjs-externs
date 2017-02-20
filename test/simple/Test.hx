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
package ;

import js.robotjs.Robot;

class Test
{
	public static function main()
	{
		var iRet = 0;
		try
		{
			Test.mouseTest();
			Test.screenTest();
		}
		catch(e:Dynamic)
		{
			iRet = -1;
			trace("Exception: " + Std.string(e));
		}
		Sys.exit(iRet);
	}

	private static function mouseTest() : Void
	{
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

	private static function screenTest() : Void
	{
		// Get mouse position.
        var mouse = Robot.getMousePos();

        // Get pixel color in hex format.
        var hex = Robot.getPixelColor(mouse.x, mouse.y);
        trace("#" + hex + " at x:" + mouse.x + " y:" + mouse.y);
	}
}