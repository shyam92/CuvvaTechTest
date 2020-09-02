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
class Pricing: Object {
    var underwriterPremium = RealmOptional<Int>()
    var commission = RealmOptional<Int>()
    var totalPremium = RealmOptional<Int>()
    var ipt = RealmOptional<Int>()
    var iptRate = RealmOptional<Int>()
    var extraFees = RealmOptional<Int>()
    var vat = RealmOptional<Int>()
    var deductions = RealmOptional<Int>()
    var totalPayable = RealmOptional<Int>()

    let transaction = LinkingObjects(fromType: Transaction.self, property: Transaction.TransactionItemKeys.pricing.rawValue)
    
    enum PricingItemKeys: String {
        case underwriterPremium
        case commission
        case totalPremium
        case ipt
        case iptRate
        case extraFees
        case vat
        case deductions
        case totalPayable
    }
    
    convenience init(underwriterPremium: Int,
                     commission: Int,
                     totalPremium: Int,
                     ipt: Int,
                     iptRate: Int,
                     extraFees: Int,
                     vat: Int,
                     deductions: Int,
                     totalPayable: Int) {
        self.init()
        self.underwriterPremium.value = underwriterPremium
        self.commission.value = commission
        self.totalPremium.value = totalPremium
        self.ipt.value = ipt
        self.iptRate.value = iptRate
        self.extraFees.value = extraFees
        self.vat.value = vat
        self.deductions.value = deductions
        self.totalPayable.value = totalPayable
    }
}
