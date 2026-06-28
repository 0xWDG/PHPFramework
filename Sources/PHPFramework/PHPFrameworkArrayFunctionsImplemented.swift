//
// PHP Framework
// PHPFramework is a collection of the most common PHP functions, implemented in Swift.
//
// https://github.com/0xWDG/PHPFramework
//
// File:    PHPFrameworkArrayFunctionsImplemented.swift
// Created: 28-JUN-2026
// Creator: Wesley de Groot | @0xWDG
// Issue:   #4 (Array Functions)
// Prefix:  PFA

import Foundation

extension PHPFramework {
	public func array_change_key_case<Value>(_ dict: [String: Value], uppercase: Bool = false) -> [String: Value] {
		return Dictionary(uniqueKeysWithValues: dict.map { key, value in
			(uppercase ? key.uppercased() : key.lowercased(), value)
		})
	}

	public func array_chunk<T>(_ arr: [T], _ size: Int, preserveKeys: Bool = false) -> [[T]] {
		guard size > 0 else {
			return []
		}

		return stride(from: 0, to: arr.count, by: size).map {
			Array(arr[$0..<Swift.min($0 + size, arr.count)])
		}
	}

	public func array_column<Value>(_ rows: [[String: Value]], _ column: String) -> [Value] {
		return rows.compactMap { $0[column] }
	}

	public func array_combine<Key: Hashable, Value>(_ keys: [Key], _ values: [Value]) -> [Key: Value]? {
		guard keys.count == values.count else {
			return nil
		}

		return Dictionary(uniqueKeysWithValues: zip(keys, values))
	}

	public func array_count_values<T: Hashable>(_ arr: [T]) -> [T: Int] {
		return arr.reduce(into: [:]) { counts, value in
			counts[value, default: 0] += 1
		}
	}

	public func array_diff<T: Hashable>(_ arr: [T], _ others: [T]...) -> [T] {
		let rejected = Set(others.flatMap { $0 })
		return arr.filter { !rejected.contains($0) }
	}

	public func array_diff_key<Key: Hashable, Value>(_ dict: [Key: Value], _ others: [Key: Any]...) -> [Key: Value] {
		let rejected = Set(others.flatMap { $0.keys })
		return dict.filter { !rejected.contains($0.key) }
	}

	public func array_fill<T>(_ startIndex: Int, _ count: Int, _ value: T) -> [Int: T] {
		guard count > 0 else {
			return [:]
		}

		return Dictionary(uniqueKeysWithValues: (startIndex..<(startIndex + count)).map { ($0, value) })
	}

	public func array_fill_keys<Key: Hashable, Value>(_ keys: [Key], _ value: Value) -> [Key: Value] {
		return Dictionary(uniqueKeysWithValues: keys.map { ($0, value) })
	}

	public func array_filter<T>(_ arr: [T], _ include: (T) -> Bool) -> [T] {
		return arr.filter(include)
	}

	public func array_flip<Key: Hashable, Value: Hashable>(_ dict: [Key: Value]) -> [Value: Key] {
		return Dictionary(uniqueKeysWithValues: dict.map { ($0.value, $0.key) })
	}

	public func array_intersect<T: Hashable>(_ arr: [T], _ others: [T]...) -> [T] {
		let accepted = others.map(Set.init)
		return arr.filter { value in accepted.allSatisfy { $0.contains(value) } }
	}

	public func array_intersect_key<Key: Hashable, Value>(_ dict: [Key: Value], _ others: [Key: Any]...) -> [Key: Value] {
		let accepted = others.map { Set($0.keys) }
		return dict.filter { entry in accepted.allSatisfy { $0.contains(entry.key) } }
	}

	public func array_key_exists<Key: Hashable, Value>(_ key: Key, _ dict: [Key: Value]) -> Bool {
		return dict.keys.contains(key)
	}

	public func key_exists<Key: Hashable, Value>(_ key: Key, _ dict: [Key: Value]) -> Bool {
		return array_key_exists(key, dict)
	}

	public func array_keys<Key, Value>(_ dict: [Key: Value]) -> [Key] {
		return Array(dict.keys)
	}

	public func array_map<T, U>(_ arr: [T], _ transform: (T) -> U) -> [U] {
		return arr.map(transform)
	}

	public func array_merge<T>(_ arrays: [T]...) -> [T] {
		return arrays.flatMap { $0 }
	}

	public func array_pad<T>(_ arr: [T], _ size: Int, _ value: T) -> [T] {
		let padding = abs(size) - arr.count
		guard padding > 0 else {
			return arr
		}

		let values = Array(repeating: value, count: padding)
		return size < 0 ? values + arr : arr + values
	}

	public func array_pop<T>(_ arr: [T]) -> T? {
		return arr.last
	}

	public func array_product<T: BinaryInteger>(_ arr: [T]) -> T {
		return arr.reduce(1, *)
	}

	public func array_push<T>(_ arr: [T], _ values: T...) -> [T] {
		return arr + values
	}

	public func array_rand<T>(_ arr: [T]) -> Int? {
		guard !arr.isEmpty else {
			return nil
		}

		return Int.random(in: arr.indices)
	}

	public func array_reduce<T, U>(_ arr: [T], _ initial: U, _ combine: (U, T) -> U) -> U {
		return arr.reduce(initial, combine)
	}

	public func array_replace<Key: Hashable, Value>(
		_ dict: [Key: Value],
		_ replacements: [Key: Value]...
	) -> [Key: Value] {
		return replacements.reduce(into: dict) { result, replacement in
			for (key, value) in replacement {
				result[key] = value
			}
		}
	}

	public func array_reverse<T>(_ arr: [T]) -> [T] {
		return Array(arr.reversed())
	}

	public func array_search<T: Equatable>(_ value: T, _ arr: [T]) -> Int? {
		return arr.firstIndex(of: value)
	}

	public func array_shift<T>(_ arr: [T]) -> T? {
		return arr.first
	}

	public func array_slice<T>(_ arr: [T], _ offset: Int, _ length: Int? = nil) -> [T] {
		let start = offset >= 0 ? offset : Swift.max(arr.count + offset, 0)
		guard start < arr.count else {
			return []
		}

		let end = length.map { Swift.min(start + $0, arr.count) } ?? arr.count
		return Array(arr[start..<Swift.max(start, end)])
	}

	public func array_splice<T>(_ arr: [T], _ offset: Int, _ length: Int, _ replacement: [T] = []) -> [T] {
		let rawStart = offset >= 0 ? offset : Swift.max(arr.count + offset, 0)
		let start = Swift.min(rawStart, arr.count)
		let end = Swift.min(start + Swift.max(length, 0), arr.count)
		return Array(arr[..<start]) + replacement + Array(arr[end...])
	}

	public func array_sum<T: AdditiveArithmetic>(_ arr: [T]) -> T {
		return arr.reduce(.zero, +)
	}

	public func array_unique<T: Hashable>(_ arr: [T]) -> [T] {
		var seen = Set<T>()
		return arr.filter { seen.insert($0).inserted }
	}

	public func array_unshift<T>(_ arr: [T], _ values: T...) -> [T] {
		return values + arr
	}

	public func array_values<Key, Value>(_ dict: [Key: Value]) -> [Value] {
		return Array(dict.values)
	}

	public func arsort<T: Comparable>(_ arr: [T]) -> [T] {
		return arr.sorted(by: >)
	}

	public func asort<T: Comparable>(_ arr: [T]) -> [T] {
		return arr.sorted()
	}

	public func in_array<T: Equatable>(_ value: T, _ arr: [T]) -> Bool {
		return arr.contains(value)
	}

	public func krsort<Key: Comparable, Value>(_ dict: [Key: Value]) -> [(key: Key, value: Value)] {
		return dict.sorted { $0.key > $1.key }
	}

	public func ksort<Key: Comparable, Value>(_ dict: [Key: Value]) -> [(key: Key, value: Value)] {
		return dict.sorted { $0.key < $1.key }
	}

	public func range(_ start: Int, _ end: Int, _ step: Int = 1) -> [Int] {
		guard step != 0 else {
			return []
		}

		if start <= end {
			return Array(stride(from: start, through: end, by: abs(step)))
		}

		return Array(stride(from: start, through: end, by: -abs(step)))
	}

	public func reset<T>(_ arr: [T]) -> T? {
		return arr.first
	}

	public func rsort<T: Comparable>(_ arr: [T]) -> [T] {
		return arr.sorted(by: >)
	}

	public func shuffle<T>(_ arr: [T]) -> [T] {
		return arr.shuffled()
	}

	public func sort<T: Comparable>(_ arr: [T]) -> [T] {
		return arr.sorted()
	}
}
