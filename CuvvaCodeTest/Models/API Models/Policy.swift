//
//  Policy.swift
//  CuvvaCodeTest
//
//  Created by Shyam Bhudia on 31/08/2020.
//  Copyright © 2020 Shyam Bhudia. All rights reserved.
//

import Foundation

// MARK: - Policy
struct Policy: Codable {
    var type: Type
    var timestamp: String
    var uniqueKey: String
    var payload: Payload
    
    enum CodingKeys: String, CodingKey {
        case type
        case timestamp
        case uniqueKey = "unique_key"
        case payload
    }
}



// MARK: - Pricing
struct Pricing: Codable {
    let underwriterPremium: Int
    let commission: Int
    let totalPremium: Int
    let ipt: Int
    let iptRate: Int
    let extraFees: Int
    let vat: Int
    let deductions: Int
    let totalPayable: Int

    enum CodingKeys: String, CodingKey {
        case underwriterPremium = "underwriter_premium"
        case commission
        case totalPremium = "total_premium"
        case ipt
        case iptRate = "ipt_rate"
        case extraFees = "extra_fees"
        case vat, deductions
        case totalPayable = "total_payable"
    }
}



// MARK: - Vehicle
struct Vehicle: Codable {
    var vrm: String
    var prettyVrm: String
    var make: Make
    var model: String
    var variant: String?
    var color: Color

}

enum Color: String, Codable {
    case beige = "Beige"
    case blue = "Blue"
    case gold = "Gold"
    case silver = "Silver"
}

enum Make: String, Codable {
    case ford = "Ford"
    case mercedesBenz = "Mercedes-Benz"
    case mini = "MINI"
    case nissan = "Nissan"
    case volkswagen = "Volkswagen"
}

enum Type: String, Codable {
    case policyCancelled = "policy_cancelled"
    case policyCreated = "policy_created"
    case policyFinancialTransaction = "policy_financial_transaction"
}
