//
//  BasicClass.swift
//  CodableDemo
//
//  Created by holgermayer on 24.02.18.
//  Copyright © 2018 holgermayer. All rights reserved.
//

import Foundation

class BasicClass : Codable {
    var iValue : Int
    var aString : String
    
    
    init(_ iValue: Int, aString : String) {
        self.iValue = iValue
        self.aString = aString
    }
}
