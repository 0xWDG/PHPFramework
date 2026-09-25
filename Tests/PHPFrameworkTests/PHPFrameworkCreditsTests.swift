import Foundation
@testable import PHPFramework
//
//  PHPFrameworkCreditsTests.swift
//  PHPFramework
//
//  Created by Wesley de Groot on 13-02-16.
//  Copyright © 2016 WDGWV. All rights reserved.
//
import XCTest

extension PHPFrameworkTests {
    func testCredits_nl() {
        XCTAssertNotNil(PFSnl)
    }

    func testCredits_credits() {
        XCTAssertNotNil(PFSCredits)
    }
}
