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
    
    private enum CodingKeys: String, CodingKey {
        case bString
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.bString = try container.decode(String.self, forKey: .bString)
        try super.init(from: decoder)

    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(bString, forKey:.bString)
        try super.encode(to: encoder)
    }
}
