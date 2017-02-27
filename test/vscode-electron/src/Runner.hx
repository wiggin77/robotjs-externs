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

import js.Error;

/**
 *  Callback called when tests are complete.  clb:(error: Error, failures?: number) => void)
 *  	error:Error 
 *      failures:number 
 */
typedef RunnerCallback = Error->?Int->Void;

/**
 *  App entry point for test runner.
 */
class Runner
{
	/**
	 *  TestRunner entry point - called by VSCode
	 *  @param testsRoot - directory of test files (--extensionTestsPath in launch.json)
	 *  @param callback - callback to call when tests are done. Can include error object.
	 */
	@:expose("run")
	@:keep
	public static function run(testsRoot:String, callback:RunnerCallback) : Void
	{
		var suite = new RobotTestSuite();

		// Delay a bit so VSCode instance can finish loading.
		haxe.Timer.delay(function(){
			try
			{
				suite.run(callback);
			}
			catch(e:Dynamic)
			{
				callback(e);
			}
		}, 1000);
	}
}