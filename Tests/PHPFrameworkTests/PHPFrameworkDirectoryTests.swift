//
//  PHPFrameworkDirectoryTests.swift
//  PHPFramework
//
//  Created by Wesley de Groot on 13-02-16.
//  Copyright © 2016 WDGWV. All rights reserved.
//

import Foundation
@testable import PHPFramework
import XCTest

extension PHPFrameworkTests {
	func test_chdir() {
		// if no crash then passed
		php.chdir(E)
	}

	func test_chroot() {
		// if no crash then passed
		php.chroot(E)
	}

	func test_closedir() {
		// if no crash then passed
		php.closedir(E)
	}

	func test_rewinddir() {
		// if no crash then passed
		php.rewinddir(E)
	}

	func test_getcwd() {
		// Needs to be equal to E
		XCTAssertEqual(php.getcwd(), E)
	}

	func test_Dir() {
		// pass / not supported
	}

	func test_opendir() {
		// Needs to be equal to E
		XCTAssertEqual(php.opendir(E), E)
	}
}
