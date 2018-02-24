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
    
    private enum CodingKeys: String, CodingKey {
        case aString
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.aString = try container.decode(String.self, forKey: .aString)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(aString, forKey:.aString)
     }

}

