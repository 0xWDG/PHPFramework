//
// PHP Framework
// PHPFramework is a collection of the most common PHP functions, implemented in Swift.
//
// https://github.com/0xWDG/PHPFramework
//
// File:    PHPFrameworkStringFunctions.swift
// Created: 15-JAN-2016
// Creator: Wesley de Groot | @0xWDG
// Issue:   #1 (String Functions)
// Prefix:  PFS

import Foundation
#if os(Linux)
import Glibc
#else
import Darwin
#endif
// import CryptoSwift

/// PHPFramework
///
/// A Swift framework inspired by some PHP Functions.
extension PHPFramework {
	/// Return ASCII value of character
	///
	/// - Parameter s: the character
	///
	/// - Returns: the ascii number of the character
	public func ord(_ s: String) -> Int {
		guard let first = s.unicodeScalars.first else {
			return 0
		}

		return Int(first.value)
	}

	/// Return a specific character
	///
	/// - Parameter s: the chr's number
	///
	/// - Returns: the character as given in ascii
	public func chr(_ s: Int) -> String {
        guard let scalar = UnicodeScalar(s) else {
            return ""
        }

        return String(scalar)
	}

	/// Set/get the various assert flags (Not done)
	///
	/// - Parameter String: The input string
	///
	/// - Returns: The input String
	public func assert_options(_ str: String) -> String {
		print("Sorry this function is not supported yet!")
		return str
	}

	/// Quote string with slashes in a C style (not done)
	///
	/// - Parameter str: The String
	///
	/// - Returns: The String
	public func addcslashes(_ str: String) -> String {
		return self.addslashes(str)
	}

	/// Quote string with slashes
	///
	/// Returns a string with backslashes before characters that need to be escaped.
	/// These characters are single quote ('), double quote ("), backslash (\) and NUL (the NULL byte).
	///
	/// - Parameter str: the string
	///
	/// - Returns: the string with backslashes
	public func addslashes(_ str: String!) -> String {
		return str
            .replacingOccurrences(of: "\\", with: "\\\\")
			.replacingOccurrences(of: "'", with: "\\'")
			.replacingOccurrences(of: "\"", with: "\\\"")
			.replacingOccurrences(of: "\0", with: "\\\0")
	}

	/// Convert binary data into hexadecimal representation
	///
	/// - Parameter str: The String
	///
	/// - Returns: The String
	public func bin2hex(_ str: Int) -> Int {
		let scanner = Scanner(string: String(str))
		var result: UInt32 = 0
		if scanner.scanHexInt32(&result) {
			return Int(result)
		}
		// return Int(str, radix: 16)! // Can couse for crash if not a binary number
		return 0
	}

	/// Alias of ``rtrim(_:_:)``
	///
	/// chrs includes standard:
	///
	/// " " (ASCII 32 (0x20)), an ordinary space.
	///
	/// "\t" (ASCII 9 (0x09)), a tab.
	///
	/// "\n" (ASCII 10 (0x0A)), a new line (line feed).
	///
	/// "\r" (ASCII 13 (0x0D)), a carriage return.
	///
	/// "\0" (ASCII 0 (0x00)), the NULL-byte.
	///
	/// "\x0B" (ASCII 11 (0x0B)), a vertical tab.
	///
	/// - Parameter str: The String
	/// - Parameter chrs: Characters to trim
	///
	/// - Returns: The String
	public func chop(_ str: String, _ chrs: String? = "_ALL_") -> String {
		return self.rtrim(str, chrs)
	}

	/// Split a string into smaller chunks (not done)
	///
	/// - Parameter str: The String
	/// - Parameter length: the lenght (default 76)
	/// - Parameter end: the end (default \r\n)
	///
	/// - Returns: The String
	public func chunk_split(_ str: String, _ length: Int = 76, _ end: String? = "\r\n") -> String {
		guard length > 0 else {
			return str
		}

		var myCount: Int = 0
		var newString: String = ""
		let lineEnd = end ?? ""

		for character in str {
			newString += String(character)

			if myCount == (length - 1) {
				newString += lineEnd
				myCount = 0
			} else {
				myCount += 1
			}
		}

		return newString
	}

	/// *Not Supported** Convert from one Cyrillic character set to another
	///
	/// - Parameter str: The String
	///
	/// - Returns: The String
	public func convert_cyr_string(_ str: String) -> String {
		return str
	}

	/// Decode a uuencoded string
	///
	/// - Parameter str: The String
	///
	/// - Returns: The String
	public func convert_uudecode(_ str: String) -> String {
		var decodedBytes: [UInt8] = []

		for rawLine in str.components(separatedBy: .newlines) {
			guard let firstCharacter = rawLine.utf8.first else {
				continue
			}

			let expectedCount = Int((firstCharacter - 32) & 0x3f)
			guard expectedCount > 0 else {
				continue
			}

			let encodedBytes = Array(rawLine.utf8.dropFirst())
			var lineBytes: [UInt8] = []
			lineBytes.reserveCapacity(expectedCount)

			for chunkStart in stride(from: 0, to: encodedBytes.count, by: 4) {
				let chunk = encodedBytes[chunkStart..<min(chunkStart + 4, encodedBytes.count)]
				guard chunk.count == 4 else {
					break
				}

				let values = chunk.map { ($0 - 32) & 0x3f }
				lineBytes.append((values[0] << 2) | (values[1] >> 4))
				lineBytes.append((values[1] << 4) | (values[2] >> 2))
				lineBytes.append((values[2] << 6) | values[3])
			}

			decodedBytes.append(contentsOf: lineBytes.prefix(expectedCount))
		}

		return String(bytes: decodedBytes, encoding: .utf8) ?? ""
	}

	/// Uuencode a string
	///
	/// - Parameter str: The String
	///
	/// - Returns: The String
	public func convert_uuencode(_ str: String) -> String {
		let bytes = Array(str.utf8)
		var encodedLines: [String] = []
		encodedLines.reserveCapacity((bytes.count / 45) + 2)

		for chunkStart in stride(from: 0, to: bytes.count, by: 45) {
			let chunk = Array(bytes[chunkStart..<min(chunkStart + 45, bytes.count)])
			var line = String(uuEncodedCharacter(UInt8(chunk.count)))

			for tripleStart in stride(from: 0, to: chunk.count, by: 3) {
				let byte0 = chunk[tripleStart]
				let byte1 = tripleStart + 1 < chunk.count ? chunk[tripleStart + 1] : 0
				let byte2 = tripleStart + 2 < chunk.count ? chunk[tripleStart + 2] : 0

				line.append(uuEncodedCharacter(byte0 >> 2))
				line.append(uuEncodedCharacter(((byte0 << 4) | (byte1 >> 4)) & 0x3f))
				line.append(uuEncodedCharacter(((byte1 << 2) | (byte2 >> 6)) & 0x3f))
				line.append(uuEncodedCharacter(byte2 & 0x3f))
			}

			encodedLines.append(line)
		}

		encodedLines.append("`")
		return encodedLines.joined(separator: "\n")
	}

	/// Return information about characters used in a string
	///
	/// - Parameter str: The String
	///
	/// - Returns: Array Int (255 x 0)
	public func count_chars(_ str: String) -> [Int] {
		return [
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        ]
	}

	/// Calculates the crc32 polynomial of a string
	///
	/// - Parameter str: The String
	///
	/// - Returns: The String
	public func crc32(_ str: String) -> String {
		return str.crc32
	}

	/// One-way string hashing (DES)
	///
	/// - Parameter str: The String
	///
	/// - Returns: The String
	public func crypt(_ str: String, _ salt: String) -> String {
		#if os(Linux)
		guard let result = Glibc.crypt(str, salt) else {
			return str
		}
		#else
		guard let result = Darwin.crypt(str, salt) else {
			return str
		}
		#endif

		return String(cString: result)
	}

	/// *PHP.Framework**\
	/// Output one or more strings\
	/// via swift's print function*
	///
	/// - Parameter ob: the object
	public func echo(_ ob: AnyObject ...) {
		print(ob)
	}

	/// Split a string by string
	///
	/// - Parameter str: The String
	/// - Parameter split: How to split
	/// - Parameter limit: The limit (Not supported)
	///
	/// - Returns: The String Splitted as a array.
	public func explode(_ str: String, _ split: String = " ", _ limit: Int = 0) -> [String] {
		if limit != 0 {
			print("Sorry limits are not supported (yet)")
		}

		return Array(str.components(separatedBy: split))
	}

	/// *PHP.Framework**\
	/// Write a formatted string to a stream
	/// via swift's print function*
	///
	/// *WARNING: use String(format:...)**
	///
	/// - Parameter ob: the object
	public func fprintf(_ ob: AnyObject ...) {
		print(ob)
	}

	/// Returns the translation table used by htmlspecialchars and htmlentities
	///
	/// - Returns: The table ([String: Character])
	public func get_html_translation_table(_ str: String) -> [String: Character] {
		return "".getHTMLEntities()
	}

	/// *Not Supported** Convert logical Hebrew text to visual text
	///
	/// - Parameter str: The String
	///
	/// - Returns: The String
	public func hebrev(_ str: String) -> String {
		return str
	}

	/// *Not supported** Convert logical Hebrew text to visual text with newline conversion
	///
	/// - Parameter str: The String
	///
	/// - Returns: The String
	public func hebrevc(_ str: String) -> String {
		return str
	}

	/// Decodes a hexadecimally encoded binary string (not done)
	///
	/// - Parameter str: The String
	///
	/// - Returns: The String
	public func hex2bin(_ str: String) -> Int {
		return Int(strtoul(str, nil, 16))
	}

	/// Convert all HTML entities to their applicable characters
	///
	/// - Parameter str: The String
	/// - Parameter flags: the flags (*will be ignored*)
	/// - Parameter encoding: the encoding (*will be ignored*)
	/// - Parameter double_encoding: bool (*will be ignored*)
	///
	/// - Returns: The String
	public func html_entity_decode(
        _ str: String,
        _ flags: Int? = 0,
        _ encoding: Int? = 0,
        _ double_encode: Bool? = false
    ) -> String {
		return str.decodeHTML()
	}

	/// Convert all applicable characters to HTML entities
	///
	/// - Parameter str: The String
	/// - Parameter flags: the flags (*will be ignored*)
	/// - Parameter encoding: the encoding (*will be ignored*)
	/// - Parameter double_encoding: bool (*will be ignored*)
	///
	/// - Returns: The String
	public func htmlentities(
        _ str: String,
        _ flags: Int? = 0,
        _ encoding: Int? = 0,
        _ double_encode: Bool? = false
    ) -> String {
		return str.encodeHTML()
	}

	/// Convert special HTML entities back to characters
	///
	/// - Parameter str: The String
	/// - Parameter flags: the flags (*will be ignored*)
	/// - Parameter encoding: the encoding (*will be ignored*)
	/// - Parameter double_encoding: bool (*will be ignored*)
	///
	/// - Returns: The String
	public func htmlspecialchars_decode(
        _ str: String,
        _ flags: Int? = 0,
        _ encoding: Int? = 0,
        _ double_encode: Bool? = false
    ) -> String {
		return str.decodeHTML()
	}

	/// Convert special characters to HTML entities
	///
	/// - Parameter str: The String
	/// - Parameter flags: the flags (*will be ignored*)
	/// - Parameter encoding: the encoding (*will be ignored*)
	/// - Parameter double_encoding: bool (*will be ignored*)
	///
	/// - Returns: The String
	public func htmlspecialchars(
        _ str: String,
        _ flags: Int? = 0,
        _ encoding: Int? = 0,
        _ double_encode: Bool? = false
    ) -> String {
		print("Sorry this function is not done")

		return str.encodeHTML()
	}

	/// Join array elements with a string
	///
	/// - Parameter glue: The glue
	/// - Parameter arr: The array to implode
	///
	/// - Returns: The String
	public func implode(_ glue: String, _ arr: [String]) -> String {
		return arr.joined(separator: glue)
	}

	/// Alias of ``implode(_:_:)``
	///
	/// - Parameter glue: The glue
	/// - Parameter arr: The array to implode
	///
	/// - Returns: The String
	public func join(_ glue: String, _ arr: [String]) -> String {
		return self.implode(glue, arr)
	}

	/// Make a string's first character lowercase
	///
	/// - Parameter str: The String
	///
	/// - Returns: The String
	public func lcfirst(_ str: String) -> String {
		guard let first = str.first else {
			return str
		}

		return first.lowercased() + str.dropFirst()
	}

	/// Calculate Levenshtein distance between two strings
	///
	/// - Parameter aStr: The First String
	/// - Parameter bStr: The Second String
	///
	/// - Returns: The String
	public func levenshtein(_ aStr: String, _ bStr: String) -> Int {
		return CalculateLevenshtein().calc(aStr, bStr)
	}

	/// Get numeric formatting information
	///
	/// - Returns: False
	public func localeconv() -> Bool {
		return false
	}

	/// Strip whitespace (or other characters) from the beginning of a string
	///
	/// chrs includes standard:
	///
	/// " " (ASCII 32 (0x20)), an ordinary space.
	///
	/// "\t" (ASCII 9 (0x09)), a tab.
	///
	/// "\n" (ASCII 10 (0x0A)), a new line (line feed).
	///
	/// "\r" (ASCII 13 (0x0D)), a carriage return.
	///
	/// "\0" (ASCII 0 (0x00)), the NULL-byte.
	///
	/// "\x0B" (ASCII 11 (0x0B)), a vertical tab.
	///
	/// - Parameter str: The String
	/// - Parameter chrs: Characters to trim (*ignored*)
	///
	/// - Returns: The String
	public func ltrim(_ str: String, _ chrs: String? = "_ALL_") -> String {
		return str.trimmedLeft()
	}

	/// Calculates the md5 hash of a given file
	///
	/// - Parameter str: The String
	///
	/// - Returns: The String
	public func md5_file(_ str: String) -> String {
		return str.md5
	}

	/// Calculate the md5 hash of a string
	///
	/// - Parameter str: The String
	///
	/// - Returns: The String
	public func md5(_ str: String) -> String {
		return str.md5
	}

	/// Calculate the metaphone key of a string
	///
	/// - Parameter str: The String
	///
	/// - Returns: The String
	public func metaphone(_ str: String) -> String {
		let word = str.uppercased().filter { $0 >= "A" && $0 <= "Z" }
		guard !word.isEmpty else {
			return ""
		}

		var letters = Array(word)

		if letters.count >= 2 {
			let prefix = String(letters[0...1])
			if ["KN", "GN", "PN", "AE", "WR"].contains(prefix) {
				letters.removeFirst()
			} else if prefix == "WH" {
				letters[0] = "W"
				letters.remove(at: 1)
			}
		}

		if letters.first == "X" {
			letters[0] = "S"
		}

		var result = ""
		var index = 0

		while index < letters.count {
			let current = letters[index]
			let previous = index > 0 ? letters[index - 1] : nil
			let next = index + 1 < letters.count ? letters[index + 1] : nil
			let following = index + 2 < letters.count ? letters[index + 2] : nil

			if current == previous && current != "C" {
				index += 1
				continue
			}

			switch current {
			case "A", "E", "I", "O", "U":
				if index == 0 {
					result.append(current)
				}
			case "B":
				if !(previous == "M" && index == letters.count - 1) {
					result.append("B")
				}
			case "C":
				if next == "I", following == "A" {
					result.append("X")
				} else if next == "H" {
					result.append("X")
					index += 1
				} else if ["I", "E", "Y"].contains(next) {
					result.append("S")
				} else {
					result.append("K")
				}
			case "D":
				if next == "G", ["E", "I", "Y"].contains(following) {
					result.append("J")
					index += 2
				} else {
					result.append("T")
				}
			case "G":
				if next == "H" {
					if index > 0 && !isMetaphoneVowel(previous) {
						index += 1
					} else {
						result.append("F")
						index += 1
					}
				} else if next == "N" && index + 1 == letters.count - 1 {
					break
				} else if ["E", "I", "Y"].contains(next) {
					result.append("J")
				} else {
					result.append("K")
				}
			case "H":
				if isMetaphoneVowel(next) && !isMetaphoneVowel(previous) {
					result.append("H")
				}
			case "F", "J", "L", "M", "N", "R":
				result.append(current)
			case "K":
				if previous != "C" {
					result.append("K")
				}
			case "P":
				result.append(next == "H" ? "F" : "P")
				if next == "H" {
					index += 1
				}
			case "Q":
				result.append("K")
			case "S":
				if next == "H" || (next == "I" && ["O", "A"].contains(following)) {
					result.append("X")
					if next == "H" {
						index += 1
					}
				} else {
					result.append("S")
				}
			case "T":
				if next == "I" && ["O", "A"].contains(following) {
					result.append("X")
				} else if next == "H" {
					result.append("0")
					index += 1
				} else if !(next == "C" && following == "H") {
					result.append("T")
				}
			case "V":
				result.append("F")
			case "W", "Y":
				if isMetaphoneVowel(next) {
					result.append(current)
				}
			case "X":
				result.append("KS")
			case "Z":
				result.append("S")
			default:
				break
			}

			index += 1
		}

		return result
	}

	/// Formats a number as a currency string
	///
	/// - Parameter str: The String
	///
	/// - Returns: The String
	public func money_format(_ str: String) -> String {
		let formatter = NumberFormatter()
		formatter.numberStyle = .currency

		if let number = Int(str) {
			let myNumber = NSNumber(value: number)
			return formatter.string(from: myNumber) ?? ""
		} else {
			return ""
		}
	}

	/// *Not supported** Query language and locale information
	///
	/// - Parameter str: The String
	///
	/// - Returns: The String
	public func nl_langinfo(_ str: String) -> Any {
		return false
	}

	/// Inserts HTML line breaks before all newlines in a string (not done)
	///
	/// - Parameter html: the string
	///
	/// - Returns: the string with <br /> tags
	public func nl2br(_ html: String) -> String {
		return html.replacingOccurrences(of: "\n", with: "<br />\n")
	}

	/// Break (br) to Newline [like-php (reversed)]
	///
	/// - Parameter html: the html string to convert to a string
	///
	/// - Returns: the string with line-breaks
	public func br2nl(_ html: String) -> String {
		return html.replacingOccurrences(of: "<br />", with: "\n") // html 4
		.replacingOccurrences(of: "<br/>", with: "\n") // invalid html
		.replacingOccurrences(of: "<br>", with: "\n") // html <=4
	}

	/// Format a number with grouped thousands
	///
	/// - Parameter str: The String
	///
	/// - Returns: The String
	public func number_format(_ str: String) -> String {
		let formatter = NumberFormatter()
		formatter.numberStyle = .decimal

		if let number = Int(str) {
			let myNumber = NSNumber(value: number)
			return formatter.string(from: myNumber) ?? ""
		} else {
			return ""
		}
	}

	/// Return ASCII value of character
	///
	/// - Parameter str: The String
	///
	/// - Returns: The String
	public func ord(_ str: String) -> String {
		guard let first = str.unicodeScalars.first else {
			return "0"
		}

		return String(first.value)
	}

	/// Parses the string into variables
	///
	/// - Parameter str: the query string
	///
	/// - Returns: [String: Any]
	public func parse_str(_ str: String) -> [String: Any] {
		// WTF Why not.

		// first=value&arr[]=foo+bar&arr[]=baz
		// must become:
		// ARRAY {
		// first: value,
		// arr: [foo bar, baz]
		// }
		// Must not be to hard, i hope, and i guess

		var tempy = [String: Any]()

		let explodedData = str.components(separatedBy: "&")

		for val in explodedData {
			let data = val.components(separatedBy: "=")
			guard let key = data.first, data.count > 1 else {
				continue
			}

			let value = data[1]

			if key.endsWith("[]") {
				let arrayName = key.replace("[]", withString: "")
				if let arr = tempy[arrayName] as? [String] {
					var x = arr
					x.append(value)

					tempy[arrayName] = x
				} else {
					tempy[arrayName] = [value]
				}
			} else {
				tempy[key] = value
			}
		}

		return tempy
	}

	/// *PHP.Framework**\
	/// Write a formatted string to a stream
	/// via swift's print function*
	///
	/// *WARNING: use String(format:...)**
	///
	/// - Parameter ob: the object
	// public func print(ob: Any...) -> Void {
	// print(ob)
	// }

	/// *PHP.Framework**\
	/// Output a formatted string
	/// via swift's print function*
	///
	/// *WARNING: use String(format:...)**
	///
	/// - Parameter ob: the object
	public func printf(_ ob: AnyObject ...) {
		print(ob)
	}

	/// Convert a quoted-printable string to an 8 bit string
	///
	/// - Parameter str: The String
	///
	/// - Returns: The String
	public func quoted_printable_decode(_ str: String) -> String {
		return str
	}

	/// Convert a 8 bit string to a quoted-printable string
	///
	/// - Parameter str: The String
	///
	/// - Returns: The String
	public func quoted_printable_encode(_ str: String) -> String {
		return str
	}

	/// Quote meta characters
	/// Puts a backslash before one of those characters: **. \ + * ? [ ^ ] ( $ )**
	///
	/// - Parameter str: The String
	///
	/// - Returns: The String
	public func quotemeta(_ str: String) -> String {
		return str.replace("\\", withString: "\\\\")
			.replace(".", withString: "\\.")
			.replace("+", withString: "\\+")
			.replace("*", withString: "\\*")
			.replace("?", withString: "\\?")
			.replace("[", withString: "\\[")
			.replace("^", withString: "\\^")
			.replace("]", withString: "\\]")
			.replace("(", withString: "\\(")
			.replace("$", withString: "\\$")
			.replace(")", withString: "\\)")
	}

	/// Strip whitespace (or other characters) from the end of a string
	///
	/// chrs includes standard:
	///
	/// " " (ASCII 32 (0x20)), an ordinary space.
	///
	/// "\t" (ASCII 9 (0x09)), a tab.
	///
	/// "\n" (ASCII 10 (0x0A)), a new line (line feed).
	///
	/// "\r" (ASCII 13 (0x0D)), a carriage return.
	///
	/// "\0" (ASCII 0 (0x00)), the NULL-byte.
	///
	/// "\x0B" (ASCII 11 (0x0B)), a vertical tab.
	///
	/// - Parameter str: The String
	/// - Parameter chrs: Characters to trim (*ignored*)
	///
	/// - Returns: String
	public func rtrim(_ str: String, _ chars: String? = "_ALL_") -> String {
		return str.trimmedRight()
	}

	/// *Not Supported** Set locale information
	///
	/// - Parameter str: The String
	///
	/// - Returns: false
	public func setlocale(_ str: String) -> Any {
		return false
	}

	/// Calculate the sha1 hash of a file
	///
	/// - Parameter str: The String
	///
	/// - Returns: The String
	public func sha1_file(_ str: String) -> String {
		return str.sha1
	}

	/// Calculate the sha1 hash of a string
	///
	/// - Parameter str: The String
	///
	/// - Returns: The String
	public func sha1(_ str: String) -> String {
		return str.sha1
	}

	/// Calculate the similarity between two strings
	///
	/// - Parameter str: The String
	///
	/// - Returns: The String
	public func similar_text(_ str: String, _ str2: String = "") -> Bool {
		return str == str2
	}

	/// Calculate the soundex key of a string
	///
	/// - Parameter str: The String
	///
	/// - Returns: The String
	public func soundex(_ str: String) -> String {
		let letters = str.uppercased().filter { $0 >= "A" && $0 <= "Z" }
		guard let first = letters.first else {
			return ""
		}

		var result = String(first)
		var previousCode = soundexCode(first)

		for letter in letters.dropFirst() {
			let code = soundexCode(letter)

			if code == "0" {
				if letter != "H" && letter != "W" {
					previousCode = code
				}
				continue
			}

			if code != previousCode {
				result += code
			}

			previousCode = code

			if result.count == 4 {
				return result
			}
		}

		return result.padding(toLength: 4, withPad: "0", startingAt: 0)
	}

	/// *PHP.Framework**\
	/// Return a formatted string\
	/// via swift's print function*
	///
	/// *WARNING: use String(format:...)**
	///
	/// - Parameter ob: the object
	public func sprintf(_ ob: AnyObject ...) {
		print(ob)
	}

	/// Parses input from a string according to a format\
	/// *Use swift's String, this will only return the string!**
	///
	/// - Parameter str: The String
	///
	/// - Returns: The String
	public func sscanf(_ str: String) -> String {
		return str
	}

	/// Parse a CSV string into an array
	///
	/// - Parameter str: The input String
	/// - Parameter delimiter: ","
	/// - Parameter enclosure: "\""
	/// - Parameter escape: "\\"
	///
	/// - Returns: The String
	public func str_getcsv(
        _ str: String,
        _ delimiter: String? = ",",
        enclosure: String? = "\"",
        escape: String? = "\\"
    ) -> [String] {
		return explode(str, delimiter!)
	}

	/// Case-insensitive version of str_replace. (not done)
	///
	/// - Parameter search: string to search for
	/// - Parameter replace: replace with
	/// - Parameter subject: The String
	///
	/// - Returns: The replaced String
	public func str_ireplace(_ search: String, _ replace: String, _ subject: String) -> String {
		return subject.ireplace(search, withString: replace)
	}

	/// Pad a string to a certain length with another string
	///
	/// - Parameter input: The String
	///
	/// - Returns: The String
	// string str_pad ( string $input , int $pad_length [, string $pad_string = " " [, int $pad_type = STR_PAD_RIGHT ]] )

	public func str_pad(
        _ input: String,
        _ length: Int,
        _ pad_string: String? = " ",
        pad_type: Int? = STR_PAD_RIGHT
    ) -> String {
		guard length > input.length, let padString = pad_string, !padString.isEmpty else {
			return input
		}

		switch pad_type! {
		case STR_PAD_BOTH:
			let paddingNeeded = length - input.length
			let leftPadding = (paddingNeeded / 2) + 1
			let rightPadding = (paddingNeeded / 2) + ((paddingNeeded % 2 == 0) ? 0 : 1)
			return String(repeating: padString, count: leftPadding) + input +
				String(repeating: padString, count: rightPadding)
		case STR_PAD_LEFT:
			let paddingNeeded = length - input.length
			return String(repeating: padString, count: paddingNeeded) + input
		case STR_PAD_RIGHT:
			let paddingNeeded = length - input.length
			return input + String(repeating: padString, count: paddingNeeded)
		default:
			print("ERROR")
			return input
		}
	}

	/// Repeat a string
	///
	/// - Parameter str: The String to repeat
	/// - Parameter times: the amount of times to repeat
	///
	/// - Returns: The String
	public func str_repeat(_ str: String, _ times: Int) -> String {
		guard times > 0 else {
			return ""
		}

		return String(repeating: str, count: times)
	}

	/// Replace all occurrences of the search string with the replacement string (*we only support strings*)
	///
	/// - Parameter search: string to search for
	/// - Parameter replace: replace with
	/// - Parameter subject: The String
	///
	/// - Returns: The replaced String
	public func str_replace(_ search: String, _ replace: String, _ subject: String) -> String {

		return subject.replace(search, withString: replace)
	}

	/// Perform the rot13 transform on a string
	///
	/// - Parameter str: The String
	///
	/// - Returns: The String
	public func str_rot13(_ str: String) -> String {
		return ROT13().encrypt(str)
	}

	/// Randomly shuffles a string (not done)
	///
	/// - Parameter str: The String
	///
	/// - Returns: The String
	public func str_shuffle(_ str: String) -> String {
		print("Sorry this function is not done")

		var arr: [String] = str_split(str)
		arr.shuffle()

		return implode("", arr)
	}

	/// Convert a string to an array
	///
	/// - Parameter str: The String to split
	/// - Parameter count: The count (defaults 1)
	///
	/// - Returns: The String splitted into a array
	public func str_split(_ str: String, _ count: Int = 1) -> [String] {
		guard count > 0, !str.isEmpty else {
			return []
		}

		var temporaryArray: [String] = []
		temporaryArray.reserveCapacity((str.count + count - 1) / count)

		var temporaryString = ""
		temporaryString.reserveCapacity(count)

		for character in str {
			temporaryString.append(character)

			if temporaryString.count == count {
				temporaryArray.append(temporaryString)
				temporaryString.removeAll(keepingCapacity: true)
			}
		}

		if !temporaryString.isEmpty {
			temporaryArray.append(temporaryString)
		}

        return temporaryArray
	}

	/// Return information about words used in a string
	///
	/// Differs from PHP, PHP counts a number as a new word, we don't!*
	///
	/// - Parameter str: The String
	/// - Parameter format: 0 - returns the number of words found \
	/// 1 - returns an array containing all the words found inside the string \
	/// 2 - returns an associative array, where the key is the numeric position of the \
	/// word inside the string and the value is the actual word itself (**Not supported**)
	/// - Parameter charlist: *Not supported*.
	///
	/// - Returns: The count of the words
	public func str_word_count(_ str: String, _ mode: Int = 0, _ charlist: String = "DEFAULT") -> Any {
		if mode < 2 {
			let temporaryReadArray: [String] = self.explode(str, " ")
			var temporaryWriteArray: [String] = [String]()

			for i in 0 ..< temporaryReadArray.count where temporaryReadArray[i] != "" {
				temporaryWriteArray.append(temporaryReadArray[i])
			}

			if mode == 1 {
				return temporaryWriteArray
			} else {
				return temporaryWriteArray.count
			}
		} else {
			print("Sorry, This is not supported")
			return 0
		}
	}

	/// Binary safe case-insensitive string comparison
	///
	/// - Parameter str1: The 1st String
	/// - Parameter str2: The 2nd String
	///
	/// - Returns: The String
	public func strcasecmp(_ str1: String, _ str2: String) -> Int {
		if str1.length > str2.length {
			return str1.length - str2.length
		} else if str1.length < str2.length {
			return str1.length - str2.length
		} else {
			if str1 == str2 {
				return 0
			} else {
				return 1
			}
		}
	}

	/// Alias of ``strstr(_:_:_:)``
	///
	/// - Parameter str: The String
	/// - Parameter find: find
	/// - Parameter before: before?
	///
	/// - Returns: The part String
	public func strchr(_ str: String, _ find: String, _ before: Bool? = false) -> String {
		return strstr(str, find, before)
	}

	/// Binary safe string comparison
	///
	/// - Parameter str1: The 1st String
	/// - Parameter str2: The 2nd String
	///
	/// - Returns: The String
	public func strcmp(_ str1: String, _ str2: String) -> Int {
		if str1.length > str2.length {
			return str1.length - str2.length
		} else if str1.length < str2.length {
			return str1.length - str2.length
		} else {
			return 0
		}
	}

	/// *Not supported** Locale based string comparison
	///
	/// - Parameter str: The String
	///
	/// - Returns: The String
	public func strcoll(_ str: String) -> String {
		return str
	}

	/// Find length of initial segment not matching mask
	///
	/// - Parameter subject: The String
	/// - Parameter mask: The mask
	/// - Parameter start: starting position (default = 0)
	/// - Parameter length: length (default = 0)
	///
	/// - Returns: Integer
	public func strcspn(_ subject: String, _ mask: String, _ start: Int? = 0, _ length: Int? = 0) -> Int {
		var count = 0

		if start ?? 0 >= 0 {
			for cS in subject {
				if count >= start ?? 0 {
					for cM in mask where String(cS) == String(cM) {
						// Found at count.
						return count
					}
				}

				count += 1
			}
		} else {
			// we'll need to find it in reversed order

			count = subject.length + 1

			if length != 0 {
				if length ?? 0 < 0 {
					count = subject.length
				}
			}

			for cS in subject.reversed() {
				if count >= abs(start!) {
					for cM in mask where String(cS) == String(cM) {
						return count - abs(start!)
					}
				}

				count -= 1
			}
		}

		return -1
	}

	/// Strip HTML and PHP tags from a string
	///
	/// - Parameter str: The String
	///
	/// - Returns: The String
	public func strip_tags(_ str: String) -> String {
		do {
            let regex: NSRegularExpression = try NSRegularExpression(
                pattern: "<.*?>",
                options: NSRegularExpression.Options.caseInsensitive
            )
			let range = NSRange(location: 0, length: str.count)
			let htmlLessString: String = regex.stringByReplacingMatches(in: str, options: [], range: range, withTemplate: "")
			return htmlLessString
		} catch {
			print("Failed to parse HTML String")
			return str
		}
	}

	/// Un-quote string quoted with addcslashes (not done)
	///
	/// - Parameter str: The String
	///
	/// - Returns: The String
	public func stripcslashes(_ str: String) -> String {
		return str.replacingOccurrences(of: "\\\\", with: "\\")
			.replacingOccurrences(of: "\\'", with: "'")
			.replacingOccurrences(of: "\\\"", with: "\"")
			.replacingOccurrences(of: "\\\0", with: "\0")
	}

	/// Find the position of the first occurrence of a case-insensitive substring in a string
	///
	/// - Parameter haystack: The String
	/// - Parameter needle: String needed
	/// - Parameter offset: the offset
	///
	/// - Returns: Int / Bool(false)
	///
	/// - Returns: The String
	public func stripos(_ haystack: String, _ needle: String, _ offset: Int? = 0) -> Any {
        if offset ?? 0 < 0 {
			var count = haystack.length
			for value in haystack.reversed() {
				if count < offset! + haystack.length {
					if String(value).lowercased() == needle.lowercased() {
						return count - 1
					}
				}
				count -= 1
			}

			return false
		} else {
			var count = 0
			for value in haystack {
				if count > offset! {
					if String(value).lowercased() == needle.lowercased() {
						return count
					}
				}
				count += 1
			}

			return false
		}
	}

	/// Un-quotes a quoted string
	///
	/// - Parameter str: The String
	///
	/// - Returns: The String
	public func stripslashes(_ str: String) -> String {
		return str.replacingOccurrences(of: "\\\\", with: "\\")
			.replacingOccurrences(of: "\\'", with: "'")
			.replacingOccurrences(of: "\\\"", with: "\"")
			.replacingOccurrences(of: "\\\0", with: "\0")
	}

	/// Case-insensitive strstr
	///
	/// - Parameter str: The String
	/// - Parameter find: find
	/// - Parameter before: before?
	///
	/// - Returns: The part String
	public func stristr(_ str: String, _ needle: String) -> Any {
		// string strrchr ( string $haystack , mixed $needle )
		// Explode & get end
		let exploded: [String] = explode(str, needle)

		if exploded.count > 1 {
			return exploded[exploded.count - 1]
		} else {
			return false
		}
	}

	/// Get string length
	///
	/// - Parameter str: The String
	///
	/// - Returns: The length
	public func strlen(_ str: String) -> Int {
		return str.count
	}

	/// Case insensitive string comparisons using a "natural order" algorithm
	///
	/// - Parameter str1: The 1st String
	/// - Parameter str2: The 2nd String
	///
	/// - Returns: The String
	public func strnatcasecmp(_ str1: String, _ str2: String) -> Int {
		if str1.length > str2.length {
			return str1.length - str2.length
		} else if str1.length < str2.length {
			return str1.length - str2.length
		} else {
			if str1 == str2 {
				return 0
			} else {
				return 1
			}
		}
	}

	/// String comparisons using a "natural order" algorithm
	///
	/// - Parameter str1: The 1st String
	/// - Parameter str2: The 2nd String
	///
	/// - Returns: The String
	public func strnatcmp(_ str1: String, _ str2: String) -> Int {
		if str1.length > str2.length {
			return str1.length - str2.length
		} else if str1.length < str2.length {
			return str1.length - str2.length
		} else {
			return 0
		}
	}

	/// Binary safe case-insensitive string comparison of the first n characters
	///
	/// - Parameter str1: The 1st String
	/// - Parameter str2: The 2nd String
	///
	/// - Returns: The String
	public func strncasecmp(_ str1: String, _ str2: String) -> Int {
		if str1.length > str2.length {
			return str1.length - str2.length
		} else if str1.length < str2.length {
			return str1.length - str2.length
		} else {
			if str1 == str2 {
				return 0
			} else {
				return 1
			}
		}
	}

	/// Binary safe string comparison of the first n characters
	///
	/// - Parameter str1: The 1st String
	/// - Parameter str2: The 2nd String
	///
	/// - Returns: The String
	public func strncmp(_ str1: String, _ str2: String) -> Int {
		if str1.length > str2.length {
			return str1.length - str2.length
		} else if str1.length < str2.length {
			return str1.length - str2.length
		} else {
			return 0
		}
	}

	/// Search a string for any of a set of characters
	///
	/// - Parameter haystack: The String
	/// - Parameter char_list: Character list
	///
	/// - Returns: a string starting from the character found, or FALSE if it is not found.
	///
	public func strpbrk(_ haystack: String, _ char_list: String) -> Any {
		return false
	}

	/// Find the position of the first occurrence of a substring in a string
	///
	/// - Parameter haystack: The String
	/// - Parameter needle: String needed
	/// - Parameter offset: the offset
	///
	/// - Returns: Int / Bool(false)
	///
	/// - Returns: The String
	public func strpos(_ haystack: String, _ needle: String, _ offset: Int? = 0) -> Any {
        if offset ?? 0 < 0 {
			var count = haystack.length
			for value in haystack.reversed() {
				if count < offset! + haystack.length {
					if String(value) == needle {
						return count - 1
					}
				}
				count -= 1
			}

			return false
		} else {
			var count = 0
			for value in haystack {
				if count > offset! {
					if String(value) == needle {
						return count
					}
				}
				count += 1
			}

			return false
		}
	}

	/// Find the last occurrence of a character in a string
	///
	/// Please note that we need at least 2 components, otherwise it will fail*
	///
	/// - Parameter str: input string
	/// - Parameter needle: what do we need
	///
	/// - Returns: **Pass:** String\
	/// *Fail:** Boolean (false)
	public func strrchr(_ str: String, _ needle: String) -> Any {
		// string strrchr ( string $haystack , mixed $needle )
		// Explode & get end
		let exploded: [String] = explode(str, needle)

		if exploded.count > 1 {
			return exploded[exploded.count - 1]
		} else {
			return false
		}
	}

	/// Reverse a string
	///
	/// - Parameter str: The String
	///
	/// - Returns: The String
	public func strrev(_ str: String) -> String {
		return String(str.reversed())
	}

	/// Find the position of the last occurrence of a case-insensitive substring in a string (not done)
	///
	/// - Parameter str: The String
	///
	/// - Returns: The String
	public func strripos(_ str: String) -> String {
		print("Sorry this function is not done")

		return str
	}

	/// Find the position of the last occurrence of a substring in a string
	///
	/// - Parameter haystack: The String
	/// - Parameter needle: String needed
	/// - Parameter offset: the offset
	///
	/// - Returns: Int / Bool(false)
	public func strrpos(_ haystack: String, _ needle: String, _ offset: Int? = 0) -> Any {
		if offset ?? 0 < 0 {
			var count = haystack.length
			for value in haystack.reversed() {
				if count < offset! + haystack.length {
					if String(value) == needle {
						return count - 1
					}
				}
				count -= 1
			}

			return false
		} else {
			var count = 0
			for value in haystack {
				if count > offset! {
					if String(value) == needle {
						return count
					}
				}
				count += 1
			}
			return false
		}
	}

	/// Finds the length of the initial segment of a string consisting entirely of characters
	/// contained within a given mask.
	///
	/// - Parameter haystack: The String
	/// - Parameter mask: The mask
	/// - Parameter start: startposition (default: 0)
	/// - Parameter lengrh: the length (default: 0)
	///
	/// - Returns: The String
	public func strspn(_ haystack: String, _ mask: String, _ start: Int? = 0, _ length: Int? = 0) -> Any {
		// int strspn ( string $subject , string $mask [, int $start [, int $length ]] )
		var count = 0

		if start == 0 {
			for fs in mask {
				if String(haystack[0]) == String(fs) {
					return 0
				}
				return 0
			}
		}

        if start ?? 0 > 0 {
			var inputString = haystack[(start)! ... (haystack.length)]
			if length != 0 {
				inputString = inputString[0 ... (length)!]
			}

			for look in inputString {
				for fs in mask where String(look) == String(fs) {
					count += 1
				}
			}
		}

		return count
		// var count = 0
		//
		// for chr in haystack.characters {
		//
		// //
		// if (true) {
		// for fs in mask.characters {
		// if (String(chr) == String(fs)) {
		// return count
		// }
		// }
		// }
		// //
		//
		// count += 1
		// }

		// return false
	}

	/// Find the first occurrence of a string
	///
	/// - Parameter str: The String
	/// - Parameter find: find
	/// - Parameter before: before?
	///
	/// - Returns: The part String
	public func strstr(_ str: String, _ find: String, _ before: Bool? = false) -> String {

		let exploded = explode(str, find)

		if exploded.count < 1 {
			return str
		}

		if before! || before == nil {
			return exploded[0]
		} else {
			return exploded[1]
		}
	}

	/// Tokenize string
	///
	/// - Parameter str: The String
	/// - Parameter delimiter: The delimiter
	///
	/// - Returns: The String
	public func strtok(_ str: String, _ delimiter: String? = "\n\r") -> Any {
		let _returnIfAny = explode(str, delimiter!)
		if _returnIfAny.count > 1 {
			return _returnIfAny
		} else {
			return false
		}
	}

	/// Make a string lowercase
	///
	/// - Parameter str: The String
	///
	/// - Returns: The String
	public func strtolower(_ str: String) -> String {
		return str.lowercased()
	}

	/// Make a string uppercase
	///
	/// - Parameter str: The String
	///
	/// - Returns: The String
	public func strtoupper(_ str: String) -> String {
		return str.uppercased()
	}

	/// Translate characters or replace substrings
	///
	/// - Parameter str: The String
	/// - Parameter from: from
	/// - Parameter to: to
	///
	/// - Returns: The changed String
	public func strtr(_ str: String, _ from: String, _ to: String) -> String {
		if from.length != to.length {
			return str
		}

		var _str = str

		for i in 0 ..< from.length {
			_str = _str.replace(String(from[i]), withString: String(to[i]))
		}

		return _str
	}
	/// Binary safe comparison of two strings from an offset, up to length characters.
	///
	/// - Parameter str: The String
	///
	/// - Returns: The String
	public func substr_compare(_ str: String) -> String {
		return str
	}

	/// Binary safe comparison of two strings from an offset, up to length characters.
	///
	/// - Parameters:
	///   - mainStr: The string being compared.
	///   - str: The string to compare against.
	///   - offset: The start position in `mainStr`.
	///   - length: Optional maximum comparison length.
	///   - caseInsensitive: Whether comparison should ignore case.
	///
	/// - Returns: `0` if equal, a negative value if lower, or a positive value if greater.
	public func substr_compare(
		_ mainStr: String,
		_ str: String,
		_ offset: Int,
		_ length: Int? = nil,
		_ caseInsensitive: Bool = false
	) -> Int {
		guard let startIndex = phpStringIndex(in: mainStr, offset: offset) else {
			return -1
		}

		let comparisonEndIndex: String.Index
		if let length, length > 0 {
			comparisonEndIndex = mainStr.index(startIndex, offsetBy: length, limitedBy: mainStr.endIndex) ??
				mainStr.endIndex
		} else {
			comparisonEndIndex = mainStr.endIndex
		}

		var left = String(mainStr[startIndex..<comparisonEndIndex])
		var right = str

		if let length, length > 0 {
			right = String(right.prefix(length))
		}

		if caseInsensitive {
			left = left.lowercased()
			right = right.lowercased()
		}

		if left == right {
			return 0
		}

		return left < right ? -1 : 1
	}

	/// Count the number of substring occurrences.
	///
	/// - Parameter str: The String
	///
	/// - Returns: The String
	public func substr_count(_ str: String) -> String {
		return str
	}

	/// Count the number of non-overlapping substring occurrences.
	///
	/// - Parameters:
	///   - haystack: The string to search in.
	///   - needle: The string to search for.
	///   - offset: The start position.
	///   - length: Optional search length.
	///
	/// - Returns: The number of occurrences.
	public func substr_count(_ haystack: String, _ needle: String, _ offset: Int = 0, _ length: Int = 0) -> Int {
		guard !needle.isEmpty, let startIndex = phpStringIndex(in: haystack, offset: offset) else {
			return 0
		}

		let endIndex: String.Index
		if length > 0 {
			endIndex = haystack.index(startIndex, offsetBy: length, limitedBy: haystack.endIndex) ?? haystack.endIndex
		} else {
			endIndex = haystack.endIndex
		}

		let searchArea = String(haystack[startIndex..<endIndex])
		var count = 0
		var searchStart = searchArea.startIndex

		while searchStart < searchArea.endIndex,
			  let range = searchArea.range(of: needle, range: searchStart..<searchArea.endIndex) {
			count += 1
			searchStart = range.upperBound
		}

		return count
	}

	/// Replace text within a portion of a string.
	///
	/// - Parameter str: The String
	///
	/// - Returns: The String
	public func substr_replace(_ str: String) -> String {
		return str
	}

	/// Replace text within a portion of a string.
	///
	/// - Parameters:
	///   - string: The input string.
	///   - replacement: The replacement string.
	///   - start: The start position.
	///   - length: Optional replacement length.
	///
	/// - Returns: The string with the specified range replaced.
	public func substr_replace(_ string: String, _ replacement: String, _ start: Int, _ length: Int? = nil) -> String {
		guard let startIndex = phpStringIndex(in: string, offset: start) else {
			return string
		}

		let endIndex: String.Index
		if let length {
			if length >= 0 {
				endIndex = string.index(startIndex, offsetBy: length, limitedBy: string.endIndex) ?? string.endIndex
			} else {
				let distanceFromEnd = abs(length)
				endIndex = string.index(string.endIndex, offsetBy: -distanceFromEnd, limitedBy: startIndex) ??
					startIndex
			}
		} else {
			endIndex = string.endIndex
		}

		var result = string
		result.replaceSubrange(startIndex..<endIndex, with: replacement)
		return result
	}

	/// Return part of a string
	///
	/// - Parameter str: The String
	/// - Parameter start: The start
	/// - Parameter length: The length (optional, default: 0)
	///
	/// - More info: http://php.net/manual/en/function.substr.php
	///
	/// - Returns: The String
	public func substr(_ str: String, _ start: Int, _ length: Int = 0) -> String {
		// string substr ( string $string , int $start [, int $length ] )

		if length == 0 {
			// We'll only have a 'start' position

			if start < 1 {
				// Count down to end.
				let startPosition: Int = (str.count + start)
				return str[startPosition ... str.count]
			} else {
				// Ok we'll start at point...
				return str[start ... str.count]
			}
		} else {
			// Ok, this could be fun, but we can also..
			// Nevermind.
			// We'll need to handle the length...

			if length > 0 {
				if start < 1 {
					// We'll know this trick!
					let startPosition: Int = (str.count + start)

					// Will be postitive in the end. (hopefully :P)
					// Ok, this is amazing! let me explain
					// String Count - (String count - -Start Point) + length
					// ^^^ -- is + (Since Start Point is a negative number)
					// String Count - Start point + length
					var endPosition: Int = ((str.count - (str.count + start)) + length)

					// If the endposition > the string, just string length.
					if endPosition > str.count {
						endPosition = str.count
					}

					// i WILL return ;)
					return str[startPosition ... endPosition]
				} else {
					// We'll know this trick!
					let startPosition: Int = start

					// Will be postitive in the end. (hopefully :P)
					var endPosition: Int = ((str.count - start) + length)

					// If the endposition > the string, just string length.
					if endPosition > str.count {
						endPosition = str.count
					}

					// i WILL return ;)
					return str[startPosition ... endPosition]
				}
			} else {
				// End tries to be funny.
				// so fix that.
				// Length (end = negative)

				if start < 1 {
					// But, Wait. Start is also negative?!

					// Count down to end.
					let startPosition: Int = (str.count + start)

					// We'll doing some magic here again, please, i don't explain this one also! (HAHA)
					var endPosition: Int = (str.count - ((str.count + start) + (length + 1)))

					// If the endposition > the string, just string length.
					if endPosition > str.count {
						endPosition = str.count
					}

					// i WILL return ;)
					return str[startPosition ... endPosition]
				} else {
					// Ok we'll start at point...

					// Count down to end.
					let startPosition: Int = (str.count - start)

					// We'll doing some magic here again, please, i don't explain this one also! (HAHA)
					var endPosition: Int = (str.count - ((str.count - start) + (length + 1)))

					// If the endposition > the string, just string length.
					if endPosition > str.count {
						endPosition = str.count
					}

					// i WILL return ;)
					return str[startPosition ... endPosition]
				}
			}
			// we'll having fun now!
		}
		// And it's done.
	}

	/// Strip whitespace (or other characters) from the beginning and end of a string
	///
	/// chrs includes standard:
	///
	/// " " (ASCII 32 (0x20)), an ordinary space.
	///
	/// "\t" (ASCII 9 (0x09)), a tab.
	///
	/// "\n" (ASCII 10 (0x0A)), a new line (line feed).
	///
	/// "\r" (ASCII 13 (0x0D)), a carriage return.
	///
	/// "\0" (ASCII 0 (0x00)), the NULL-byte.
	///
	/// "\x0B" (ASCII 11 (0x0B)), a vertical tab.
	///
	/// - Parameter str: The String
	/// - Parameter chrs: Characters to trim (*ignored*)
	///
	/// - Returns: The String
	public func trim(_ str: String, _ chrs: String? = "_ALL_") -> String {
		return str.trimmed()
	}

	/// Make a string's first character uppercase
	///
	/// - Parameter str: The String
	///
	/// - Returns: The String
	public func ucfirst(_ str: String) -> String {
		guard let first = str.first else {
			return str
		}

		return first.uppercased() + str.dropFirst()
	}

	/// Uppercase the first character of each word in a string
	///
	/// - Parameter str: The String
	///
	/// - Returns: The String
	public func ucwords(_ str: String) -> String {
		let splitted: Array = str.split(" ")
		var words: [String] = []
		words.reserveCapacity(splitted.count)

		for word in splitted {
			if let first = word.first {
				words.append(first.uppercased() + word.dropFirst())
			} else {
				words.append(word)
			}
		}

		return words.joined(separator: " ")
	}

	/// *PHP.Framework**\
	/// Write a formatted string to a stream
	/// via swift's print function*
	///
	/// *WARNING: use String(format:...)**
	///
	/// - Parameter ob: the object
	public func vfprintf(_ ob: Any ...) {
		print(ob)
	}

	/// *PHP.Framework**\
	/// Output a formatted string
	/// via swift's print function*
	///
	/// *WARNING: use String(format:...)**
	///
	/// - Parameter ob: the object
	public func vprintf(_ ob: Any ...) {
		print(ob)
	}

	/// *PHP.Framework**\
	/// Return a formatted string
	/// via swift's print function*
	///
	/// *WARNING: use String(format:...)**
	///
	/// - Parameter ob: the object
	public func vsprintf(_ ob: Any ...) {
		print(ob)
	}

	/// Wraps a string to a given number of characters (not done)
	///
	/// - Parameter str: The String
	/// - Parameter width: The Width (default: 75)
	/// - Parameter breaks: Breaking character (default: \n)
	/// - Parameter cut: Just cut? (default: false)\
	/// if false we will cut on whitespaces or dots\
	/// if true we will cut if the limit is reached
	///
	/// - Returns: The String
	public func wordwrap(_ str: String, _ width: Int = 75, _ breaks: String = "\n", _ cut: Bool = false) -> String {
		var myCount: Int = 0
		var myString: String = ""
		myString.reserveCapacity(str.count)

		for character in str {
			myString.append(character)

			if myCount >= width {
				if cut {
					// We'd like to cut always.
					myString += breaks
					myCount = 0
				} else {
					// Only cut on a whitespace, or a dot!
					if character == " " || character == "." {
						myString += breaks
						myCount = 0
					}
				}
			} else {
				myCount += 1
			}
		}
		return myString
	}

	private func uuEncodedCharacter(_ value: UInt8) -> Character {
		let encoded = (value & 0x3f) + 32
		return Character(UnicodeScalar(encoded == 32 ? 96 : encoded))
	}

	private func isMetaphoneVowel(_ character: Character?) -> Bool {
		guard let character else {
			return false
		}

		return ["A", "E", "I", "O", "U"].contains(character)
	}

	private func soundexCode(_ character: Character) -> String {
		switch character {
		case "B", "F", "P", "V":
			return "1"
		case "C", "G", "J", "K", "Q", "S", "X", "Z":
			return "2"
		case "D", "T":
			return "3"
		case "L":
			return "4"
		case "M", "N":
			return "5"
		case "R":
			return "6"
		default:
			return "0"
		}
	}

	private func phpStringIndex(in string: String, offset: Int) -> String.Index? {
		if offset >= 0 {
			return string.index(string.startIndex, offsetBy: offset, limitedBy: string.endIndex)
		}

		return string.index(string.endIndex, offsetBy: offset, limitedBy: string.startIndex)
	}

}
