//
//  ChildClass.swift
//  CodableDemo
//
//  Created by holgermayer on 23.02.18.
//  Copyright © 2018 holgermayer. All rights reserved.
//

import Foundation

class ChildClass : ParentClass {
    
    var bString : String = ""
    
    init(_ aString : String, bString : String) {
        self.bString = bString

        super.init(aString)
 
     }
    
    required init(from decoder: Decoder) throws {
       // fatalError("init(from:) has not been implemented")
        try super.init(from: decoder)
    }
    
  
}
