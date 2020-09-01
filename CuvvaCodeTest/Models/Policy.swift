//
//  Policy.swift
//  CuvvaCodeTest
//
//  Created by Shyam Bhudia on 31/08/2020.
//  Copyright © 2020 Shyam Bhudia. All rights reserved.
//

import Foundation
import RealmSwift
// MARK: - Policy
class Policy: Object, Codable {
    @objc dynamic var typeString: String?
    @objc dynamic var timestamp: String?
    @objc dynamic var uniqueKey: String?
    @objc dynamic var payload: Payload?
    
    var type: Type? {
        return Type(rawValue: typeString ?? "")
    }
    
    enum CodingKeys: String, CodingKey {
        case typeString = "type"
        case timestamp
        case uniqueKey = "unique_key"
        case payload
    }
}



enum Type: String, Codable {
    case policyCancelled = "policy_cancelled"
    case policyCreated = "policy_created"
    case policyFinancialTransaction = "policy_financial_transaction"
}
