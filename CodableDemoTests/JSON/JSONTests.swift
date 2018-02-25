//
//  JSONTests.swift
//  CodableDemoTests
//
//  Created by holgermayer on 25.02.18.
//  Copyright © 2018 holgermayer. All rights reserved.
//

import XCTest
@testable import CodableDemo

class JSONTests: XCTestCase {

    func testJSON() {
        let objectToSave = BasicStruct(1,aString:"Test")
        
        let encoder = JSONEncoder()
        let data = try! encoder.encode(objectToSave)
        let jsonString = String(data:data, encoding: .utf8)!

        XCTAssertTrue(jsonString == "{\"iValue\":1,\"aString\":\"Test\"}")
        
        let jsonData = jsonString.data(using: .utf8)!
        let decoder = JSONDecoder()
        let objectToLoad = try! decoder.decode(BasicStruct.self, from: jsonData)
        
        XCTAssertNotNil(objectToSave,"Object loaded should be creatable")
        XCTAssertTrue(objectToSave.iValue == 1,"Object loaded iValue should be >1< is >\(objectToSave.iValue)<")
        XCTAssertTrue(objectToSave.aString == "Test","Object loaded aString should be >Test< is >\(objectToLoad.aString)<")

    }

    func testCustomizedStructWithJSON() {
        let objectToSave = CustomizedStruct(1,aString:"Test")
        
        let encoder = JSONEncoder()
        let data = try! encoder.encode(objectToSave)
        let jsonString = String(data:data, encoding: .utf8)!
        
        XCTAssertTrue(jsonString == "{\"age\":1,\"name\":\"Test\"}")
        
        
        let jsonData = jsonString.data(using: .utf8)!
        let decoder = JSONDecoder()
        let objectToLoad = try! decoder.decode(CustomizedStruct.self, from: jsonData)
        
        XCTAssertNotNil(objectToSave,"Object loaded should be creatable")
        XCTAssertTrue(objectToSave.iValue == 1,"Object loaded iValue should be >1< is >\(objectToSave.iValue)<")
        XCTAssertTrue(objectToSave.aString == "Test","Object loaded aString should be >Test< is >\(objectToLoad.aString)<")

    }

}
