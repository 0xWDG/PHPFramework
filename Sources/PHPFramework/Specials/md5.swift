/// _____    _    _   _____    ______                                           _
/// |  __ \  | |  | | |  __ \  |  ____|                                         | |
/// | |__) | | |__| | | |__) | | |__ _ __ __ _ _ __ ___   _____      _____  _ __| | __
/// |  ___/  |  __  | |  ___/  |  __| '__/ _` | '_ ` _ \ / _ \ \ /\ / / _ \| '__| |/ /
/// | |      | |  | | | |  _   | |  | | | (_| | | | | | |  __/\ V  V / (_) | |  |   <
/// |_|      |_|  |_| |_| (_)  |_|  |_|  \__,_|_| |_| |_|\___| \_/\_/ \___/|_|  |_|\_\
///
///
/// Copyright (c) 2016 Wesley de Groot (http://www.wesleydegroot.nl), WDGWV (http://www.wdgwv.com)
///
///
/// Variable prefixes:
/// PFS = PHP.Framework Shared
/// PFT = PHP.Framework Tests (internal)
/// PFI = PHP.Framework Internal
/// PFU = PHP.Framework Unspecified
///
/// usage:
/// php.the_php_function(and, parameters, ofcourse)
///
/// documentation:
/// http://wdg.github.io/php.framework/
///
/// wiki:
/// https://github.com/wdg/php.framework/wiki
///
/// questions/bugs:
/// https://github.com/wdg/php.framework/issues
///
/// ---------------------------------------------------
/// File:    md5.swift
/// Created: 29-FEB-2016
/// Creator: Wesley de Groot | @0xWDG
/// Issue:   N/A
/// Prefix:  N/A
/// ---------------------------------------------------

import Foundation

/// MD5Hashing
///
/// A real native Swift 2
/// MD5 function
///
/// Created by Wesley de Groot. (Twitter: @wesdegroot)
///
/// GitHub: @wdg
///
/// © 2016 WDGWV/Wesley de Groot. All rights reserved.
///
/// Free to use, but leave this header intact.
///
/// Thanks for using!
private class MD5Hashing {
    private let shift: [UInt32] = [7, 12, 17, 22, 5, 9, 14, 20, 4, 11, 16, 23, 6, 10, 15, 21]
    private let table: [UInt32] = (0 ..< 64).map {
        UInt32(0x100000000 * abs(sin(Double($0 + 1))))
    }

	/// MD5 Generator Function.
	///
	/// - Parameter str: The string what needs to be encoded.
	/// - Returns: MD5 hashed string
	public func md5(_ str: String) -> String {
		return str
	}
}

extension String {
	/// Make a MD5 Hash for the string.
	///
	/// - Returns: MD5 hashed string
    public var md5: String {
        return MD5Hashing().md5(self)
    }
}

/// md5 Function.
///
/// - Parameter str: The string what needs to be encoded.
/// - Returns: MD5 hashed string
public func md5(_ str: String) -> String {
	return str.md5
}
