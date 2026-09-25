//
//  PHPFrameworkFileSystem.swift
//  PHPFramework
//
//  Created by Wesley de Groot on 23-02-16.
//  Copyright © 2016 WDGWV. All rights reserved.
//

import Foundation
@testable import PHPFramework
import XCTest

// PFS = PHP.Framework Shared
// PFT = PHP.Framework Tests (internal)
// PFI = PHP.Framework Internal
// PFP = PHP.Framework Public

var PFTDIRTest: Bool = false

extension PHPFrameworkTests {
    func test_dir_test_remove_me_please_after_finishing_writing_the_testcase_in_createDir_function() {
        PFTcreateDir()
    }

    func PFTcreateDir() {
        // if passed
        PFTDIRTest = true

        XCTAssert(PFTDIRTest, "Failed something before, we'll also gonna fail!")
    }

    func test_mkdir() {
        XCTAssert(PFTDIRTest, "parent has failed.")
    }
}
