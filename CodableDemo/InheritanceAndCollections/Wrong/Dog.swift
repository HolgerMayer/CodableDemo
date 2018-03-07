//
//  Dog.swift
//  CodableDemo
//
//  Created by holgermayer on 07.03.18.
//  Copyright © 2018 holgermayer. All rights reserved.
//

import Foundation

class Dog : Mammal {
    var owner : String?
    
    init(owner : String) {
        self.owner = owner
        
        super.init(family:"Canidae")
        
    }
    
    private enum CodingKeys: String, CodingKey {
        case owner
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.owner = try container.decode(String.self, forKey: .owner)
        try super.init(from: decoder)
        
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(owner, forKey:.owner)
        try super.encode(to: encoder)
    }
}
