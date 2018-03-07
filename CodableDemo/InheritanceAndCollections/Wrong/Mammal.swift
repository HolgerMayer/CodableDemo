//
//  Animal.swift
//  CodableDemo
//
//  Created by holgermayer on 07.03.18.
//  Copyright © 2018 holgermayer. All rights reserved.
//

import Foundation


class Mammal  : Codable {
    var family : String = "Mammalia"
    
     init(family:String) {
        self.family = family
    }
    
    private enum CodingKeys: String, CodingKey {
        case family
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.family = try container.decode(String.self, forKey: .family)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(family, forKey:.family)
    }
}
