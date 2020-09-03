//
//  Payload.swift
//  CuvvaCodeTest
//
//  Created by Shyam Bhudia on 01/09/2020.
//  Copyright © 2020 Shyam Bhudia. All rights reserved.
//

import Foundation
import RealmSwift

class Transaction: Object {
    @objc dynamic var timestamp: Date?
    @objc dynamic var pricing: Pricing?
    @objc dynamic var key: String?
    
    /// Policy relationship: Inverse
    let policyElement = LinkingObjects(fromType: Policy.self, property: Policy.PolicyItemKeys.transaction.rawValue)

    
    /// Realm Inverse Relationship Keys
    enum TransactionItemKeys: String {
        case timestamp
        case pricing
        case key
    }
    
    convenience init(timestamp: Date?, pricing: Pricing?, key: String?) {
        self.init()
        self.timestamp = timestamp
        self.pricing = pricing
        self.key = key
    }
}



