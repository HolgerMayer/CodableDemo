//
//  ComplexTest.swift
//  CodableDemoTests
//
//  Created by holgermayer on 25.02.18.
//  Copyright © 2018 holgermayer. All rights reserved.
//

import XCTest
@testable import CodableDemo

class ComplexTest: XCTestCase {
    
    
    func testClass() {
        // Setup testcase
        
        let objectToSave = ComplexClass()
        
        XCTAssertNotNil(objectToSave,"Object to save should be creatable")
        XCTAssertTrue(objectToSave.aString == "Test","Object to save aString should be >Test< is >\(objectToSave.aString)<")
        XCTAssertTrue(objectToSave.aStruct.aString == "Test","Object to save aStruct.aString should be >Test< is >\(objectToSave.aStruct.aString)<")
        XCTAssertTrue(objectToSave.aStruct.iValue == 1,"Object to save aStruct.iValue should be >1< is >\(objectToSave.aStruct.iValue)<")
        XCTAssertTrue(objectToSave.aClass.aString == "Test","Object to save aClass.aString should be >Test< is >\(objectToSave.aClass.aString)<")
        XCTAssertTrue(objectToSave.aClass.iValue == 1,"Object to save aClass.iValue should be >1< is >\(objectToSave.aClass.iValue)<")
        
        // Run testcase
        
        let archiver = NSKeyedArchiver()
        try! archiver.encodeEncodable(objectToSave, forKey: NSKeyedArchiveRootObjectKey)
        
        let data =  archiver.encodedData
        
        let unarchiver = NSKeyedUnarchiver(forReadingWith: data)
        
        let objectLoaded = try! unarchiver.decodeTopLevelDecodable(ComplexClass.self, forKey: NSKeyedArchiveRootObjectKey)
        
        // Verify result
        
        XCTAssertNotNil(objectLoaded,"Object loaded should be creatable")
        XCTAssertTrue(objectLoaded?.aString == "Test","Object loaded aString should be >Test< is >\((objectLoaded?.aString)!)<")
        XCTAssertTrue(objectLoaded?.aStruct.iValue == 1,"Object loaded aStruct.iValue should be >1< is >\((objectLoaded?.aStruct.iValue)!)<")
        XCTAssertTrue(objectLoaded?.aStruct.aString == "Test","Object loaded aStruct.String should be >Test< is >\((objectLoaded?.aStruct.aString)!)<")
        XCTAssertTrue(objectLoaded?.aClass.iValue == 1,"Object loaded aClass.iValue should be >1< is >\((objectLoaded?.aClass.iValue)!)<")
        XCTAssertTrue(objectLoaded?.aClass.aString == "Test","Object loaded aClass.aString should be >Test< is >\((objectLoaded?.aClass.aString)!)<")
    }
    
    func testStruct() {
        // Setup testcase
        
        let objectToSave = ComplexStruct()
        
        XCTAssertNotNil(objectToSave,"Object to save should be creatable")
        XCTAssertTrue(objectToSave.aString == "Test","Object to save aString should be >Test< is >\(objectToSave.aString)<")
        XCTAssertTrue(objectToSave.aStruct.aString == "Test","Object to save aStruct.aString should be >Test< is >\(objectToSave.aStruct.aString)<")
        XCTAssertTrue(objectToSave.aStruct.iValue == 1,"Object to save aStruct.iValue should be >1< is >\(objectToSave.aStruct.iValue)<")
        XCTAssertTrue(objectToSave.aClass.aString == "Test","Object to save aClass.aString should be >Test< is >\(objectToSave.aClass.aString)<")
        XCTAssertTrue(objectToSave.aClass.iValue == 1,"Object to save aClass.iValue should be >1< is >\(objectToSave.aClass.iValue)<")

        // Run testcase
        
        let archiver = NSKeyedArchiver()
        try! archiver.encodeEncodable(objectToSave, forKey: NSKeyedArchiveRootObjectKey)
        
        let data =  archiver.encodedData
        
        let unarchiver = NSKeyedUnarchiver(forReadingWith: data)
        
        let objectLoaded = try! unarchiver.decodeTopLevelDecodable(ComplexClass.self, forKey: NSKeyedArchiveRootObjectKey)
        
        // Verify result
        
        XCTAssertNotNil(objectLoaded,"Object loaded should be creatable")
        XCTAssertTrue(objectLoaded?.aString == "Test","Object loaded aString should be >Test< is >\((objectLoaded?.aString)!)<")
        XCTAssertTrue(objectLoaded?.aStruct.iValue == 1,"Object loaded aStruct.iValue should be >1< is >\((objectLoaded?.aStruct.iValue)!)<")
        XCTAssertTrue(objectLoaded?.aStruct.aString == "Test","Object loaded aStruct.String should be >Test< is >\((objectLoaded?.aStruct.aString)!)<")
        XCTAssertTrue(objectLoaded?.aClass.iValue == 1,"Object loaded aClass.iValue should be >1< is >\((objectLoaded?.aClass.iValue)!)<")
        XCTAssertTrue(objectLoaded?.aClass.aString == "Test","Object loaded aClass.aString should be >Test< is >\((objectLoaded?.aClass.aString)!)<")
    }

}
