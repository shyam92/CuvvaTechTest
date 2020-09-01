//
//  Pricing.swift
//  CuvvaCodeTest
//
//  Created by Shyam Bhudia on 01/09/2020.
//  Copyright © 2020 Shyam Bhudia. All rights reserved.
//

import Foundation
import RealmSwift

// MARK: - Pricing
class Pricing: Object, Codable {
    let underwriterPremium = RealmOptional<Int>()
    let commission = RealmOptional<Int>()
    let totalPremium = RealmOptional<Int>()
    let ipt = RealmOptional<Int>()
    let iptRate = RealmOptional<Int>()
    let extraFees = RealmOptional<Int>()
    let vat = RealmOptional<Int>()
    let deductions = RealmOptional<Int>()
    let totalPayable = RealmOptional<Int>()

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
