//
// PHP Framework
// PHPFramework is a collection of the most common PHP functions, implemented in Swift.
//
// https://github.com/0xWDG/PHPFramework
//
// File:    PHPFrameworkVariableFunctions.swift
// Created: 21-JAN-2016
// Creator: Wesley de Groot | @0xWDG
// Issue:   #5 (Variable Functions)
// Prefix:  PFV

import Foundation

/// PHPFramework
///
/// A Swift framework inspired by some PHP Functions.
extension PHPFramework {

	/// Get the boolean value of a variable
	///
	/// - Parameter testVar: Any Variable
	///
	/// - Returns: Bool
	public func boolval(_ testVar: Any) -> Any {
		var _ret: Bool

		if getClass(testVar) == "String" {
			switch (testVar as! String).lowercased() {
			case "yes", "true", "ok":
				_ret = true
			default:
				_ret = false
			}
		} else if getClass(testVar) == "Int" {
			if testVar as! Int == 1 {
				_ret = true
			} else {
				_ret = false
			}
		} else {
			_ret = false
		}

		return _ret
	}

	/// *Not supported** Dumps a string representation of an internal zend value to output
	///
	/// - Parameter testVar: Any Variable
	///
	/// - Returns: Bool
	public func debug_zval_dump(_ testVar: Any) {
		print(testVar)
	}

	/// Alias of ``floatval(_:)``
	///
	/// - Parameter testVar: Any Variable
	///
	/// - Returns: Bool
	public func doubleval(_ testVar: Any) -> Int {
		return floatval(testVar)
	}

	/// Determine whether a variable is empty
	///
	/// - Parameter testVar: Any Variable
	///
	/// - Returns: Bool
	public func empty(_ testVar: Any) -> Any {
		if getClass(testVar) == "String" {
			if testVar as! String == "" {
				return true
			} else {
				return false
			}
		} else {
			return false
		}
	}

	/// Get float value of a variable\
	/// Alias of ``intval(_:)``
	///
	/// - Parameter testVar: Any Variable
	///
	/// - Returns: Bool
	public func floatval(_ testVar: Any) -> Int {
		return self.intval(testVar)
	}

	/// Returns an array of all defined variables
	///
	/// - Returns: PHPAllConstants: Dictionary<String, Any>
    public func get_defined_vars() -> [String: Any] {
		return PHPAllConstants
	}

	/// Returns the resource type
	///
	/// - Parameter testVar: Any Variable
	///
	/// - Returns: String the resource type
	public func get_resource_type(_ testVar: Any) -> String {
		return getClass(testVar)
	}

	/// Get the type of a variable
	///
	/// - Parameter testVar: Any Variable
	///
	/// - Returns: Bool
	public func gettype(_ testVar: Any) -> String {
		return getClass(testVar)
	}

	/// *NOT SUPPORTED** Import GET/POST/Cookie variables into the global scope
	/// - Parameter testVar: Any Variable
	public func import_request_variables(_ testVar: Any) {}

	/// Get the integer value of a variable
	///
	/// - Parameter testVar: Any Variable
	///
	/// - Returns: Int
	public func intval(_ testVar: Any) -> Int {
        let num = String(testVar as! String).toInt()
		if num != nil {
			return num!
		} else {
			return 0
		}
	}

	/// Finds whether a variable is an array
	///
	/// - Parameter testVar: Any Variable
	///
	/// - Returns: Bool
	public func is_array(_ testVar: Any) -> Bool {
		return (getClass(testVar) == "Array") ? true : false
	}

	/// Finds out whether a variable is a boolean
	///
	/// - Parameter testVar: Any Variable
	///
	/// - Returns: Bool
	public func is_bool(_ testVar: AnyObject) -> Bool {
		return (getClass(testVar) == "Bool") ? true : false
	}

	/// *Not supported** Verify that the contents of a variable can be called as a function
	///
	/// - Parameter testVar: Any Variable
	///
	/// - Returns: Bool
	public func is_callable(_ testVar: Any) -> Bool {
		return false
	}

	/// Alias of ``is_float(_:)``
	///
	/// - Parameter testVar: Any Variable
	///
	/// - Returns: Bool
	public func is_double(_ testVar: Any) -> Bool {
		return is_float(testVar)
	}

	/// Finds whether the type of a variable is float
	///
	/// - Parameter testVar: Any Variable
	///
	/// - Returns: Bool
	public func is_float(_ testVar: Any) -> Bool {
		return (getClass(testVar) == "Double") ? true : false
	}

	/// Find whether the type of a variable is integer
	///
	/// - Parameter testVar: Any Variable
	///
	/// - Returns: Bool
	public func is_int(_ testVar: Any) -> Bool {
		return (getClass(testVar) == "Int") ? true : false
	}

	/// Alias of ``is_int(_:)``
	///
	/// - Parameter testVar: Any Variable
	///
	/// - Returns: Bool
	public func is_integer(_ testVar: Any) -> Bool {
		return is_int(testVar)
	}

	/// Alias of ``is_int(_:)``
	///
	/// - Parameter testVar: Any Variable
	///
	/// - Returns: Bool
	public func is_long(_ testVar: Any) -> Bool {
		return is_int(testVar)
	}

	/// Finds whether a variable is NULL
	///
	/// - Parameter testVar: Any Variable
	///
	/// - Returns: Bool
	public func is_null(_ testVar: Any?) -> Bool {
		return (testVar == nil || String(testVar as? String ?? NULL) == NULL) ? true : false
	}

	/// Finds whether a variable is a number or a numeric string
	///
	/// - Parameter testVar: Any Variable
	///
	/// - Returns: Bool
	public func is_numeric(_ testVar: Any) -> Bool {
		let num = String(testVar as? Int ?? 0).toInt()
		if num != nil {
			return true
		} else {
			return false
		}
	}

	/// Finds whether a variable is an object
	///
	/// - Parameter testVar: Any Variable
	///
	/// - Returns: Bool
	public func is_object(_ testVar: Any) -> Bool {
		return false
	}

	/// Alias of ``is_float(_:)``
	///
	/// - Parameter testVar: Any Variable
	///
	/// - Returns: Bool
	public func is_real(_ testVar: Any) -> Bool {
		return self.is_float(testVar)
	}

	/// Finds whether a variable is a resource
	///
	/// - Parameter testVar: Any Variable/Object
	///
	/// - Returns: false (*not supported*)
	public func is_resource(_ testVar: Any) -> Bool {
		return false
	}

	/// Finds whether a variable is a scalar\
	/// Scalar variables are those containing an integer, float, string or boolean.\
	/// Types array, object and resource are not scalar.*
	///
	/// - Parameter testVar: Any Variable
	///
	/// - Returns: Bool
	public func is_scalar(_ testVar: Any) -> Bool {
		return (self.is_string(testVar) || self.is_int(testVar) || self.is_float(testVar)) ? true : false
	}

	/// Find whether the type of a variable is string
	///
	/// - Parameter testVar: Any Variable
	///
	/// - Returns: Bool
	public func is_string(_ testVar: Any) -> Bool {
		return (!self.is_null(testVar) && !self.is_int(testVar)) ? true : false
	}

	/// Determine if a variable is set and is not NULL
	///
	/// - Parameter testVar: Any Variable
	///
	/// - Returns: Bool
	public func isset(_ testVar: Any) -> Bool {
		return self.is_null(testVar)
	}

	/// Prints human-readable information about a variable
	///
	/// *Uses return(ob) and print(ob)!**
	///
	/// - Parameter ob: Expression
	/// - Parameter letReturn: return?
	///
	/// - Returns: Any
	public func print_r(_ ob: Any, _ letReturn: Bool = false) -> Any {
		return var_dump(ob, letReturn)
	}

	/// Generates a storable representation of a value
	///
	/// - Parameter testVar: Any Variable
	///
	/// - Returns: Bool
	public func serialize(_ serialize: Any) -> String {
		return serializeType(serialize)
	}

	/// *Internal function** for serialize object (and get type) for php.serialize()
	///
	/// - Parameter objects: The object
	///
	/// - Returns: the serialized object
	private func serializeType(_ objects: Any) -> String {
		let retValue = ""

//        switch (String(type(of: objects) as? String ?? "failed")) {
//
//        case "__NSCFNumber":
//            retValue = self.serializeInts(objects as! Int)
//            break
//
//        case "__NSCFBoolean":
//            retValue = self.serializeBools(objects as! Bool)
//            break
//
//        case "_SwiftDeferredNSArray", "Array<String>":
//            retValue = self.serializeArray(objects as! Array<String>)
//            break
//
//        case "_NSContiguousString":
//            retValue = self.serializeStrings(objects as! String)
//            break
//
//        case "_NativeDictionaryStorageOwner<String, Array<String>>":
//            print("ALERT THIS DOES NOT WORK YET!")
//            retValue = self.serializeDictionary(objects as! Dictionary)
//            break
//
//        default:
//            retValue = "UNKNOWN \(String(type(of: objects)))"
//            break
//        }
//
		return retValue
	}

	/// *Internal function** for serializing arrays for php.serialize()
	///
	/// - Parameter objects: The array
	///
	/// - Returns: the serialized array
	private func serializeArray(_ objects: [String]) -> String {
		var retValue: String = "a:\(objects.count):{"

		for i in (0 ..< objects.count) {
			retValue += "i:\(i);"
			retValue += self.serializeStrings(objects[i])
		}

		retValue += "}"
		return retValue
	}

	/// *Internal function** for serializing Dictionary for php.serialize()
	///
	/// - Parameter objects: The Dictionary
	///
	/// - Returns: the serialized Dictionary
	private func serializeDictionary(_ objects: [String: AnyObject]) -> String {
		var retValue = "a:\(objects.count):{"
		var count: Int = 0

		for (item, value) in objects {
			// if string then i!

//            if (String(type(of: value)) == "_NSContiguousString") {// if a string then count.
//                retValue += self.serializeInts(count)
//            }
			retValue += self.serializeStrings(item)
			retValue += self.serializeType(value)

			count += 1
		}

		retValue += "}"

		return retValue
	}

	/// *Internal function** for serializing objects for php.serialize()
	///
	/// - Parameter objects: The Objects
	///
	/// - Returns: the serialized object (*not supported*)
	private func serializeObjects(_ objects: Any) -> String {
		return "O:13:\"NOT SUPPORTED\":1:{s:13:\"NOT SUPPORTED\"};"
	}

	/// *Internal function** for serializing bools for php.serialize()
	///
	/// - Parameter objects: The bool
	///
	/// - Returns: the serialized bool
	private func serializeBools(_ objects: Bool) -> String {
		return (objects) ? "b:1;" : "b:0;"
	}

	/// *Internal function** for serializing ints for php.serialize()
	///
	/// - Parameter objects: The int
	///
	/// - Returns: the serialized int
	private func serializeInts(_ objects: Int) -> String {
		return "i:\(objects);"
	}

	/// *Internal function** for serializing doubles for php.serialize()
	///
	/// - Parameter objects: The double
	///
	/// - Returns: the serialized double
	private func serializeDoubles(_ objects: Double) -> String {
		return "d:\(objects);"
	}

	/// *Internal function** for serializing strings for php.serialize()
	///
	/// - Parameter objects: The string
	///
	/// - Returns: the serialized string
	private func serializeStrings(_ objects: String) -> String {
		return "s:\(objects.count):\"\(objects)\";"
	}

	/// Set the type of a variable
	///
	/// - Parameter testVar: Any Variable
	///
	/// - Returns: Bool
	public func settype(_ testVar: inout Any, type: String) {
		print("Not Yet Supported")

		switch type {
		case "string":
            testVar = String(testVar as? String ?? NULL)

		case "array":
			testVar = [testVar]

		case "float", "integer", "int":
			testVar = self.intval(testVar)

		case "bool", "boolean":
			testVar = self.boolval(testVar)

		case "null":
			testVar = NULL

		default:
			break
		}
	}

	/// Get string value of a variable
	///
	/// - Parameter ob: Any Variable
	///
	/// - Returns: String
	public func strval(_ testVar: Any) -> String {
		return String(testVar as? String ?? NULL)
	}

	/// *Not supported (yet)** Creates a PHP value from a stored representation
	///
	/// - Parameter testVar: Any Variable
	///
	/// - Returns: Bool
	public func unserialize(_ testVar: Any) -> Any {
		print("Not Yet Supported")

		return false
	}

	/// Unset a given variable (**Unsupported**)
	///
	/// - Parameter testVar: Any Variable
	public func unset(_ testVar: Any) {
		print("Not Supported")
	}

	/// Dumps information about a variable
	///
	/// *Uses return(ob) and print(ob)!**
	///
	/// - Parameter ob: Expression
	/// - Parameter letReturn: return?
	///
	/// - Returns: Any
	public func var_dump(_ ob: Any, _ letReturn: Bool = false) -> Any {
		if letReturn {
			return "\(ob)"
		} else {
			print(ob)
		}
		return ""
	}

	/// Outputs or returns a parsable string representation of a variable
	///
	/// *Uses return(ob) and print(ob)!**
	///
	/// - Parameter ob: Expression
	/// - Parameter letReturn: return?
	///
	/// - Returns: Any
	public func var_export(_ ob: Any, _ letReturn: Bool = false) -> Any {
		// mixed var_export ( mixed $expression [, bool $return = false ] )
		return var_dump(ob, letReturn)
	}
}
