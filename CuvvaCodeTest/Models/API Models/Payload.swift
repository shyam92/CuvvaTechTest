//
//  Payload.swift
//  CuvvaCodeTest
//
//  Created by Shyam Bhudia on 01/09/2020.
//  Copyright © 2020 Shyam Bhudia. All rights reserved.
//

import Foundation

// MARK: - Payload
struct Payload: Codable {
    let userID: String?
    let userRevision: String?
    let policyID: String
    let originalPolicyID: String?
    let referenceCode: String?
    let startDate: String?
    let endDate: String?
    let incidentPhone: String?
    let vehicle: Vehicle?
    let documents: Documents?
    let pricing: Pricing?
    let newEndDate: String?

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
        case newEndDate = "new_end_date"
    }
}
