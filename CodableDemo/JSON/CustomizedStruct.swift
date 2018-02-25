//
//  CustomizedStruct.swift
//  CodableDemo
//
//  Created by holgermayer on 25.02.18.
//  Copyright © 2018 holgermayer. All rights reserved.
//

import Foundation

struct CustomizedStruct : Codable {
    var iValue : Int
    var aString : String
    
    enum CodingKeys: String, CodingKey {
        case iValue = "age"
        case aString = "name"
    }
    
    init(_ iValue: Int, aString : String) {
        self.iValue = iValue
        self.aString = aString
    }
}

