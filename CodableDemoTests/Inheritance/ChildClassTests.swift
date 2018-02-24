//
//  ChildClassTests.swift
//  CodableDemoTests
//
//  Created by holgermayer on 23.02.18.
//  Copyright © 2018 holgermayer. All rights reserved.
//

import XCTest
@testable import CodableDemo

class ChildClassTests: XCTestCase {
    
    
    
    func testSaveLoad() {
        
        // Setup testcase
        
        let objectToSave = ChildClass("Test",bString:"Lets Try")
        XCTAssertNotNil(objectToSave,"Object to save should be creatable")
        XCTAssertTrue(objectToSave.aString == "Test","Object to save aString should be >Test< is >\(objectToSave.aString)<")
        XCTAssertTrue(objectToSave.bString == "Lets Try","Object to save bString should be >Lets Try< is >\(objectToSave.bString)<")
        
        do {
        // Run testcase
        let archiver = NSKeyedArchiver()
        try! archiver.encodeEncodable(objectToSave, forKey: NSKeyedArchiveRootObjectKey)
        
        let data =  archiver.encodedData
        
        let unarchiver = NSKeyedUnarchiver(forReadingWith: data)
        
        let objectLoaded = try! unarchiver.decodeTopLevelDecodable(ChildClass.self, forKey: NSKeyedArchiveRootObjectKey)
        
        } catch {
            print("Error")
        }
        // Verify result
        
        XCTAssertNotNil(objectLoaded,"Object loaded should be creatable")
        XCTAssertTrue(objectLoaded?.aString == "Test","Object loaded aString should be >Test< is >\((objectLoaded?.aString)!)<")
        XCTAssertTrue(objectLoaded?.bString == "Lets Try","Object to save bString should be >Lets Try< is >\((objectLoaded?.bString)!)<")

 }
    
    
}

