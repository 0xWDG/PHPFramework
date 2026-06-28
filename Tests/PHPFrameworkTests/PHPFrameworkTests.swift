//
//  PHPFrameworkTests.swift
//  PHPFrameworkTests
//
//  Created by Wesley de Groot on 15-01-16.
//  Copyright © 2016 WDGWV. All rights reserved.
//

import XCTest
@testable import PHPFramework

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
class PHPFrameworkTests: XCTestCase {
    let php = PHPFramework(false)
    let E: String = PHPFramework().getcwd()
    let PASS: String = "Tend"
    let FAIL: String = "FAIL"

    /// Our internal test function.
    ///
    /// - Paramter Tin: test input 1
    /// - Parameter Tend: test input 2
    /// - Parameter deb: debug (default: false)
    internal func Test(_ Tin: Any = "Tin", _ Tend: Any = "Tend", _ deb: Bool = false) -> String {
        let _retVal: String = String("?")
        if deb {
            return "\(_retVal) I1=\"\(Tin)\" I2=\"\(Tend)\""
        }

        return _retVal
    }
}
