//
// PHP Framework
// PHPFramework is a collection of the most common PHP functions, implemented in Swift.
//
// https://github.com/0xWDG/PHPFramework
//
// File:    PHPFrameworkTest.swift
// Created: 05-FEB-2016
// Creator: Wesley de Groot | @0xWDG
// Issue:   N/A
// Prefix:  N/A

import Foundation

/// *PHP.Framework** \
/// PHP In Swift*
///
/// PHPTest is a alias of ``PHPFrameworkTests``
public let PHPTest = PHPFrameworkTests()

/// *PHP.Framework** \
/// PHP In Swift*
///
/// Test class
///
/// With this class you can run tests for PHP.Framework.
///
/// Use `PHPTest.Test(val1, val2)` Or
///
/// Please see a `.swift` file for more information about how it works
///
public class PHPFrameworkTests {
    let php = PHPFramework()
	let E: String = PHPFramework().getcwd()
	let PASS: String = "Tend"
	let FAIL: String = "FAIL"

	public init() {}

	/// Our internal test function.
	///
	/// - Paramter Tin: test input 1
	/// - Parameter Tend: test input 2
	/// - Parameter deb: debug (default: false)
	public func Test(Tin: Any = "Tin", _ Tend: Any = "Tend", _ deb: Bool = false) -> String {
//		var _retVal: String = String()
//
//        switch Tin {
//            case is Int:
//                _retVal = String(tin) == String(tend) ? "✅" : "❌"
//        }
//		switch (String(Tin.dynamicType)) {
//
//		case "__NSCFNumber", "Int":
//			_retVal = String(Tin) == String(Tend) ? "✅" : "❌"
//			break
//
//		case "__NSCFBoolean", "Bool":
//			_retVal = Tin as! Bool == Tend as! Bool ? "✅" : "❌"
//			break
//
//		case "_SwiftDeferredNSArray", "Array<String>":
//			_retVal = (Tin as! Array<String>) == (Tend as! Array<String>) ? "✅" : "❌"
//			break
//
//		case "Array<Int>":
//			_retVal = (Tin as! Array<Int>) == (Tend as! Array<Int>) ? "✅" : "❌"
//			break
//
//		case "_NSContiguousString", "String", "NSString":
//			_retVal = String(Tin) == String(Tend) ? "✅" : "❌"
//			break
//
//		case "_NativeDictionaryStorageOwner<String, Array<String>>":
//			_retVal = "❌ DICT"
//			break
//
//		default:
//			_retVal = "❌ \(String(Tin.dynamicType))"
//			break
//		}
//
//		if (deb) {
//			return "\(_retVal) I1=\"\(Tin)\" I2=\"\(Tend)\""
//		}
//
//		return _retVal
        return "_"
	}

	/// Test all
	///
	/// - Paramter asDict: make a nice output?
	public func All(asDict: Bool = true) -> Any {
		if asDict {
			let tempOb: [String: Any] = [
				"Array": ArrayFunctions(),
				"Base": PHPBase(),
				"Constants (1/2)": PHPConstants(),
				"Constants (2/2)": PHPConstantsDictionary(),
				"Date Time": DateTime(),
				"Directory": Directory(),
				"File System": FileSystem(),
				"String": StringFunctions(),
				"Variable": VariableFunctions()
			]

			return tempOb
		} else {
			var tempOb: String = ""

            tempOb = tempOb.appending("Array:\n")
			for (key, object) in PHPTest.ArrayFunctions() {
				tempOb = tempOb.appending("    \(key) = \(object)\n")
			}

			tempOb = tempOb.appending("\nBase:\n")
			for (key, object) in PHPTest.PHPBase() {
				tempOb = tempOb.appending("    \(key) = \(object)\n")
			}

			tempOb = tempOb.appending("\nConstants (1/2):\n")
			for (key, object) in PHPTest.PHPConstants() {
				tempOb = tempOb.appending("    \(key) = \(object)\n")
			}

			tempOb = tempOb.appending("\nConstants (2/2):\n")
			for (key, object) in PHPTest.PHPConstantsDictionary() {
				tempOb = tempOb.appending("    \(key) = \(object)\n")
			}

			tempOb = tempOb.appending("\nDate Time:\n")
			for (key, object) in PHPTest.DateTime() {
				tempOb = tempOb.appending("    \(key) = \(object)\n")
			}

			tempOb = tempOb.appending("\nDirectory:\n")
			for (key, object) in PHPTest.Directory() {
				tempOb = tempOb.appending("    \(key) = \(object)\n")
			}

			tempOb = tempOb.appending("\nFile System:\n")
			for (key, object) in PHPTest.FileSystem() {
				tempOb = tempOb.appending("    \(key) = \(object)\n")
			}

			tempOb = tempOb.appending("\nStrings:\n")
			for (key, object) in PHPTest.StringFunctions() {
				tempOb = tempOb.appending("    \(key) = \(object)\n")
			}

			tempOb = tempOb.appending("\nVariables:\n")
			for (key, object) in PHPTest.VariableFunctions() {
				tempOb = tempOb.appending("    \(key) = \(object)\n")
			}
			return tempOb
		}
	}

	/// Test all of the Array Functions
	///
	/// - Returns: Dictionary<String, Any>
	public func ArrayFunctions() -> [String: Any] {
		let tempDict: [String: Any] = [
			"val1": true,
			"val2": false
		]

		return tempDict
	}

	/// Test all of the Variable Functions
	///
	/// - Returns: Dictionary<String, Any>
	public func VariableFunctions() -> [String: Any] {
		let tempDict: [String: Any] = [
			"val1": true,
			"val2": false
		]

		return tempDict
	}

	/// Test all of the FileSystem Functions
	///
	/// - Returns: Dictionary<String, Any>
	public func FileSystem() -> [String: Any] {
		let tempDict: [String: Any] = [
			"val1": true,
			"val2": false
		]

		return tempDict
	}

	/// Test all of the PHP-Constants (1/2) [Defines]
	///
	/// - Returns: Dictionary<String, Any>
	public func PHPConstants() -> [String: Any] {
		let tempDict: [String: Any] = [
			"Constants": self.Test(PASS)
		]

		return tempDict
	}

	/// Test all of the PHP-Constants (2/2) [Dictionary]
	///
	/// - Returns: Dictionary<String, Any>
	public func PHPConstantsDictionary() -> [String: Any] {
		let tempDict: [String: Any] = [
			"Constants": self.Test(PASS)
		]

		return tempDict
	}

	/// Test all of the Date & Time / DateTime Functions
	///
	/// - Returns: Dictionary<String, Any>
	public func DateTime() -> [String: Any] {
		let tempDict: [String: Any] = [
			"val1": true,
			"val2": false
		]

		return tempDict
	}
}
