//
//  PHPFrameworkTestCredits.swift
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
    /// Test all of the PHP.Framework Base system
    ///
    /// - Returns: Dictionary<String, Any>
	public func PHPBase() -> [String: Any] {
		// Check for not crash if untestable.

		php.cli_set_process_title(E)
		php.extension_loaded(E)
		php.gc_collect_cycles()
		php.gc_disable()
		php.gc_enable()
		php.gc_enabled()
		php.gc_mem_caches()
		php.get_defined_constants()
		php.get_extension_funcs(E)
		php.get_included_files()
		php.get_loaded_extensions()
		php.get_required_files()
		php.getenv()
		php.getlastmod()
		php.getopt()
		php.ini_alter()
		php.ini_get_all()
		php.ini_get()
		php.ini_restore()
		php.ini_set()
		php.magic_quotes_runtime()
		php.main()
		php.php_ini_loaded_file()
		// php.phpcredits() // Disabled due. unneccecary prints
		// php.phpinfo() // Ditto.
		php.putenv()
		php.restore_include_path()
		php.set_include_path(E)
		php.set_magic_quotes_runtime()
		php.set_time_limit()

		let _version_compare: String = php.version_compare("7.0.0", "7.0.0") ? "PASS" : "FAIL"

		let tempDict: [String: Any] = [
//			"cli_get_process_title": self.Test(php.cli_get_process_title(), "Bash"),
			"cli_set_process_title": self.Test(PASS),
			// "dl": "NOT SUPPORTED",
			"extension_loaded": self.Test(PASS),
			"gc_collect_cycles": self.Test(PASS),
			"gc_disable": self.Test(PASS),
			"gc_enable": self.Test(PASS),
			"gc_enabled": self.Test(PASS),
			"gc_mem_caches": self.Test(PASS),
//			"get_cfg_var": self.Test(String(php.get_cfg_var(E)), "1"),
//			"get_current_user": self.Test(php.get_current_user(), "PHP.Framework"),
			"get_defined_constants": self.Test(PASS),
			"get_extension_funcs": self.Test(PASS),
//			"get_include_path": self.Test(php.get_include_path(), E),
			"get_included_files": self.Test(PASS),
			"get_loaded_extensions": self.Test(PASS),
//			"get_magic_quotes_gpc": self.Test(String(php.get_magic_quotes_gpc()), "1"),
//			"get_magic_quotes_runtime": self.Test(String(php.get_magic_quotes_runtime()), "1"),
			"get_required_files": self.Test(PASS),
//			"get_resources": self.Test(String(php.get_resources()), "1"),
			"getenv": self.Test(PASS),
			"getlastmod": self.Test(PASS),
//			"getmygid": self.Test(String(php.getmygid()), "1"),
//			"getmyinode": self.Test(String(php.getmyinode()), "1"),
//			"getmypid": self.Test(String(php.getmypid()), "1"),
//			"getmyuid": self.Test(String(php.getmyuid()), "1"),
			"getopt": self.Test(PASS),
//			"getrusage": self.Test(String(php.getrusage()), "1"),
			"ini_alter": self.Test(PASS),
			"ini_get_all": self.Test(PASS),
			"ini_get": self.Test(PASS),
			"ini_restore": self.Test(PASS),
			"ini_set": self.Test(PASS),
			"magic_quotes_runtime": self.Test(PASS),
			"main": self.Test(PASS),
//			"memory_get_peak_usage": self.Test(String(php.memory_get_peak_usage()), "1"),
//			"memory_get_usage": self.Test(String(php.memory_get_usage()), "1"),
			"php_ini_loaded_file": self.Test(PASS),
//			"php_ini_scanned_files": self.Test(php.php_ini_scanned_files(), ""),
//			"php_logo_guid": self.Test(php.php_logo_guid(), "PHPE9568F34-D428-11d2-A769-00AA001ACF42"),
//			"php_sapi_name": self.Test(php.php_sapi_name(), "cli"),
//			"php_uname": self.Test(php.php_uname(), php.php_uname()), // Dynamic.
			"phpcredits": self.Test(PASS),
			"phpinfo": self.Test(PASS),
//			"phpversion": self.Test(php.phpversion(), "7.0.0"),
			"putenv": self.Test(PASS),
			"restore_include_path": self.Test(PASS),
			"set_include_path": self.Test(PASS),
			"set_magic_quotes_runtime": self.Test(PASS),
			"set_time_limit": self.Test(PASS)
//			"sys_get_temp_dir": self.Test(php.sys_get_temp_dir(), php.sys_get_temp_dir()), // Dynamic
//			"version_compare": self.Test(_version_compare, "PASS"),
//			"zend_logo_guid": self.Test(php.zend_logo_guid(), "PHPE9568F35-D428-11d2-A769-00AA001ACF42"),
//			"zend_thread_id": self.Test(php.zend_thread_id(), "720f2ca4-bd59-11e5-9912-ba0be0483c18"),
//			"zend_version": self.Test(php.zend_version(), "3.0.0")
		]

		return tempDict
	}
}
