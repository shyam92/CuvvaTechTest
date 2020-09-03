//
//  Policy.swift
//  CuvvaCodeTest
//
//  Created by Shyam Bhudia on 31/08/2020.
//  Copyright © 2020 Shyam Bhudia. All rights reserved.
//

import Foundation
import Realm
import RealmSwift
// MARK: - Policy
class Policy: Object {
    @objc dynamic var typeString: String?
    @objc dynamic var timestamp: Date?
    @objc dynamic var uniqueKey: String?
    @objc dynamic var policyID: String?
    @objc dynamic var originalPolicyID: String?
    @objc dynamic var referenceCode: String?
    @objc dynamic var startDate: Date?
    @objc dynamic var endDate: Date?
    @objc dynamic var incidentPhone: String?
    @objc dynamic var endDateNew: Date?
    @objc dynamic var isVoid: Bool = false
    
    @objc dynamic var documents: Documents?
    
    let transaction = List<Transaction>()
    let extensionPolicies = List<Policy>()
    
    let vehicle = LinkingObjects(fromType: Vehicle.self, property: Vehicle.VehiclePropertyKeys.policies.rawValue)
    
    var type: EventType? {
        get {
            return EventType(rawValue: typeString ?? "")
        }
        set {
            typeString = newValue?.rawValue ?? ""
        }
    }
    
    var isActive: Bool {
        guard let start = startDate, let end = endDate else {
            return false
        }
        return Date().isBetween(start, and: end)
    }
    
    override class func primaryKey() -> String? {
        return PolicyItemKeys.uniqueKey.rawValue
    }
    
    convenience init(typeString: String?,
                     timestamp: Date?,
                     uniqueKey: String?,
                     policyID: String,
                     originalPolicyID: String?,
                     referenceCode: String?,
                     startDate: Date?,
                     endDate: Date?,
                     incidentPhone: String?,
                     endDateNew: Date?,
                     isVoid: Bool?) {
        self.init()
        self.typeString = typeString
        self.timestamp = timestamp
        self.uniqueKey = uniqueKey
        self.policyID = policyID
        self.originalPolicyID = originalPolicyID
        self.referenceCode = referenceCode
        self.startDate = startDate
        self.endDate = endDate
        self.incidentPhone = incidentPhone
        self.isVoid = isVoid ?? false
        self.endDateNew = endDateNew
        self.documents = documents
    }
    

    /// Realm Inverse Relationship Keys
    enum PolicyItemKeys: String {
        case typeString
        case uniqueKey
        case timestamp
        case documents
        case pricing
        case transaction
        case extensionPolicies
    }

}



enum Type: String, Codable {
    case policyCancelled = "policy_cancelled"
    case policyCreated = "policy_created"
    case policyFinancialTransaction = "policy_financial_transaction"
}
