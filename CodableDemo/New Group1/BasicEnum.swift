//
//  BasicEnum.swift
//  CodableDemo
//
//  Created by holgermayer on 24.02.18.
//  Copyright © 2018 holgermayer. All rights reserved.
//

import Foundation


enum BasicEnum  : Codable {
    case iValue(Int)
    case aString(String)
    
    enum CodingError: Error { case decoding(String) }
    enum CodableKeys: String, CodingKey { case iValue, aString }

    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodableKeys.self)

        if let iValue = try? values.decode(Int.self, forKey: .iValue) {
            self = .iValue(iValue)
            return
        }
        
        if let aString = try? values.decode(String.self, forKey: .aString) {
            self = .aString(aString)
            return
        }
        
        throw CodingError.decoding("Decoding Failed. \(dump(values))")
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodableKeys.self)
        
        switch self {
        case let .iValue(w):
            try container.encode(w, forKey: .iValue)
        case let .aString(aString):
            try container.encode(aString, forKey: .aString)
        }
    }
    

 
    
}
