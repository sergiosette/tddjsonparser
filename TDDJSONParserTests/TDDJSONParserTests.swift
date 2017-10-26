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
        assertNil("")
    }
    
    func testTrue() {
        assert("true", parsesTo: true)
    }
    
    func testFalse() {
        assert("false", parsesTo: false)
    }
    
    func testNumber() {
        assert("0", parsesTo: Int(0))
    }
    
    func testDouble() {
        assert("0.0", parsesTo: Double(0.0))
    }
    
    func testEmptyString() {
        assert("\"\"", parsesTo: "")
    }
    
    func testUnfinishedQuote() {
        assertNil("\"")
    }
    
    func testString() {
        assert("\"aString\"", parsesTo: "aString")
    }
    
    func assert<T: Equatable>(_ json: String, parsesTo target: T) {
        guard let parsed = parser.parse(json) as? T else { XCTFail("Parsed item \(json) is not of type \(T.self)"); return }
        XCTAssertEqual(parsed, target)
    }
    
    func assertNil(_ json: String) {
        XCTAssertNil(parser.parse(json))
    }
}

class JSONParser {
    func parse(_ json: String) -> Any? {
        return Bool(json) ?? Int(json) ?? Double(json) ?? parseString(json)
    }
    
    private func parseString(_ text: String) -> String? {
        guard text.count > 1 else { return nil }
        switch (text.first, text.last) {
        case ("\""?, "\""?): return String(text.dropFirst().dropLast())
        default: return nil
        }
    }
}
