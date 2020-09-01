//
//  Payload.swift
//  CuvvaCodeTest
//
//  Created by Shyam Bhudia on 01/09/2020.
//  Copyright © 2020 Shyam Bhudia. All rights reserved.
//

import Foundation
import RealmSwift
// MARK: - Payload
class Payload: Object, Codable {
    @objc dynamic var userID: String?
    @objc dynamic var userRevision: String?
    @objc dynamic var policyID: String
    @objc dynamic var originalPolicyID: String?
    @objc dynamic var referenceCode: String?
    @objc dynamic var startDate: String?
    @objc dynamic var endDate: String?
    @objc dynamic var incidentPhone: String?
    @objc dynamic var endDateNew: String?
    
    @objc dynamic var vehicle: Vehicle?
    @objc dynamic var documents: Documents?
    @objc dynamic var pricing: Pricing?
    
    enum CodingKeys: String, CodingKey {
        case userID = "user_id"
        case userRevision = "user_revision"
        case policyID = "policy_id"
        case originalPolicyID = "original_policy_id"
        case referenceCode = "reference_code"
        case startDate = "start_date"
        case endDate = "end_date"
        case incidentPhone = "incident_phone"
        case vehicle
        case documents
        case pricing
        case endDateNew = "new_end_date"
    }
}
