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

import utest.Runner;
import utest.ui.common.HeaderDisplayMode.HeaderDisplayMode;
import utest.ui.common.HeaderDisplayMode.SuccessResultsDisplayMode;
import Runner.RunnerCallback;
import js.Error;

/**
 *  Collection of test cases.
 */
class RobotTestSuite
{
	/** utest runner */
	var m_runner:Runner;

	/**
	 *  Constructor - adds the test cases
	 */
	public function new()
	{
		m_runner = new Runner();
		m_runner.addCase(new testcases.TestKeyboard());
		m_runner.addCase(new testcases.TestMouse());
		m_runner.addCase(new testcases.TestScreen());
	}

	/**
	 *  Runs the test suite.
	 */
	public function run(callback:RunnerCallback) : Void
	{
		try
		{
			var report = new RobotReporter(m_runner, callback);
			report.displayHeader = HeaderDisplayMode.AlwaysShowHeader;
			report.displaySuccessResults = SuccessResultsDisplayMode.AlwaysShowSuccessResults;

			m_runner.run();
		}
		catch(e:Dynamic)
		{
			if(callback != null)
			{
				callback(e);
			}
		}
	}
}

/**
 *  Custom utest reporter that doesn't try to `process.exit` after the test.
 */
class RobotReporter extends utest.ui.text.PrintReport
{
	/** Called when test is complete. */
 	private var m_callback:RunnerCallback;

	/**
	 *  Constructor
	 *  @param runner - the `Runner`
	 */
	public function new(runner:Runner, callback:RunnerCallback)
	{
		m_callback = callback;
		super(runner);
	}

	/**
	 *  Override `complete` and don't call `process.exit` which will try to exit VSCode.
	 *  @param result - the test result
	 */
	public override function complete(result:utest.ui.common.PackageResult) : Void
	{
		this.result = result;
		handler(this);
		if(m_callback != null)
		{
			if(result.stats.isOk)
			{
				m_callback(null, 0);
			}
			else
			{
				var error = new Error("RobotJS test suite failed.");
				m_callback(error, result.stats.errors + result.stats.failures);
			}
		}
	}
}