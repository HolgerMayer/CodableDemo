//
//  InhertitanceAndCollectionsTests.swift
//  CodableDemoTests
//
//  Created by holgermayer on 07.03.18.
//  Copyright © 2018 holgermayer. All rights reserved.
//

import XCTest
@testable import CodableDemo

class InhertitanceAndCollectionsTests: XCTestCase {
    
    var testObject =  AnimalWorld()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        self.testObject.data.append(Mammal(family:"Masrupial"))
        self.testObject.data.append(Dog(owner :"Peter"))

    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testHeterogeneousArray() {
        
        // Run testcase
        let archiver = NSKeyedArchiver()
        try! archiver.encodeEncodable(self.testObject, forKey: NSKeyedArchiveRootObjectKey)
        
        let data =  archiver.encodedData
        
        let unarchiver = NSKeyedUnarchiver(forReadingWith: data)
        
        let objectLoaded = try! unarchiver.decodeTopLevelDecodable(AnimalWorld.self, forKey: NSKeyedArchiveRootObjectKey)
        
        // Verify result
        
        XCTAssertNotNil(objectLoaded,"Object loaded should be creatable")
        XCTAssertNotNil(objectLoaded?.data,"Object data  should be created")
        XCTAssertTrue(objectLoaded?.data.count == 2,"There should be 2 items in the array, \((objectLoaded?.data.count)!) found")
        let item0 = objectLoaded?.data[0]
        XCTAssertFalse(item0 is Dog, "Item 0 should not be a Dog")

        let item1 = objectLoaded?.data[1]
        XCTAssertTrue(item1 is Dog, "Item 1 should be a Dog")


    }
    
 
    
}
