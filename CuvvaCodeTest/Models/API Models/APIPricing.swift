//
//  Pricing.swift
//  CuvvaCodeTest
//
//  Created by Shyam Bhudia on 02/09/2020.
//  Copyright © 2020 Shyam Bhudia. All rights reserved.
//

import Foundation

struct APIPricing: Codable {
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

extension APIPricing {
    func mapToDatabase() -> Pricing {
        let pricing = Pricing(underwriterPremium: underwriterPremium,
                              commission: commission,
                              totalPremium: totalPremium,
                              ipt: ipt,
                              iptRate: iptRate,
                              extraFees: extraFees,
                              vat: vat,
                              deductions: deductions,
                              totalPayable: totalPayable)
        return pricing
    }
}
