//
//  AnimalWorld.swift
//  CodableDemo
//
//  Created by holgermayer on 07.03.18.
//  Copyright © 2018 holgermayer. All rights reserved.
//

import Foundation

class AnimalWorld  : Codable {
    var data : [Mammal]
    
    private enum CodingKeys: String, CodingKey {
         case data
     }
    
    private enum ContentItemCodingKeyes: String, CodingKey {
        case item
        case itemType
        case itemValue
    }
    
    private enum ContentTypes: String, CodingKey {
        case mammal
        case dog
    }
    
    public init() {
        self.data = [Mammal]()
    }
    

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        var contentContainer = try container.nestedUnkeyedContainer(forKey: .data)
        self.data = [Mammal]()
        
        while !contentContainer.isAtEnd {
            var itemContainer = try contentContainer.nestedContainer(keyedBy:  ContentItemCodingKeyes.self)
            let type = try itemContainer.decode(String.self, forKey: .itemType)
            
            switch (type) {
            case ContentTypes.mammal.rawValue:
                let item = try itemContainer.decode(Mammal.self, forKey: .itemValue)
                self.data.append(item)
            case ContentTypes.dog.rawValue:
                let item = try itemContainer.decode(Dog.self, forKey: .itemValue)
                self.data.append(item)

            default:
                break
            }
        }
    }
    
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        var contentContainer = container.nestedUnkeyedContainer(forKey: .data)
        
        for item in data {
            var itemContainer = contentContainer.nestedContainer(keyedBy: ContentItemCodingKeyes.self)
            if item is Dog {
                try itemContainer.encode(ContentTypes.dog.rawValue, forKey:.itemType)
            } else {
                try itemContainer.encode(ContentTypes.mammal.rawValue, forKey:.itemType)
            }
            
            try itemContainer.encode(item, forKey:.itemValue)
        }
    }
    
}
