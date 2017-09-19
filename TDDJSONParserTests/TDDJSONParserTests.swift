//
//  TDDJSONParserTests.swift
//  TDDJSONParserTests
//
//  Created by Sergio Sette on 18/09/2017.
//  Copyright © 2017 Sergio Sette. All rights reserved.
//

import XCTest
@testable import TDDJSONParser

class TDDJSONParserTests: XCTestCase {
    var parser: JSONParser!
    override func setUp() {
        parser = JSONParser()
    }
    
    func testEmpty() {
        XCTAssertNil(parser.parse(""))
    }
    
    func testTrue() {
        XCTAssertTrue(parser.parse("true") as! Bool)
    }
    
    func testFalse() {
        XCTAssertFalse(parser.parse("false") as! Bool)
    }
    
    func testNumber() {
        XCTAssertEqual(parser.parse("0") as! Int, 0)
    }
}

class JSONParser {
    func parse(_ json: String) -> Any? {
        return Bool(json) ?? Int(json)
    }
}
