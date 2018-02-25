//
//  BasicClassWithNilValue.swift
//  CodableDemo
//
//  Created by holgermayer on 25.02.18.
//  Copyright © 2018 holgermayer. All rights reserved.
//

import Foundation

class BasicClassWithNilValue : Codable {
    var iValue : Int
    var aString : String?
    
    
    init(_ iValue: Int) {
        self.iValue = iValue
    }
}

