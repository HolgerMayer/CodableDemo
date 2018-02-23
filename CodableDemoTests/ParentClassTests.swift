//
//  ParentClassTests.swift
//  CodableDemoTests
//
//  Created by holgermayer on 23.02.18.
//  Copyright © 2018 holgermayer. All rights reserved.
//

import XCTest
@testable import CodableDemo

class ParentClassTests: XCTestCase {
    
 
    
    func testSaveLoad() {
        
        // Setup testcase
        
        let objectToSave = ParentClass("Test")
        XCTAssertNotNil(objectToSave,"Object to save should be creatable")
        XCTAssertTrue(objectToSave.aString == "Test","Object to save aString should be >Test< is >\(objectToSave.aString)<")
        
        // Run testcase
        
        let archiver = NSKeyedArchiver()
        try! archiver.encodeEncodable(objectToSave, forKey: NSKeyedArchiveRootObjectKey)
        
        let data =  archiver.encodedData
        
        let unarchiver = NSKeyedUnarchiver(forReadingWith: data)
        
        let objectLoaded = try! unarchiver.decodeTopLevelDecodable(ParentClass.self, forKey: NSKeyedArchiveRootObjectKey)
        
        // Verify result
        
        XCTAssertNotNil(objectLoaded,"Object loaded should be creatable")
        XCTAssertTrue(objectLoaded?.aString == "Test","Object loaded aString should be >Test< is >\((objectLoaded?.aString)!)<")

        
    }
  
    
}
