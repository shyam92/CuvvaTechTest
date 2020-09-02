//
//  Realm+Decodable.swift
//  CuvvaCodeTest
//
//  Created by Shyam Bhudia on 01/09/2020.
//  Copyright © 2020 Shyam Bhudia. All rights reserved.
//

import Foundation
import RealmSwift


extension RealmOptional where Value : Decodable {
    public convenience init(from decoder: Decoder) throws {
        
        self.init()
        
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            let type = (Value.self as Decodable.Type)
            let decodable = try type.init(from: decoder)
            if let value = decodable as? Value {
                self.value = value
            }
        }
    }
}
