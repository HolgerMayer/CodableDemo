//
//  ComplexClass.swift
//  CodableDemo
//
//  Created by holgermayer on 25.02.18.
//  Copyright © 2018 holgermayer. All rights reserved.
//

import Foundation

class ComplexClass : Codable {
    var aString = "Test"
    var aStruct = BasicStruct(1,aString:"Test")
    var aClass  = BasicClass(1,aString:"Test")
    var anEnum  = BasicEnum.iValue(8)
}
