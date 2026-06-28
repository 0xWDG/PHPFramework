//
//  PHPFrameworkTestDirectory.swift
//  PHPFramework
//
//  Created by Wesley de Groot on 05-02-16.
//  Copyright © 2016 WDGWV. All rights reserved.
//

import Foundation

/// *PHP.Framework** \
/// PHP In Swift*
///
/// Test class extension
///
/// With this class you can run tests for PHP.Framework.
///
/// Use `PHPTest.Test(val1, val2)` Or
///
/// Please see a `.swift` file for more information about how it works
///
extension PHPFrameworkTests {
    /// Test all of the Directory Functions
    ///
    /// - Returns: Dictionary<String, Any>
	public func Directory() -> [String: Any] {
		php.chdir(E)
		php.chroot(E)
		php.closedir(E)
		php.rewinddir(E)

		let tempDict: [String: Any] = [
			"chdir": self.Test(PASS),
			"chroot": self.Test(PASS),
			"closedir": self.Test(PASS),
			"dir": "NOT SUPPORTED",
//			"getcwd": self.Test(php.getcwd(), E),
//			"opendir": self.Test(php.opendir(E), E), // Dynamic
			"readdir": self.Test(PASS),
			"rewinddir": self.Test(PASS),
			"scandir": self.Test(PASS)
		]

		return tempDict
	}
}
