//
//  FormatableClass.swift
//  CodableDemo
//
//  Created by holgermayer on 25.02.18.
//  Copyright © 2018 holgermayer. All rights reserved.
//

import Foundation

class FormatableClass : Codable {
    var now = Date()
    var infiniteValue : Float = 0.0
    var notANumberValue :Float = 0.0 
    
    init() {
        self.infiniteValue = Float.infinity
        self.notANumberValue = Float.nan
    }
    
    enum CodingKeys: String, CodingKey {
        case now
        case infiniteValue
        case notANumberValue
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.now = try container.decode(Date.self, forKey: .now)
        self.infiniteValue = try container.decode(Float.self, forKey: .infiniteValue)
        self.notANumberValue = try container.decode(Float.self, forKey: .notANumberValue)
   }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(now, forKey:.now)
        try container.encode(infiniteValue, forKey:.infiniteValue)
        try container.encode(notANumberValue, forKey:.notANumberValue)
     }
}
