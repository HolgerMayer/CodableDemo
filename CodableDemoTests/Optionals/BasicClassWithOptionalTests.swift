//
//  BaisClassWithOptionalTests.swift
//  CodableDemoTests
//
//  Created by holgermayer on 25.02.18.
//  Copyright © 2018 holgermayer. All rights reserved.
//

import XCTest
@testable import CodableDemo

class BasicClassWithOptionalTests: XCTestCase {
    
    
    func testBasicClassWithNilAsStringValue() {

        // Setup testcase
        
        let objectToSave = BasicClassWithNilValue(1)
        XCTAssertNotNil(objectToSave,"Object to save should be creatable")
        XCTAssertTrue(objectToSave.iValue == 1,"Object to save iValue should be >1< is >\(objectToSave.iValue)<")
        XCTAssertNil(objectToSave.aString ,"Object to save aString should be nil is >\(objectToSave.aString)<")
        
        // Run testcase
        
        let archiver = NSKeyedArchiver()
        try! archiver.encodeEncodable(objectToSave, forKey: NSKeyedArchiveRootObjectKey)
        
        let data =  archiver.encodedData
        
        let unarchiver = NSKeyedUnarchiver(forReadingWith: data)
        
        let objectLoaded = try! unarchiver.decodeTopLevelDecodable(BasicClassWithNilValue.self, forKey: NSKeyedArchiveRootObjectKey)
        
        // Verify result
        
        XCTAssertNotNil(objectLoaded,"Object loaded should be creatable")
        XCTAssertTrue(objectLoaded?.iValue == 1,"Object loaded iValue should be >1< is >\((objectLoaded?.iValue)!)<")
        XCTAssertNil(objectLoaded?.aString ,"Object to save aString should be nil is >\((objectLoaded?.aString)!)<")
    }
    
  
    
}
