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
import js.robotjs.RobotHelper;
import js.robotjs.Robot;
import vscode.TextEditor;
//import vscode.TextDocument;

/**
 *  Test cases for RobotJS keyboard methods.
 */
class TestKeyboard
{
	/**
	 *  Contructor
	 */
	public function new() {}

	/**
	 *  Test for `typeString`
	 */
	public function testTypeString() : Void
	{
		var done = Assert.createAsync(null, 10000);

		Helper.createDoc().then(function(editor:TextEditor) {
			RobotHelper.typeString("/*");

			// Give editor time to process the keystrokes.
			Helper.delay(500, function() {
				Assert.equals("/*", editor.document.lineAt(0).text);
				done();
			});
		});
	}

	/**
	 *  Test for `keyTap`
	 */
	public function testKeyTap() : Void
	{
		var done = Assert.createAsync(null, 5000);

		Helper.createDoc().then(function(editor:TextEditor) {
			Robot.keyTap("h");
			Robot.keyTap("e");
			Robot.keyTap("l");
			Robot.keyTap("l");
			Robot.keyTap("o");
			Robot.keyTap("enter");

			// Give editor time to process the keystrokes.
			Helper.delay(250, function() {
				Assert.equals("hello", editor.document.lineAt(0).text);
				done();
			});
		});
	}


}