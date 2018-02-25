//
//  CustomClassWithNilValueOK.swift
//  CodableDemo
//
//  Created by holgermayer on 25.02.18.
//  Copyright © 2018 holgermayer. All rights reserved.
//

import Foundation

class CustomClassWithNilValueOK : Codable {
    var iValue : Int
    var aString : String?
    
    
    init(_ iValue: Int) {
        self.iValue = iValue
    }
    
    
    enum CodingKeys: String, CodingKey {
        case iValue = "age"
        case aString = "name"
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.iValue = try container.decode(Int.self, forKey: .iValue)
        self.aString = try container.decodeIfPresent(String.self, forKey: .aString) // This is correct
        
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(iValue, forKey:.iValue)
        try container.encodeIfPresent(aString, forKey:.aString) // This is correct
    }
}


