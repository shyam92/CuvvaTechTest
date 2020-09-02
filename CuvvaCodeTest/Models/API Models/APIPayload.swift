//
//  APIPayload.swift
//  CuvvaCodeTest
//
//  Created by Shyam Bhudia on 02/09/2020.
//  Copyright © 2020 Shyam Bhudia. All rights reserved.
//

import Foundation
struct APIPayload: Codable {
    let userID: String?
    let userRevision: String?
    let policyID: String
    let originalPolicyID: String?
    let referenceCode: String?
    let startDate: Date?
    let endDate: Date?
    let incidentPhone: String?
    let vehicle: APIVehicle?
    let documents: APIDocuments?
    let pricing: APIPricing?
    let newEndDate: Date?
    let type: String?

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
        case type
    }
}


