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
}

class JSONParser {
    func parse(_ json: String) -> Any? {
        return json == "true" ? true : nil
    }
}
