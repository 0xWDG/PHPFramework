//
//  PHPFrameworkCreditsTests.swift
//  PHPFramework
//
//  Created by Wesley de Groot on 13-02-16.
//  Copyright © 2016 WDGWV. All rights reserved.
//
import XCTest
@testable import PHPFramework
import Foundation

extension PHPFrameworkTests {
    func testCredits_nl() {
        XCTAssertNotNil(PFSnl)
    }

    func testCredits_credits() {
        XCTAssertNotNil(PFSCredits)
    }
}
