//
//  PHPFrameworkPHPBaseTests.swift
//  PHPFramework
//
//  Created by Wesley de Groot on 13-02-16.
//  Copyright © 2016 WDGWV. All rights reserved.
//

import Foundation
@testable import PHPFramework
import XCTest

extension PHPFrameworkTests {
	func test_cli_set_process_title() {
		// if no crash then passed
		php.cli_set_process_title(E)
	}

	func test_extension_loaded() {
		// if no crash then passed
		php.noop(php.extension_loaded(E))
	}

	func test_gc_collect_cycles() {
		// if no crash then passed
		php.gc_collect_cycles()
	}

	func test_gc_disable() {
		// if no crash then passed
		php.gc_disable()
	}

	func test_gc_enable() {
		// if no crash then passed
		php.gc_enable()
	}

	func test_gc_enabled() {
		// if no crash then passed
		php.noop(php.gc_enabled())
	}

	func test_gc_mem_caches() {
		// if no crash then passed
		php.gc_mem_caches()
	}

	func test_get_defined_constants() {
		XCTAssertNotNil(php.get_defined_constants())
	}

	func test_get_extension_funcs() {
		XCTAssertNotNil(php.get_extension_funcs())
	}

	func test_get_included_files() {
		XCTAssertNotNil(php.get_included_files())
	}

	func test_get_loaded_extensions() {
		XCTAssertNotNil(php.get_loaded_extensions())
	}

	func test_get_required_files() {
		XCTAssertNotNil(php.get_required_files())
	}

	func test_getenv() {
		XCTAssertNotNil(php.getenv())
	}

	func test_getlastmod() {
		XCTAssertNotNil(php.getlastmod())
	}

	func test_getopt() {
		XCTAssertNotNil(php.getopt())
	}

	func test_ini_alter() {
		// if no crash then pass
		php.ini_alter()
	}

	func test_ini_get_all() {
		// if no crash then pass
		php.ini_get_all()
	}

	func test_test_ini_get() {
		// if no crash then pass
		php.noop(php.ini_get())
	}

	func test_ini_restore() {
		// if no crash then pass
		php.ini_restore()
	}

	func test_ini_set() {
		// if no crash then pass
		php.ini_set()
	}

    func test_magic_quotes_runtime() {
        // if no crash then pass
        php.magic_quotes_runtime("e")
    }

    func test_main() {
        // if no crash then pass
        php.main()
    }

    func test_php_ini_loaded_file() {
        // if no crash then pass
        php.php_ini_loaded_file()
    }

    func test_phpcredits() {
        XCTAssertNotNil(php.phpcredits())
    }

    func test_phpinfo() {
        XCTAssertNotNil(php.phpinfo())
    }

    func test_putenv() {
        // if no crash then pass
        php.putenv()
    }

    func test_restore_include_path() {
        // if no crash then pass
        php.restore_include_path()
    }

    func test_set_include_path() {
        // if no crash then pass.
        php.set_include_path(E)
    }

    func test_set_magic_quotes_runtime() {
        // if no crash then pass
        php.set_magic_quotes_runtime("e")
    }

    func test_set_time_limit() {
        // if no crash then pass
        php.set_time_limit(1)
    }

    func test_version_compare() {
        XCTAssertTrue(php.version_compare("7.0.0", "7.0.0"))
    }

    func test_dl() {
        // pass.
    }

    func test_cli_get_process_title() {
        XCTAssertEqual(php.cli_get_process_title(), "Bash")
    }

    func test_get_cfg_var() {
        XCTAssertEqual(php.get_cfg_var(E), 1)
    }

    func test_get_current_user() {
        XCTAssertEqual(php.get_current_user(), "PHP.Framework")
    }

    func test_get_include_path() {
        XCTAssertEqual(php.get_include_path(), E)
    }

    func test_get_magic_quotes_gpc() {
        XCTAssertEqual(php.get_magic_quotes_gpc(), 1)
    }

    func test_get_magic_quotes_runtime() {
        XCTAssertEqual(php.get_magic_quotes_runtime(), 1)
    }

    func test_get_resources() {
        XCTAssertEqual(php.get_resources(), 1)
    }

    func test_getmygid() {
        XCTAssertEqual(php.getmygid(), 1)
    }

    func test_getmyinode() {
        XCTAssertEqual(php.getmyinode(), 1)
    }

    func test_getmypid() {
        XCTAssertEqual(php.getmypid(), 1)
    }

    func test_getmyuid() {
        XCTAssertEqual(php.getmyuid(), 1)
    }

    func test_getrusage() {
        XCTAssertEqual(php.getrusage(), 1)
    }

    func test_memory_get_peak_usage() {
        XCTAssertEqual(php.memory_get_peak_usage(), 1)
    }

    func test_memory_get_usage() {
        XCTAssertEqual(php.memory_get_usage(), 1)
    }

    func test_php_ini_scanned_files() {
        XCTAssertEqual(php.php_ini_scanned_files(), "")
    }

    func test_php_logo_guid() {
        XCTAssertEqual(php.php_logo_guid(), "PHPE9568F34-D428-11d2-A769-00AA001ACF42")
    }

    func test_php_sapi_name() {
        XCTAssertEqual(php.php_sapi_name(), "cli")
    }

    func test_php_uname() {
        XCTAssertNotNil(php.php_uname()) // Dynamic.
    }

    func test_phpversion() {
        XCTAssertEqual(php.phpversion(), "7.0.0")
    }

    func test_sys_get_temp_dir() {
        XCTAssertNotNil(php.sys_get_temp_dir())
    }

    func test_zend_logo_guid() {
        XCTAssertEqual(php.zend_logo_guid(), "PHPE9568F35-D428-11d2-A769-00AA001ACF42")
    }

    func test_zend_thread_id() {
        XCTAssertEqual(php.zend_thread_id(), "720f2ca4-bd59-11e5-9912-ba0be0483c18")
    }

    func test_zend_version() {
        XCTAssertEqual(php.zend_version(), "3.0.0")
    }
}
