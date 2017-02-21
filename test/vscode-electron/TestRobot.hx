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
import vscode.TextEditor;
import js.Promise;
import js.robotjs.RobotHelper;

class TestRobot
{
	private var m_editor:TextEditor;

	/**
	 *  Exported `activate` method called when the command is first activated.
	 *  @param context - the `ExtensionContext` provided by vscode. 
	 */
	@:expose("activate")
	static function activate(context:ExtensionContext)
	{
		new TestRobot(context);
	} 

	/**
	 *  Constructor
	 *  @param context - the `ExtensionContext` provided by vscode. 
	 */
	public function new(context:ExtensionContext)
	{
		var disposable = Vscode.commands.registerCommand("robottest.testRobot", runTests);
		context.subscriptions.push(disposable);
	}

	/**
	 *  Called when the `testRobot` command is executed.
	 *  @return Promise<Bool>
	 */
	private function runTests() : Promise<Dynamic>
	{
		var prom;
		try
		{
			prom = new Promise<Dynamic>(function(resolve,reject) {
				setup()
				.then(testKeyTap)
				.then(resolve,reject);
			});
		}
		catch(e:Dynamic)
		{
			trace("Exception: " + Std.string(e));
			throw e;
		}
		return prom;
	}

	private function setup() : Promise<TextEditor>
	{
		var prom = new Promise<TextEditor>(function(resolve,reject) {
			return Vscode.workspace.openTextDocument({language:"haxe"})
			.then(function(doc) {
				return Vscode.window.showTextDocument(doc, null, false);
			})
			.then(resolve);
		});
		
		return prom;
	}

	private function testKeyTap(Void) : Promise<Bool>
	{
		return new Promise<Bool>(function(resolve,reject) {
			RobotHelper.typeString("/*");
			resolve(true);
		});
	}

}
