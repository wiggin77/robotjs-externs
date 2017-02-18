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

import js.robotjs.Robot;
import js.robotjs.Robot.Modifier;

class RobotHelper
{
	/** Chars that require shift. */
	public static inline var s_shifts = "~!@#$%^&*()_+|{}:\"<>?";

	/** Empty modifier list. */
	private static var s_modEmpty:Array<Modifier> = [];

	/** Modifier for shift. */
	private static var s_modShift:Array<Modifier> = [Modifier.Shift];

	/**
	 *  Types the string a character as a time, using Shift modifier as needed.
	 *  @param str - the string to type
	 */
	public static function typeString(str:String) : Void
	{
		for(i in 0...str.length)
		{
			var ch = str.charAt(i);
			var mod:Array<Modifier> = (s_shifts.indexOf(ch) == -1) ? s_modEmpty : s_modShift;
			Robot.keyTap(ch, mod);
		}
	}

}