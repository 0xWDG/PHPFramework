//
// PHP Framework
// PHPFramework is a collection of the most common PHP functions, implemented in Swift.
//
// https://github.com/0xWDG/PHPFramework
//
// File:    PHPFrameworkDateTimeImplemented.swift
// Created: 28-JUN-2026
// Creator: Wesley de Groot | @0xWDG
// Issue:   #6 (DateTime Functions)
// Prefix:  PFDT

import Foundation

extension PHPFramework {
	public func checkdate(_ month: Int, _ day: Int, _ year: Int) -> Bool {
		var components = DateComponents()
		components.calendar = Calendar(identifier: .gregorian)
		components.year = year
		components.month = month
		components.day = day

		guard let date = components.date else {
			return false
		}

		let resolved = Calendar(identifier: .gregorian).dateComponents([.year, .month, .day], from: date)
		return resolved.year == year && resolved.month == month && resolved.day == day
	}

	public func date_add(_ date: Date, _ components: DateComponents) -> Date? {
		return Calendar.current.date(byAdding: components, to: date)
	}

	public func date_sub(_ date: Date, _ components: DateComponents) -> Date? {
		var inverted = DateComponents()
		inverted.year = components.year.map { -$0 }
		inverted.month = components.month.map { -$0 }
		inverted.day = components.day.map { -$0 }
		inverted.hour = components.hour.map { -$0 }
		inverted.minute = components.minute.map { -$0 }
		inverted.second = components.second.map { -$0 }
		return Calendar.current.date(byAdding: inverted, to: date)
	}

	public func date_create(_ string: String = "now") -> Date? {
		return parsePHPDate(string)
	}

	public func date_create_immutable(_ string: String = "now") -> Date? {
		return date_create(string)
	}

	public func date_create_from_format(_ format: String, _ string: String) -> Date? {
		return phpDateFormatter(format).date(from: string)
	}

	public func date_create_immutable_from_format(_ format: String, _ string: String) -> Date? {
		return date_create_from_format(format, string)
	}

	public func date_date_set(_ date: Date, _ year: Int, _ month: Int, _ day: Int) -> Date? {
		var components = Calendar.current.dateComponents([.hour, .minute, .second], from: date)
		components.year = year
		components.month = month
		components.day = day
		return Calendar.current.date(from: components)
	}

	public func date_default_timezone_get() -> String {
		return TimeZone.current.identifier
	}

	public func date_default_timezone_set(_ identifier: String) -> Bool {
		guard let timezone = TimeZone(identifier: identifier) else {
			return false
		}

		NSTimeZone.default = timezone
		return true
	}

	public func date_diff(_ first: Date, _ second: Date) -> DateComponents {
		return Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: first, to: second)
	}

	public func date_format(_ date: Date, _ format: String) -> String {
		return phpDateFormatter(format).string(from: date)
	}

	public func date_interval_create_from_date_string(_ string: String) -> DateComponents {
		var components = DateComponents()
		let tokens = string.lowercased().split { !$0.isLetter && !$0.isNumber && $0 != "-" }
		var index = tokens.startIndex

		while index < tokens.endIndex {
			guard let value = Int(tokens[index]) else {
				index = tokens.index(after: index)
				continue
			}

			let unitIndex = tokens.index(after: index)
			guard unitIndex < tokens.endIndex else {
				break
			}

			let unit = tokens[unitIndex]
			if unit.hasPrefix("year") {
				components.year = value
			} else if unit.hasPrefix("month") {
				components.month = value
			} else if unit.hasPrefix("day") {
				components.day = value
			} else if unit.hasPrefix("hour") {
				components.hour = value
			} else if unit.hasPrefix("minute") {
				components.minute = value
			} else if unit.hasPrefix("second") {
				components.second = value
			}

			index = tokens.index(after: unitIndex)
		}

		return components
	}

	public func date_modify(_ date: Date, _ interval: DateComponents) -> Date? {
		return date_add(date, interval)
	}

	public func date_offset_get(_ date: Date, _ timezone: TimeZone = .current) -> Int {
		return timezone.secondsFromGMT(for: date)
	}

	public func date_parse(_ string: String) -> [String: Int] {
		let date = parsePHPDate(string)
		let components = date.map {
			Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: $0)
		}

		return [
			"year": components?.year ?? 0,
			"month": components?.month ?? 0,
			"day": components?.day ?? 0,
			"hour": components?.hour ?? 0,
			"minute": components?.minute ?? 0,
			"second": components?.second ?? 0
		]
	}

	public func date(_ format: String, _ timestamp: TimeInterval? = nil) -> String {
		let date = Date(timeIntervalSince1970: timestamp ?? Date().timeIntervalSince1970)
		return phpDateFormatter(format).string(from: date)
	}

	public func getdate(_ timestamp: TimeInterval? = nil) -> [String: Int] {
		let date = Date(timeIntervalSince1970: timestamp ?? Date().timeIntervalSince1970)
		let components = Calendar.current.dateComponents(
			[.year, .month, .day, .hour, .minute, .second, .weekday, .weekdayOrdinal],
			from: date
		)

		return [
			"seconds": components.second ?? 0,
			"minutes": components.minute ?? 0,
			"hours": components.hour ?? 0,
			"mday": components.day ?? 0,
			"wday": components.weekday ?? 0,
			"mon": components.month ?? 0,
			"year": components.year ?? 0,
			"yday": Calendar.current.ordinality(of: .day, in: .year, for: date).map { $0 - 1 } ?? 0
		]
	}

	public func gmdate(_ format: String, _ timestamp: TimeInterval? = nil) -> String {
		let formatter = phpDateFormatter(format)
		formatter.timeZone = TimeZone(secondsFromGMT: 0)
		return formatter.string(from: Date(timeIntervalSince1970: timestamp ?? Date().timeIntervalSince1970))
	}

	public func idate(_ format: String, _ timestamp: TimeInterval? = nil) -> Int {
		return Int(date(format, timestamp)) ?? 0
	}

	public func microtime(_ asFloat: Bool = false) -> Any {
		let now = Date().timeIntervalSince1970
		if asFloat {
			return now
		}

		let seconds = floor(now)
		return String(format: "%.6f %.0f", now - seconds, seconds)
	}

	// swiftlint:disable:next function_parameter_count
	public func mktime(
		_ hour: Int,
		_ minute: Int,
		_ second: Int,
		_ month: Int,
		_ day: Int,
		_ year: Int
	) -> TimeInterval {
		var components = DateComponents()
		components.calendar = Calendar.current
		components.year = year
		components.month = month
		components.day = day
		components.hour = hour
		components.minute = minute
		components.second = second
		return components.date?.timeIntervalSince1970 ?? 0
	}

	public func strtotime(_ string: String) -> TimeInterval? {
		return parsePHPDate(string)?.timeIntervalSince1970
	}

	public func time() -> Int {
		return Int(Date().timeIntervalSince1970)
	}

	public func timezone_identifiers_list() -> [String] {
		return TimeZone.knownTimeZoneIdentifiers
	}

	public func timezone_name_get(_ timezone: TimeZone) -> String {
		return timezone.identifier
	}

	public func timezone_open(_ identifier: String) -> TimeZone? {
		return TimeZone(identifier: identifier)
	}

	public func timezone_offset_get(_ timezone: TimeZone, _ date: Date = Date()) -> Int {
		return timezone.secondsFromGMT(for: date)
	}

	public func timezone_version_get() -> String {
		return TimeZone.current.identifier
	}

	private func phpDateFormatter(_ phpFormat: String) -> DateFormatter {
		let formatter = DateFormatter()
		formatter.locale = Locale(identifier: "en_US_POSIX")
		formatter.dateFormat = swiftDateFormat(fromPHP: phpFormat)
		return formatter
	}

	private func parsePHPDate(_ string: String) -> Date? {
		if string.lowercased() == "now" {
			return Date()
		}

		if let timestamp = TimeInterval(string) {
			return Date(timeIntervalSince1970: timestamp)
		}

		let formats = ["yyyy-MM-dd HH:mm:ss", "yyyy-MM-dd", "MM/dd/yyyy", "dd-MM-yyyy", "yyyy/MM/dd"]
		for format in formats {
			let formatter = DateFormatter()
			formatter.locale = Locale(identifier: "en_US_POSIX")
			formatter.dateFormat = format
			if let date = formatter.date(from: string) {
				return date
			}
		}

		return nil
	}

	private func swiftDateFormat(fromPHP format: String) -> String {
		let replacements: [Character: String] = [
			"Y": "yyyy", "y": "yy", "m": "MM", "n": "M", "d": "dd", "j": "d",
			"H": "HH", "G": "H", "h": "hh", "g": "h", "i": "mm", "s": "ss",
			"A": "a", "a": "a", "M": "MMM", "F": "MMMM", "D": "EEE", "l": "EEEE",
			"O": "Z", "P": "XXXXX", "U": "X"
		]

		return format.map { replacements[$0] ?? String($0) }.joined()
	}
}
