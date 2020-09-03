//
//  PolicyViewModel.swift
//  CuvvaCodeTest
//
//  Created by Shyam Bhudia on 03/09/2020.
//  Copyright © 2020 Shyam Bhudia. All rights reserved.
//

import Foundation

class PolicyViewModel {
    
    var vehicle: Vehicle
    var policies = [[Policy]]()
    var hasActivePolicy: Bool = false
    
    init(with vehicle: Vehicle) {
        self.vehicle = vehicle
        setupPolicies()
    }
    
    func setupPolicies() {
        if let activePolicy = getActivePolicy(from: vehicle) {
            let remainingPolicies = Array(vehicle.policies.filter({ $0 != activePolicy }))
            policies = [[activePolicy], remainingPolicies]
            hasActivePolicy = true
        } else {
            var allExtensionPolicies = [Policy]()
            vehicle.policies.forEach { (policy) in
                allExtensionPolicies.append(policy)
                policy.extensionPolicies.forEach({allExtensionPolicies.append($0)})
            }
            policies = [allExtensionPolicies]
        }
        // TODO: Order policies by date
    }
    
    
    private func getActivePolicy(from vehicle: Vehicle) -> Policy? {
           var activePolicy: Policy?
           activePolicy = vehicle.policies.filter({$0.isActive}).first
           if activePolicy == nil {
               vehicle.policies.forEach({ activePolicy = $0.extensionPolicies.filter({$0.isActive}).first })
           }
           return activePolicy
       }
    
}
