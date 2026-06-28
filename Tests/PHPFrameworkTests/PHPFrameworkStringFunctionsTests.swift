//
//  PHPFrameworkStringFunctionsTests.swift
//  PHPFramework
//
//  Created by Wesley de Groot on 13-02-16.
//  Copyright © 2016 WDGWV. All rights reserved.
//

import XCTest
@testable import PHPFramework
import Foundation

extension PHPFrameworkTests {
	func test_ord() {
		XCTAssertEqual(php.ord("W"), 87)
	}

	func test_chr() {
		XCTAssertEqual(php.chr(87), "W")
	}

	func test_addcslashes() {
		XCTAssertEqual(php.addcslashes("\"wdg\" aka Wesley De Groot"), "\\\"wdg\\\" aka Wesley De Groot")
	}

    func test_addslashes() {
		XCTAssertEqual(php.addslashes("\"wdg\" aka Wesley De Groot"), "\\\"wdg\\\" aka Wesley De Groot")
	}

	func test_bin2hex() {
		XCTAssertEqual(php.bin2hex(01110111), 17891601)
	}

	func test_chop() {
		XCTAssertEqual(php.chop("wdg"), "wdg")
	}

	func test_chunk_split() {
		XCTAssertEqual(php.chunk_split("wdg", 1), "w\r\nd\r\ng\r\n")
	}

	func test_convert_cyr_string() {
		XCTAssertEqual(php.convert_cyr_string(E), E)
	}

	func test_convert_uudecode() {
        let encoded = php.convert_uuencode("Hello\nPHPFramework")
        XCTAssertEqual(php.convert_uudecode(encoded), "Hello\nPHPFramework")
	}

	func test_convert_uuencode() {
        let encoded = php.convert_uuencode("Hello")
        XCTAssertTrue(encoded.hasSuffix("\n`"))
        XCTAssertEqual(php.convert_uudecode(encoded), "Hello")
	}

	func test_count_chars() {
		XCTAssertEqual(
            php.count_chars("x"),
            [
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0
            ]
        )
	}

	func test_crc32() {
        XCTAssertEqual("wdg".crc32, "7cb8fd9f")
	}

	func test_crypt() {
        XCTAssertEqual(php.crypt("password", "ab"), "abJnggxhB/yWI")
	}

	func test_echo() {
		// if no crash then pass
        php.echo(PASS as AnyObject)
	}

	func test_explode() {
		XCTAssertEqual(php.explode("@;w;d;g", ";"), ["@", "w", "d", "g"])
	}

	func test_fprintf() {
		// if no crash then pass
        php.fprintf(PASS as AnyObject)
	}

	func test_get_html_translation_table() {
		XCTAssertEqual(php.get_html_translation_table(E), php.get_html_translation_table(E))
	}

	func test_hebrev() {
		XCTAssertEqual(php.hebrev(E), E)
	}

	func test_hebrevc() {
		XCTAssertEqual(php.hebrevc(E), E)
	}

	func test_hex2bin() {
		XCTAssertEqual(php.hex2bin("776467"), 7824487)
	}

	func test_html_entity_decode() {
		XCTAssertEqual(php.html_entity_decode("&lt;b&gt;hi&lt;/b&gt;"), "<b>hi</b>")
	}

	func test_htmlentities() {
		XCTAssertEqual(php.htmlentities("<b>hi</b>"), "&lt;b&gt;hi&lt;/b&gt;")
	}

	func test_htmlspecialchars_decode() {
		XCTAssertEqual(php.htmlspecialchars_decode("&lt;b&gt;hi&lt;/b&gt;"), "<b>hi</b>")
	}

	func test_htmlspecialchars() {
		XCTAssertEqual(php.htmlspecialchars("<b>hi</b>"), "&lt;b&gt;hi&lt;/b&gt;")
	}

	func test_implode() {
		XCTAssertEqual(php.implode("", ["@", "w", "d", "g"]), "@wdg")
	}

	func test_join() {
		XCTAssertEqual(php.join("", ["@", "w", "d", "g"]), "@wdg")
	}

	func test_lcfirst() {
		XCTAssertEqual(php.lcfirst("WDG"), "wDG")
	}

	func test_levenshtein() {
		XCTAssertEqual(php.levenshtein("Hello", "ello"), 1)
		XCTAssertEqual(php.levenshtein("kitten", "sitting"), 3)
		XCTAssertEqual(php.levenshtein("", "abc"), 3)
	}

	func test_ltrim() {
		XCTAssertEqual(php.ltrim("   @wdg"), "@wdg")
	}

	func test_md5_file() {
		// if no crash then passed
		php.noop(php.md5_file(E))
	}

	func test_md5() {
        XCTSkip("Function not finished")
	}

	func test_metaphone() {
        XCTAssertEqual(php.metaphone("programming"), "PRKRMNK")
        XCTAssertEqual(php.metaphone("phone"), "FN")
        XCTAssertEqual(php.metaphone("Xavier"), "SFR")
	}

	func test_money_format() {
        XCTSkip("Function not finished")
    }

	func test_nl_langinfo() {
		XCTAssertEqual(php.nl_langinfo("NL") as? Bool, false)
	}

	func test_nl2br() {
		XCTAssertEqual(php.nl2br("Hello,\nGoodbye!"), "Hello,<br />\nGoodbye!")
	}

	func test_number_format() {
        XCTSkip("Function not finished")
	}

	func test_parse_str() {
		// if no crash then pass
        php.noop(php.parse_str("first=value&arr[]=foo+bar&arr[]=baz"))
        let parsed = php.parse_str("first=value&arr[]=foo+bar&arr[]=baz&empty")
        XCTAssertEqual(parsed["first"] as? String, "value")
        XCTAssertEqual(parsed["arr"] as? [String], ["foo+bar", "baz"])
	}

	func test_printf() {
		// if no crash then pass
        php.printf(E as AnyObject)
	}

	func test_quoted_printable_decode() {
		XCTAssertEqual(php.quoted_printable_decode("EE"), "EE")
	}

	func test_quoted_printable_encode() {
		XCTAssertEqual(php.quoted_printable_encode("EE"), "EE")
	}

	func test_quotemeta() {
		XCTAssertEqual(php.quotemeta(". \\ + * ? [ ^ ] ( $ )"), "\\. \\\\ \\+ \\* \\? \\[ \\^ \\] \\( \\$ \\)")
	}

	func test_rtrim() {
		XCTAssertEqual(php.rtrim("wdg      "), "wdg")
	}

	func test_localeconv() {
		XCTAssertEqual(php.localeconv(), false)
	}

	func test_setlocale() {
		XCTAssertEqual(php.setlocale("nl_NL") as? Bool, false)
	}

	func test_sha1_file() {
        XCTSkip("Function not finished")
	}

	func test_sha1() {
        XCTSkip("Function not finished")
    }

	func test_similar_text() {
		XCTAssertEqual(php.similar_text("PHP", "PHP"), true)
	}

	func test_soundex() {
        XCTAssertEqual(php.soundex("Euler"), "E460")
        XCTAssertEqual(php.soundex("Ellery"), "E460")
        XCTAssertEqual(php.soundex("Ashcraft"), "A261")
        XCTAssertEqual(php.soundex("Pfister"), "P236")
	}

	func test_sprintf() {
		// if no crash then pass
        php.noop(php.sprintf(E as AnyObject))
	}

	func test_sscanf() {
		// If no crash then pass
		php.noop(php.sscanf(E))
	}

	func test_str_getcsv() {
		let csv = "hi;i;am;random;data" + PHP_EOL + "data;i;am;random;!" + PHP_EOL + "h;e;l;l;o" +
        PHP_EOL + "i;j;u;s;t" +  PHP_EOL + "c;a;l;l;e" + PHP_EOL + "d;t;o;s;a" + PHP_EOL + "y;.;.;.;." +
        PHP_EOL + "h;e;l;l;o"

		XCTAssertEqual(
            php.str_getcsv(csv, ";") as [String],
            ["hi", "i", "am", "random", "data\r\ndata", "i", "am", "random", "!\r\nh", "e", "l", "l",
            "o\r\ni", "j", "u", "s", "t\r\nc", "a", "l", "l", "e\r\nd", "t", "o", "s", "a\r\ny", ".",
            ".", ".", ".\r\nh", "e", "l", "l", "o"])
	}

	func test_str_ireplace() {
		XCTAssertEqual(php.str_ireplace("abc", "wdg", "@aBc"), "@wdg")
	}

	func test_str_pad() {
		XCTAssertEqual(php.str_pad("@wdg", 10, " ", pad_type: STR_PAD_RIGHT), "@wdg      ")
		XCTAssertEqual(php.str_pad("@wdg", 10, " ", pad_type: STR_PAD_LEFT), "      @wdg")
		XCTAssertEqual(php.str_pad("@wdg", 10, " ", pad_type: STR_PAD_BOTH), "    @wdg   ")
		XCTAssertEqual(php.str_pad("@wdg", 11, " ", pad_type: STR_PAD_BOTH), "    @wdg    ")
	}

	func test_str_repeat() {
		XCTAssertEqual(php.str_repeat("Hi", 2), "HiHi")
		XCTAssertEqual(php.str_repeat("Hi", 0), "")
	}

	func test_str_replace() {
		XCTAssertEqual(php.str_replace("abc", "wdg", "@abc"), "@wdg")
	}

	func test_str_rot13() {
		XCTAssertEqual(php.str_rot13("wdg"), "jqt")
	}

	func test_str_shuffle() {
		XCTAssertNotEqual(php.str_shuffle("Hello you!"), "Hello you!")
	}

	func test_str_split() {
		XCTAssertEqual(php.str_split("@wdg"), ["@", "w", "d", "g"])
		XCTAssertEqual(php.str_split("@wdg", 2), ["@w", "dg"])
		XCTAssertEqual(php.str_split("", 2), [])
		XCTAssertEqual(php.str_split("@wdg", 0), [])
	}

	func test_str_word_count() {
		XCTAssertEqual(php.str_word_count("WDG WDG") as? Int, 2)
	}

	func test_strchr() {
		XCTAssertEqual(php.strchr("hello@wdg", "@"), "wdg")
		XCTAssertEqual(php.strchr("hello@wdg", "@", true), "hello")
	}

	func test_strcmp() {
        let v = ["abc", "ABC", "cdef", "ab"]
        XCTAssertEqual(php.strcmp(v[0], v[0]), 0)
        XCTAssertEqual(php.strcmp(v[0], v[1]), 0)
        XCTAssertEqual(php.strcmp(v[0], v[2]), -1)
        XCTAssertEqual(php.strcmp(v[0], v[3]), 1)
	}

	func test_strcoll() {
		// Not supported
        php.noop(php.strcoll(E))
	}

	func test_strcspn() {
		XCTAssertEqual(php.strcspn("abcd", "apple"), 0)
        XCTAssertEqual(php.strcspn("abcd", "banana"), 0)
        XCTAssertEqual(php.strcspn("hello", "l"), 2)
        XCTAssertEqual(php.strcspn("hello", "world"), 2)
        XCTAssertEqual(php.strcspn("abcdhelloabcd", "abcd", -9), 5)
        XCTAssertEqual(php.strcspn("abcdhelloabcd", "abcd", -9, -5), 4)
	}

	func test_strip_tags() {
		XCTAssertEqual(
            php.strip_tags(
                "<b>Hello</b> this is <a href='http://github.com/0xWDG/PHPFramework' target='_blank'>PHPFramework</a>"
            ),
            "Hello this is PHPFramework"
        )
	}

	func test_stripcslashes() {
        let encode = php.addcslashes("\"wdg\" aka Wesley De Groot")
		XCTAssertEqual(php.stripcslashes(encode), "\"wdg\" aka Wesley De Groot")
	}

	func test_stripos() {
        let newstring = "aBcDeF aBcDeF"

        XCTAssertEqual(php.stripos(newstring, "a", 1) as? Int, 7)
        XCTAssertEqual(php.stripos(newstring, "B", 8) as? Bool, false)
	}

	func test_stripslashes() {
        let encode = php.addcslashes("\"wdg\" aka Wesley De Groot")
        XCTAssertEqual(php.stripslashes(encode), "\"wdg\" aka Wesley De Groot")
	}

	func test_stristr() {
        XCTAssertEqual(php.strstr("hello@wdg", "@"), "wdg")
        XCTAssertEqual(php.strstr("hello@wdg", "@", true), "hello")
	}

	func test_strlen() {
		XCTAssertEqual(php.strlen("Hi"), 2)
	}

    func test_pstrcasecmp() {
        let v = ["abc", "ABC", "cdef", "ab"]
        XCTAssertEqual(php.strcasecmp(v[0], v[0]), 0)
        XCTAssertEqual(php.strcasecmp(v[0], v[1]), 1)
        XCTAssertEqual(php.strcasecmp(v[0], v[2]), -1)
        XCTAssertEqual(php.strcasecmp(v[0], v[3]), 1)
    }

	func test_strnatcasecmp() {
        let v = ["abc", "ABC", "cdef", "ab"]
        XCTAssertEqual(php.strnatcasecmp(v[0], v[0]), 0)
        XCTAssertEqual(php.strnatcasecmp(v[0], v[1]), 1)
        XCTAssertEqual(php.strnatcasecmp(v[0], v[2]), -1)
        XCTAssertEqual(php.strnatcasecmp(v[0], v[3]), 1)
	}

	func test_strnatcmp() {
        let v = ["abc", "ABC", "cdef", "ab"]
        XCTAssertEqual(php.strnatcmp(v[0], v[1]), 0)
        XCTAssertEqual(php.strnatcmp(v[0], v[2]), -1)
        XCTAssertEqual(php.strnatcmp(v[0], v[3]), 1)
	}

	func test_strncasecmp() {
        let v = ["abc", "ABC", "cdef", "ab"]
        XCTAssertEqual(php.strncasecmp(v[0], v[0]), 0)
        XCTAssertEqual(php.strncasecmp(v[0], v[1]), 1)
        XCTAssertEqual(php.strncasecmp(v[0], v[2]), -1)
        XCTAssertEqual(php.strncasecmp(v[0], v[3]), 1)
	}

	func test_strncmp() {
        let v = ["abc", "ABC", "cdef", "ab"]
        XCTAssertEqual(php.strncmp(v[0], v[1]), 0)
        XCTAssertEqual(php.strncmp(v[0], v[2]), -1)
        XCTAssertEqual(php.strncmp(v[0], v[3]), 1)
	}

	func test_strpbrk() {
        XCTSkip("Function not finished")
    }

	func test_strpos() {
        let newstring = "abcdef abcdef"

		XCTAssertEqual(php.strpos(newstring, "a", 1) as? Int, 7)
        XCTAssertEqual(php.strpos(newstring, "a", 8) as? Bool, false)
	}

	func test_strrchr() {
		XCTAssertEqual(php.strrchr("@wdg", "d") as? String, "g")
	}

	func test_strrev() {
		XCTAssertEqual(php.strrev("gdw@"), "@wdg")
	}

	func test_strripos() {
        let newstring = "abcdef abcdef"

        XCTAssertEqual(php.strpos(newstring, "a", 1) as? Int, 7)
        XCTAssertEqual(php.strpos(newstring, "a", 8) as? Bool, false)
	}

	func test_strrpos() {
        let foo: String = "0123456789a123456789b123456789c"

        XCTAssertEqual(php.strrpos(foo, "7", -5) as? Int, 17)
        // Starts looking backwards five positions
        // from the end. Result: int(17)

        XCTAssertEqual(php.strrpos(foo, "7", 20) as? Int, 27)
        // Starts searching 20 positions into the
        // string. Result: int(27)

        XCTAssertEqual(php.strrpos(foo, "7", 28) as? Bool, false)
        // Result: bool(false)
    }

	func test_strspn() {
        XCTAssertEqual(php.strspn("foo", "f") as? Int, 0)
        XCTAssertEqual(php.strspn("foo", "o") as? Int, 0)
        XCTAssertEqual(php.strspn("foo", "o", 1, 2) as? Int, 2)
        XCTAssertEqual(php.strspn("foo", "o", 1, 1) as? Int, 1)
	}

	func test_strstr() {
		XCTAssertEqual(php.strstr("hello@wdg", "@"), "wdg")
		XCTAssertEqual(php.strstr("hello@wdg", "@", true), "hello")
	}

	func test_strtok() {
		XCTAssertEqual(php.strtok("@;w;d;g", ";") as! [String], ["@", "w", "d", "g"])
		XCTAssertEqual(php.strtok("@;w;d;g", "x") as? Bool, false)
	}

	func test_strtolower() {
		XCTAssertEqual(php.strtolower("@WDG"), "@wdg")
	}

	func test_strtoupper() {
		XCTAssertEqual(php.strtoupper("@wdg"), "@WDG")
	}

	func test_strtr() {
		XCTAssertEqual(php.strtr("Hello äåö", "äåö", "you"), "Hello you")
	}

	func test_substr_compare() {
        XCTAssertEqual(php.substr_compare("abcdef", "bc", 1, 2), 0)
        XCTAssertEqual(php.substr_compare("abcdef", "BC", 1, 2, true), 0)
        XCTAssertEqual(php.substr_compare("abcdef", "bd", 1, 2), -1)
	}

	func test_substr_count() {
        XCTAssertEqual(php.substr_count("abcabcabc", "abc"), 3)
        XCTAssertEqual(php.substr_count("abcabcabc", "abc", 3), 2)
        XCTAssertEqual(php.substr_count("aaaa", "aa"), 2)
	}

	func test_substr_replace() {
        XCTAssertEqual(php.substr_replace("abcdef", "X", 2, 3), "abXf")
        XCTAssertEqual(php.substr_replace("abcdef", "X", -3, 2), "abcXf")
        XCTAssertEqual(php.substr_replace("abcdef", "X", 3, 0), "abcXdef")
	}

	func test_substr() {
		XCTAssertEqual(php.substr("@@wdg", -4), "@wdg")
	}

	func test_trim() {
		XCTAssertEqual(php.trim("   @wdg         "), "@wdg")
	}

	func test_ucfirst() {
		XCTAssertEqual(php.ucfirst("wDG"), "WDG")
	}

	func test_ucwords() {
		XCTAssertEqual(php.ucwords("wDG wDG"), "WDG WDG")
	}

	func test_vfprintf() {
		// if no crash then pass
		php.vfprintf(E)
	}

	func test_vprintf() {
		php.vprintf(E)
	}

	func test_vsprintf() {
		php.vsprintf(E)
	}

	func test_wordwrap() {
		XCTAssertEqual(php.wordwrap("wdg", 0, "\n", true), "w\nd\ng\n")
	}
}
