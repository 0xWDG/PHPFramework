//
//  PHPFrameworkArrayFunctionsImplementedTests.swift
//  PHPFramework
//
//  Created by Wesley de Groot on 28-06-26.
//  Copyright © 2016 WDGWV. All rights reserved.
//

import XCTest
@testable import PHPFramework

extension PHPFrameworkTests {
	func test_array_helpers_return_expected_values() {
		XCTAssertEqual(php.array_chunk([1, 2, 3, 4, 5], 2), [[1, 2], [3, 4], [5]])
		XCTAssertEqual(php.array_combine(["a", "b"], [1, 2]), ["a": 1, "b": 2])
		XCTAssertEqual(php.array_count_values(["a", "b", "a"]), ["a": 2, "b": 1])
		XCTAssertEqual(php.array_fill(2, 3, "x"), [2: "x", 3: "x", 4: "x"])
		XCTAssertEqual(php.array_reverse([1, 2, 3]), [3, 2, 1])
		XCTAssertEqual(php.array_unique([1, 2, 1, 3, 2]), [1, 2, 3])
	}

	func test_array_helpers_handle_edges_without_crashing() {
		XCTAssertEqual(php.array_chunk([1, 2, 3], 0), [])
		XCTAssertEqual(php.array_slice([1, 2, 3], -2), [2, 3])
		XCTAssertEqual(php.array_splice([1, 2, 3], 10, 2, [4]), [1, 2, 3, 4])
		XCTAssertEqual(php.range(5, 1, 2), [5, 3, 1])
	}
}
