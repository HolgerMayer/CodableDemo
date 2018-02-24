//
//  BasicTests.swift
//  CodableDemoTests
//
//  Created by holgermayer on 24.02.18.
//  Copyright © 2018 holgermayer. All rights reserved.
//

import XCTest
@testable import CodableDemo

class BasicTests: XCTestCase {
    
    func testStruct() {
        // Setup testcase
        
        let objectToSave = BasicStruct(1,aString:"Test")
        XCTAssertNotNil(objectToSave,"Object to save should be creatable")
        XCTAssertTrue(objectToSave.iValue == 1,"Object to save iValue should be >1< is >\(objectToSave.iValue)<")
        XCTAssertTrue(objectToSave.aString == "Test","Object to save aString should be >Test< is >\(objectToSave.aString)<")
        
        // Run testcase
        
        let archiver = NSKeyedArchiver()
        try! archiver.encodeEncodable(objectToSave, forKey: NSKeyedArchiveRootObjectKey)
        
        let data =  archiver.encodedData
        
        let unarchiver = NSKeyedUnarchiver(forReadingWith: data)
        
        let objectLoaded = try! unarchiver.decodeTopLevelDecodable(BasicStruct.self, forKey: NSKeyedArchiveRootObjectKey)
        
        // Verify result
        
        XCTAssertNotNil(objectLoaded,"Object loaded should be creatable")
        XCTAssertTrue(objectLoaded?.iValue == 1,"Object loaded iValue should be >1< is >\((objectLoaded?.iValue)!)<")
        XCTAssertTrue(objectLoaded?.aString == "Test","Object loaded aString should be >Test< is >\((objectLoaded?.aString)!)<")

    }
 
    func testClass() {
        // Setup testcase
        
        let objectToSave = BasicClass(1,aString:"Test")
        XCTAssertNotNil(objectToSave,"Object to save should be creatable")
        XCTAssertTrue(objectToSave.iValue == 1,"Object to save iValue should be >1< is >\(objectToSave.iValue)<")
        XCTAssertTrue(objectToSave.aString == "Test","Object to save aString should be >Test< is >\(objectToSave.aString)<")
        
        // Run testcase
        
        let archiver = NSKeyedArchiver()
        try! archiver.encodeEncodable(objectToSave, forKey: NSKeyedArchiveRootObjectKey)
        
        let data =  archiver.encodedData
        
        let unarchiver = NSKeyedUnarchiver(forReadingWith: data)
        
        let objectLoaded = try! unarchiver.decodeTopLevelDecodable(BasicClass.self, forKey: NSKeyedArchiveRootObjectKey)
        
        // Verify result
        
        XCTAssertNotNil(objectLoaded,"Object loaded should be creatable")
        XCTAssertTrue(objectLoaded?.iValue == 1,"Object loaded iValue should be >1< is >\((objectLoaded?.iValue)!)<")
        XCTAssertTrue(objectLoaded?.aString == "Test","Object loaded aString should be >Test< is >\((objectLoaded?.aString)!)<")
    }

    func testEnum() {
        // Setup testcase

        let objectToSave = BasicEnum.iValue(8)
        XCTAssertNotNil(objectToSave,"Object to save should be creatable")
        
        switch objectToSave {
        case .iValue( let w):
                XCTAssertTrue(w == 8, "w should be 8 is \(w)")
          case .aString(let aString):
                XCTAssertTrue(false,"Should not be a aString \(aString)")
        }
        
        // Run testcase

        let archiver = NSKeyedArchiver()
        try! archiver.encodeEncodable(objectToSave, forKey: NSKeyedArchiveRootObjectKey)
        
        let data =  archiver.encodedData
        
        let unarchiver = NSKeyedUnarchiver(forReadingWith: data)
        
        let objectLoaded = try! unarchiver.decodeTopLevelDecodable(BasicEnum.self, forKey: NSKeyedArchiveRootObjectKey)

        // Verify result
        XCTAssertNotNil(objectLoaded,"Object to save should be creatable")
        
        switch objectLoaded! {
        case .iValue( let w):
            XCTAssertTrue(w == 8, "w should be 8 is \(w)")
        case .aString(let aString):
            XCTAssertTrue(false,"Should not be a string \(aString)")
        }
    }

    
}
