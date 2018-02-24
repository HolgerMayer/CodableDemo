//
//  ParentClass.swift
//  CodableDemo
//
//  Created by holgermayer on 23.02.18.
//  Copyright © 2018 holgermayer. All rights reserved.
//

import Foundation


class ParentClass : Codable {
    var aString : String = ""
    
    init(_ aString:String) {
        self.aString = aString
    }
    
 
}

