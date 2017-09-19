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
    func testEmpty() {
        let parser = JSONParser()
        XCTAssertNil(parser.parse(""))
    }
}

class JSONParser {
    func parse(_ json: String) -> Any? {
        return nil
    }
}
