//
//  TTTTimeIntervalFormatterTests.swift
//  FormatterKit
//
//  Created by Victor Ilyukevich on 4/27/16.
//  Copyright © 2016. All rights reserved.
//

import XCTest
import FormatterKit

class TTTTimeIntervalFormatterTests: XCTestCase {
    var formatter: TTTTimeIntervalFormatter!

    override func setUp() {
        super.setUp()
        formatter = TTTTimeIntervalFormatter()
    }

    // MARK: Tests

    func testStandardPast() {
        XCTAssertEqual(formatter.string(forTimeInterval: -1), "1 saniye önce")
        XCTAssertEqual(formatter.string(forTimeInterval: -100), "1 dakika önce")
        XCTAssertEqual(formatter.string(forTimeInterval: -10000), "2 saat önce")
        XCTAssertEqual(formatter.string(forTimeInterval: -100000), "1 gün önce")
        XCTAssertEqual(formatter.string(forTimeInterval: -200000), "2 gün önce")
        XCTAssertEqual(formatter.string(forTimeInterval: -10000000), "3 ay önce")
    }

    func testStandardFuture() {
        XCTAssertEqual(formatter.string(forTimeInterval: 1), "1 saniye sonra")
        XCTAssertEqual(formatter.string(forTimeInterval: 100), "1 dakika sonra")
        XCTAssertEqual(formatter.string(forTimeInterval: 10000), "2 saat sonra")
        XCTAssertEqual(formatter.string(forTimeInterval: 100000), "1 gün sonra")
        XCTAssertEqual(formatter.string(forTimeInterval: 200000), "2 gün sonra")
        XCTAssertEqual(formatter.string(forTimeInterval: 10000000), "3 ay sonra")
    }
    
    func testIdiomaticPast() {
        formatter.usesIdiomaticDeicticExpressions = true
        
        XCTAssertEqual(formatter.string(forTimeInterval: -1), "1 saniye önce")
        XCTAssertEqual(formatter.string(forTimeInterval: -100), "1 dakika önce")
        XCTAssertEqual(formatter.string(forTimeInterval: -10000), "2 saat önce")
        XCTAssertEqual(formatter.string(forTimeInterval: -100000), "dün")
        XCTAssertEqual(formatter.string(forTimeInterval: -200000), "evvelki gün")
        XCTAssertEqual(formatter.string(forTimeInterval: -6000000), "evvelki ay")
        XCTAssertEqual(formatter.string(forTimeInterval: -10000000), "3 ay önce")
    }
    
}
