//
//  PHPFrameworkFileSystemImplementedTests.swift
//  PHPFramework
//
//  Created by Wesley de Groot on 28-06-26.
//  Copyright © 2016 WDGWV. All rights reserved.
//

import XCTest
@testable import PHPFramework
import Foundation

extension PHPFrameworkTests {
	func test_filesystem_helpers_read_write_and_remove_files() {
		let directory = URL(fileURLWithPath: NSTemporaryDirectory())
			.appendingPathComponent(UUID().uuidString, isDirectory: true)
		let file = directory.appendingPathComponent("sample.txt")

		XCTAssertTrue(php.mkdir(directory.path, recursive: true))
		XCTAssertTrue(php.file_exists(directory.path))
		XCTAssertTrue(php.is_dir(directory.path))

		XCTAssertTrue(php.file_put_contents(file.path, "alpha\nbeta\n"))
		XCTAssertTrue(php.file_exists(file.path))
		XCTAssertTrue(php.is_file(file.path))
		XCTAssertEqual(php.file_get_contents(file.path), "alpha\nbeta\n")
		XCTAssertEqual(php.file_lines(file.path), ["alpha", "beta"])
		XCTAssertEqual(php.basename(file.path), "sample.txt")
		XCTAssertEqual(php.dirname(file.path), directory.path)
		XCTAssertEqual(php.filesize(file.path), "11")

		XCTAssertTrue(php.unlink(file.path))
		XCTAssertFalse(php.file_exists(file.path))
		XCTAssertTrue(php.rmdir(directory.path))
	}
}
