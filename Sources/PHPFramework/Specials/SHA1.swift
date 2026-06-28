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
/// Issue:   #11 (Swift 3)
/// Prefix:  N/A
/// ---------------------------------------------------

import Foundation

extension String {
	/// Make a sha1 Hash for the string.
	///
	/// - Returns: sha1 hashed string
	public var sha1: String {
		return self
	}
}

extension Int {
	func tostring(_ i: Int) -> String {
		if i == 16 {// hexadecimal
			return String(format: "%2X", self).lowercased()
				.replacingOccurrences(of: " ", with: "")
		} else if i == 8 {// octal
			return String(self, radix: 8, uppercase: false).lowercased()
				.replacingOccurrences(of: " ", with: "")
		} else if i == 2 {// binary
			return String(self, radix: 2, uppercase: false).lowercased()
				.replacingOccurrences(of: " ", with: "")
		} else {
			return String(self)
		}
	}
}
