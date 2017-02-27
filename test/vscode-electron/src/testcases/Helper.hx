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

import vscode.TextEditor;
import vscode.TextDocument;
import js.Promise;

/**
 *  Helper methods for testing RobotJS with VSCode
 */
class Helper
{
	public static function createDoc() : Promise<TextEditor>
	{
		// We have to wrap the 'Thenables' returned by vscode APIs in promises until
		// issue (https://github.com/HaxeFoundation/haxe/issues/6028) is fixed.
		var open = function() 
		{
			return new Promise<TextDocument>(function(resolve,reject) {
				Vscode.workspace.openTextDocument({language:"haxe"}).then(resolve,reject);
			});
		}

		var show = function(doc:TextDocument)
		{
			return new Promise<TextEditor>(function(resolve,reject) {
				Vscode.window.showTextDocument(doc, null, false).then(resolve,reject);
			});
		}

		return open().then(show);		
	}

	/**
	 *  Reverses the arguments for `haxe.Time.delay`.
	 *  @param ms - milliseconds to wait
	 *  @param done - callback to call after waiting
	 */
	public static inline function delay(ms:Int, callback:Void->Void) : Void
	{
		haxe.Timer.delay(callback, ms);
	}

}