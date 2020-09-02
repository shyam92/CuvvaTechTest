//
//  APIEvent.swift
//  CuvvaCodeTest
//
//  Created by Shyam Bhudia on 02/09/2020.
//  Copyright © 2020 Shyam Bhudia. All rights reserved.
//

import Foundation
import RealmSwift
struct APIEvent: Codable {
    var type: EventType
    var timestamp: Date
    var uniqueKey: String
    var payload: APIPayload
    
    enum CodingKeys: String, CodingKey {
        case type
        case timestamp
        case uniqueKey = "unique_key"
        case payload
    }
    
}

enum EventType: String, Codable {
    case policyCancelled = "policy_cancelled"
    case policyCreated = "policy_created"
    case policyFinancialTransaction = "policy_financial_transaction"
}

extension APIEvent {
    func mapToDatabase() -> Policy {
        let policy = Policy(typeString: type.rawValue,
                                       timestamp: timestamp,
                                       uniqueKey: uniqueKey,
                                       policyID: payload.policyID,
                                       originalPolicyID: payload.originalPolicyID,
                                       referenceCode: payload.referenceCode,
                                       startDate: payload.startDate,
                                       endDate: payload.endDate,
                                       incidentPhone: payload.incidentPhone,
                                       endDateNew: payload.endDate,
                                       isVoid: payload.type == "void")
        return policy
    }
}
