//
//  FormatTests.swift
//  CodableDemoTests
//
//  Created by holgermayer on 25.02.18.
//  Copyright © 2018 holgermayer. All rights reserved.
//

import XCTest
@testable import CodableDemo

class FormatTests: XCTestCase {
    
    func testJSON() {
        let objectToSave = FormatableClass()
        let now = objectToSave.now
        XCTAssertTrue(objectToSave.infiniteValue == Float.infinity,"InfinitValue should be infinit")
        XCTAssertTrue(objectToSave.notANumberValue == Float.nan,"Not a Number Value should be not a Number")
        
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        encoder.nonConformingFloatEncodingStrategy =
            .convertToString(
                positiveInfinity: "+Infinity",
                negativeInfinity: "-Infinity",
                nan: "NaN")
        
        let data = try! encoder.encode(objectToSave)
        let jsonString = String(data:data, encoding: .utf8)!
        
        print(jsonString)
        
        let jsonData = jsonString.data(using: .utf8)!
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        decoder.nonConformingFloatDecodingStrategy =
            .convertFromString(
                positiveInfinity: "+Infinity",
                negativeInfinity: "-Infinity",
                nan: "NaN")
        
        
        let objectToLoad = try! decoder.decode(FormatableClass.self, from: jsonData)
        
        XCTAssertNotNil(objectToLoad,"Object loaded should be creatable")
        XCTAssertTrue(objectToLoad.now == now,"Object loaded date should be >\(now) is >\(objectToLoad.now)<")
        XCTAssertTrue(objectToLoad.infiniteValue == Float.infinity,"InfinitValue should be infinit")
        XCTAssertTrue(objectToLoad.notANumberValue == Float.nan,"Not a Number Value should be not a Number")

    }
}
