//
// PHP Framework
// PHPFramework is a collection of the most common PHP functions, implemented in Swift.
//
// https://github.com/0xWDG/PHPFramework
//
// File:    PHPFrameworkDirectory.swift
// Created: 15-JAN-2016
// Creator: Wesley de Groot | @0xWDG
// Issue:   #2 (PHP Base Functions)
// Prefix:  PFB

import Foundation

/// PHPFramework
///
/// A Swift framework inspired by some PHP Functions.
extension PHPFramework {
	/// Returns the current process title
	///
	/// - Returns: Returns the current process title
	public func cli_get_process_title() -> String {
		return "Bash" // We will fake it (due Sandboxing)
	}

	/// *Dummy** Sets the process title
	public func cli_set_process_title(_ str: String) {}

	/// *Dummy** Loads a PHP extension at runtime
	///
	/// - Parameter str: Module name
	///
	/// - Returns: false
	public func dl(_ str: String) -> Bool {
		print("Sorry this function is not supported due Sandboxing")
		return false
	}

	/// *Dummy** Find out whether an extension is loaded
	///
	/// - Parameter str: The module name
	///
	/// - Returns: false
	public func extension_loaded(_ str: String) -> Bool {
		return false
	}

	/// *Dummy** Forces collection of any existing garbage cycles
	public func gc_collect_cycles() {}

	/// *Dummy** Deactivates the circular reference collector
	public func gc_disable() {}

	/// *Dummy** Activates the circular reference collector
	public func gc_enable() {}

	/// *Dummy** Returns status of the circular reference collector
	///
	/// - Returns: true
	public func gc_enabled() -> Bool {
		return true
	}

	/// *Dummy** Reclaims memory used by the Zend Engine memory manager
	public func gc_mem_caches() {}

	/// *Dummy** Gets the value of a PHP configuration option
	///
	/// - Parameter String: The parameter
	///
	/// - Returns: 1
	public func get_cfg_var(_ str: String) -> Int {
		return 1
	}

	/// Gets the name of the owner of the current PHP script
	///
	/// - Returns: PHP.Framework
	public func get_current_user() -> String {
		return "PHP.Framework"
	}

	/// *Dummy** Returns an associative array with the names of all the constants and their values
	///
	/// - Returns: A Static list, a *Dictionary*
    public func get_defined_constants(_ cat: Bool = false) -> [String: Any] {
        if cat {
            print("parameter not supported")
        }
		return PHPAllConstants
	}

	/// *Dummy** Returns an array with the names of the functions of a module
	///
	/// - Returns: Array ["Not", "Supported"]
	public func get_extension_funcs(_ str: String? = "") -> [String] {
		return ["Not", "Supported"]
	}

	/// Gets the current include_path configuration option
	///
	/// - Returns: current directory
	public func get_include_path() -> String {
		return self.getcwd()
	}

	/// *Dummy** Returns an array with the names of included or required files
	///
	/// - Returns: Array ["Not", "Supported"]
	public func get_included_files() -> [String] {
		return ["Not", "Supported"]
	}

	/// *Dummy** Returns an array with the names of all modules compiled and loaded
	///
	/// - Returns: Array ["Not", "Supported"]
	public func get_loaded_extensions() -> [String] {
		return ["Not", "Supported"]
	}

	/// *Dummy** Gets the current configuration setting of magic_quotes_gpc
	///
	/// - Returns: 1
	public func get_magic_quotes_gpc() -> Int {
		return 1
	}

	/// *Dummy** Gets the current active configuration setting of magic_quotes_runtime
	///
	/// - Returns: 1
	public func get_magic_quotes_runtime() -> Int {
		return 1
	}

	/// Alias of ``get_included_files()``
	///
	/// - Returns: Array
	public func get_required_files() -> [String] {
		return get_included_files()
	}

	/// *Dummy** Returns active resources
	///
	/// - Returns: 1
	public func get_resources(_ str: String? = "") -> Int {
		return 1
	}

	/// Gets the value of an environment variable
	/// Alias of ``getopt()``
	public func getenv() -> String {
		return getopt()
	}

	/// *Dummy** Gets time of last page modification
	///
	/// - Parameter file: The file
	public func getlastmod(_ file: String? = "") -> Bool {
		return false
	}

	/// *Dummy** Get PHP script owner's GID
	///
	/// - Returns: 1
	public func getmygid() -> Int {
		return 1
	}

	/// *Dummy** Gets the inode of the current script
	///
	/// - Returns: 1
	public func getmyinode() -> Int {
		return 1
	}

	/// *Dummy** Gets PHP's process ID
	///
	/// - Returns: 1
	public func getmypid() -> Int {
		return 1
	}

	/// *Dummy** Gets PHP script owner's UID
	///
	/// - Returns: 1
	public func getmyuid() -> Int {
		return 1
	}

	/// *for non OS X a Dummy**\
	/// Gets options from the command line argument list
	///
	/// - Returns: Command line arguments
	public func getopt() -> String {
		#if os(OSX)
        return ""
        // TODO: Fix this for Swift 5+
		// return Process.arguments.flatMap{ $0 }.joined(separator: " ")
		#else
		return ""
		#endif
	}

	/// *Dummy** Gets the current resource usages
	///
	/// - Returns: 1
	public func getrusage() -> Int {
		return 1
	}

	/// Alias of ``ini_set(_:_:)``
	///
	/// - Parameter someThing: Any
	/// - Parameter someOtherThing: Any
	public func ini_alter(_ someThing: Any? = "", _ SomeOtherThing: Any? = "") {
		self.ini_set(someThing, SomeOtherThing)
	}

	/// *Dummy** Gets all configuration options
	///
	/// - Parameter someThing: Any
	/// - Parameter someOtherThing: Any
	public func ini_get_all() {}

	/// *Dummy** Gets the value of a configuration option
	///
	/// - Parameter someThing: Any
	/// - Parameter someOtherThing: Any
	///
	/// - Returns: true
	public func ini_get(_ someThing: Any? = "", _ SomeOtherThing: Any? = "") -> Bool {
		return true
	}

	/// *Dummy** Restores the value of a configuration option
	///
	/// - Parameter someThing: Any
	/// - Parameter someOtherThing: Any
	public func ini_restore(_ someThing: Any? = "", _ SomeOtherThing: Any? = "") {}

	/// *Dummy** Sets the value of a configuration option
	///
	/// - Parameter someThing: Any
	/// - Parameter someOtherThing: Any
	public func ini_set(_ someThing: Any? = "", _ SomeOtherThing: Any? = "") {}

	/// *Dummy** Alias of ``set_magic_quotes_runtime(_:)``
	///
	/// - Parameter someThing: Any
	public func magic_quotes_runtime(_ someThing: Any = "") {
        set_magic_quotes_runtime(someThing)
    }

	/// *Dummy** Dummy for main
	///
	/// Void*, will never return whatever
	public func main() {}

	/// *Dummy** Returns the peak of memory allocated by PHP
	///
	/// - Returns: 1
	public func memory_get_peak_usage() -> Int {
		return 1
	}

	/// *Dummy** Returns the amount of memory allocated to PHP
	///
	/// - Returns: 1
	public func memory_get_usage() -> Int {
		return 1
	}

	/// *Dummy** Retrieve a path to the loaded php.ini file
	public func php_ini_loaded_file() { }

	/// *Dummy** Return a list of .ini files parsed from the additional ini dir
	///
	/// - Returns: empty
	public func php_ini_scanned_files() -> String {
		return ""
	}

	/// Gets the logo guid
	///
	/// - Returns: PHPE9568F34-D428-11d2-A769-00AA001ACF42
	public func php_logo_guid() -> String {
		return "PHPE9568F34-D428-11d2-A769-00AA001ACF42"
	}

	/// Returns the type of interface between web server and PHP
	///
	/// - Returns: cli
	public func php_sapi_name() -> String {
		return "cli"
	}

	/// Returns information about the operating system PHP is running on
	///
	/// - Returns: Your username
	public func php_uname() -> String {
		#if os(iOS)
		let strOS: String = "iOS"
		#elseif os(OSX)
		let strOS: String = "Mac OS X"
		#elseif os(watchOS)
		let strOS: String = " Watch"
		#elseif os(tvOS)
		let strOS: String = " TV"
		#else
		let strOS: String = "PHP.Framework"
		#endif

		return (NSUserName() != "") ? NSUserName() : strOS
	}

	/// Prints out the credits for PHP
	///
	/// - Returns: Prints out the credits for PHP
	public func phpcredits() -> String {
		return PFSCredits
	}

	/// Outputs information about PHP's configuration
	///
	/// - Returns: Outputs information about PHP's configuration
	public func phpinfo() -> String {
		return PFSCredits
	}

	/// Gets the current PHP version
	///
	/// - Returns: The version String (7.0.0)
	public func phpversion() -> String {
		return "7.0.0"
	}

	/// *Dummy** Sets the value of an environment variable
	///
	/// - Parameter someThing: Any
	/// - Parameter someOtherThing: Any
	public func putenv(_ someThing: Any = "", _ SomeOtherThing: Any? = "") {}

	/// *Dummy** Restores the value of the include_path configuration option (Not done)
	public func restore_include_path() {}

	/// *Dummy** Sets the include_path configuration option (Not done)
	///
	/// - Parameter String: The include path
	public func set_include_path(_ str: String) {}

	/// *Dummy** Sets the current active configuration setting of magic_quotes_runtime
	///
	/// - Parameter ob: Any
	public func set_magic_quotes_runtime(_ ob: Any = "") {}

	/// *Dummy** Limits the maximum execution time
	///
	/// - Parameter Count: The maximum amount of time
	///
	/// - Returns: The input String
	public func set_time_limit(_ count: Int = 30) {}

	/// Returns directory path used for temporary files
	///
	/// - Returns: The path of the temporary directory
	public func sys_get_temp_dir() -> String {
		return NSTemporaryDirectory()
	}

	/// Compares two "PHP-standardized" version number strings
	///
	/// - Parameter smallerVersion: version
	/// - Parameter largerVersion: version
	/// - Parameter compareOperator: *Dummy* compare operator (default ==)
	///
	/// - Returns: Bool true/false
	public func version_compare(
        _ smallerVersion: String,
        _ largerVersion: String,
        _ compareOperator: String = "=="
    ) -> Bool {
		if compareOperator != "==" {
			print("Compare operator is not supported")
		}

		var result = true

		let smaller = explode(smallerVersion, ".")
		let larger = explode(largerVersion, ".")

		let maxLength = max(smaller.count, larger.count)

        for i in (0...maxLength) {
			let s = i < smaller.count ? smaller[i] : "0"
			let l = i < larger.count ? larger[i] : "0"
			if s != l {
				result = s < l
				break
			}
		}
		return result
	}

	/// Gets the Zend guid
	///
	/// - Returns: PHPE9568F35-D428-11d2-A769-00AA001ACF42
	public func zend_logo_guid() -> String {
		return "PHPE9568F35-D428-11d2-A769-00AA001ACF42"
	}

	/// Returns a unique identifier for the current thread
	///
	/// - Returns: 720f2ca4-bd59-11e5-9912-ba0be0483c18
	public func zend_thread_id() -> String {
		return "720f2ca4-bd59-11e5-9912-ba0be0483c18"
	}

	/// Gets the version of the current Zend engine
	///
	/// - Returns: The version String
	public func zend_version() -> String {
		return "3.0.0"
	}

}
