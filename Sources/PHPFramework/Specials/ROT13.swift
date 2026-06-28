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
/// File:    ROT13.swift
/// Created: 18-FEB-2016
/// Creator: Wesley de Groot | @0xWDG
/// Issue:   #1 (String Functions)
/// Prefix:  N/A
/// ---------------------------------------------------

import Foundation

/// *PHP.Framework** \
/// PHP In Swift*
///
/// ROT13 calculator class
class ROT13 {
	/// Encrypt function for ROT13
	///
	/// - Parameter str: the string what needs to be encoded
	///
	/// - Returns: ROT13 encoded string
	func encrypt(_ str: String) -> String {
		return self.crypt(str, rotateAmount: 13)
	}

	/// Decrypt function for ROT13
	///
	/// - Parameter str: the string what needs to be decoded
	///
	/// - Returns: ROT13 decoded string
	func decrypt(_ str: String) -> String {
		return self.crypt(str, rotateAmount: -13)
	}

	/// ROT13 Calculator
	///
	/// - Parameter str: the string what needs to be decoded
	/// - Parameter rotateAmount: the rotation amount
	///
	/// - Returns: ROT13 en/decoded string
	func crypt(_ str: String, rotateAmount: Int) -> String {
		return "".join(str.map { (char) -> String in
				let num = String(char).unicodeScalars
				let characterIntVal = num.first!.value
				var rotatedIntVal = 0

				if Int(characterIntVal) + rotateAmount > 126 {
					// To high..
					rotatedIntVal = ((Int(characterIntVal) + rotateAmount) - 26)
				} else {
					// Well done.
					rotatedIntVal = Int(characterIntVal) + rotateAmount
				}

				return String(UnicodeScalar(rotatedIntVal)!)
			}
		)
	}
}
