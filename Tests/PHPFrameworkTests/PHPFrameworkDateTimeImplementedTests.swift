//
//  PHPFrameworkDateTimeImplementedTests.swift
//  PHPFramework
//
//  Created by Wesley de Groot on 28-06-26.
//  Copyright © 2016 WDGWV. All rights reserved.
//

import XCTest
@testable import PHPFramework
import Foundation

extension PHPFrameworkTests {
	func test_datetime_helpers_parse_and_format_dates() {
		XCTAssertTrue(php.checkdate(2, 29, 2024))
		XCTAssertFalse(php.checkdate(2, 29, 2023))

		let date = php.date_create_from_format("Y-m-d H:i:s", "2026-06-28 14:15:16")
		XCTAssertNotNil(date)
		XCTAssertEqual(date.map { php.date_format($0, "Y-m-d H:i:s") }, "2026-06-28 14:15:16")
	}

	func test_datetime_helpers_create_intervals() {
		let interval: DateComponents = php.date_interval_create_from_date_string(
			"2 years 3 months 4 days 5 hours 6 minutes 7 seconds"
		)

		XCTAssertEqual(interval.year, 2)
		XCTAssertEqual(interval.month, 3)
		XCTAssertEqual(interval.day, 4)
		XCTAssertEqual(interval.hour, 5)
		XCTAssertEqual(interval.minute, 6)
		XCTAssertEqual(interval.second, 7)
	}
}
