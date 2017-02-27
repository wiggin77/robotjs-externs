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

import vscode.ExtensionContext;

/**
 *  Extension class.
 */
class RobotExtension
{
	/**
	 *  Exported `activate` method called when the command is first activated.
	 *  @param context - the `ExtensionContext` provided by vscode. 
	 */
	@:expose("activate")
	public static function activate(context:ExtensionContext)
	{
		new RobotExtension(context);
	} 

	/**
	 *  Constructor
	 *  @param context - the `ExtensionContext` provided by vscode. 
	 */
	public function new(context:ExtensionContext)
	{
		var disposable = Vscode.commands.registerCommand("robottest.testRobot", Runner.run);
		context.subscriptions.push(disposable);
	}

}
