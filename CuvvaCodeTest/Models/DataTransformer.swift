//
//  DataTransformer.swift
//  CuvvaCodeTest
//
//  Created by Shyam Bhudia on 02/09/2020.
//  Copyright © 2020 Shyam Bhudia. All rights reserved.
//

import Foundation

protocol DataTransformerProtocol {
    func convertAPIDataToDatabase(with apiData: [APIEvent]?) -> [Vehicle]?
}

class DataTransformer: DataTransformerProtocol {
    
    func convertAPIDataToDatabase(with apiData: [APIEvent]?) -> [Vehicle]? {
        guard let data = apiData else { return nil }
        var vehicleData: [Vehicle] = [Vehicle]()
        data.forEach { (event) in
            switch event.type {
            case .policyCreated:
                guard let vehicle = createPolicy(with: event, and: vehicleData) else { return }
                // Update vehicle if already present
                if let item = vehicleData.firstIndex(where: {$0.vrm == vehicle.vrm }) {
                    vehicleData[item] = vehicle
                } else {
                    vehicleData.append(vehicle)
                }
            case .policyFinancialTransaction:
                updatePolicyFinancialTransaction(with: event, and: vehicleData)
                
                // Update vehicle if already present
                
            case .policyCancelled:
                updatePolicyCancellation(with: event, and: vehicleData)
            }
        }
        return vehicleData
    }
    
    /// Creates the policy and either updates existing vehicle or creates new one
    /// - Parameters:
    ///   - event: Event of type created with policy details
    ///   - allVehicles: All Vehicales with policies
    /// - Returns: Returns either updated vehicle or created vehicle
    private func createPolicy(with event: APIEvent, and allVehicles: [Vehicle]) -> Vehicle? {
        guard event.type == .policyCreated else { return nil }
        // Check if there is already a vehicle
        guard let vrm = event.payload.vehicle?.vrm else { return nil }
        
        if let vehicleFound = allVehicles.filter({ $0.vrm == vrm }).first, vehicleFound.policies.count > 0 {
                // Check original policy is different to policy to see if its a child/extension policy add it to original policy
                if let originalPolicy = vehicleFound.policies.filter({ $0.originalPolicyID == event.payload.originalPolicyID }).first {                    
                    let policy = event.mapToDatabase()
                    let documents = event.payload.documents?.mapToDatabase()
                    policy.documents = documents
                    originalPolicy.extensionPolicies.append(policy)
                } else {
                    // If original policy doesn't exist then add as a new policy to the vehicle
                    let policy = event.mapToDatabase()
                    let documents = event.payload.documents?.mapToDatabase()
                    policy.documents = documents
                    vehicleFound.policies.append(policy)
                    
                }
                
            
            return vehicleFound
        } else {
            // Create Vehicle with policy and documents
            
            guard let vehicle = event.payload.vehicle?.mapToDatabase() else { return nil }
            let policy = event.mapToDatabase()
            let documents = event.payload.documents?.mapToDatabase()
            policy.documents = documents
            vehicle.policies.append(policy)
            
            return vehicle
        }
        
        
    }
    
    /// Updates the policy with Pricing from the transaction information
    /// - Parameters:
    ///   - event: Event of type financial transaction with policy details
    ///   - allVehicles: All Vehicales with policies
    /// - Returns: Returns updated vehicle with policy and the financial transaction
    @discardableResult
    private func updatePolicyFinancialTransaction(with event: APIEvent, and allVehicles: [Vehicle]) -> Vehicle? {
        guard event.type == .policyFinancialTransaction else { return nil }
        // Check through all vehicles and see if there is a matching policy then add transaction to that policy. Can be multiple transactions
        var policyToFetch: Policy?
        var associatedVehicle: Vehicle?
        allVehicles.forEach({ vehicle in
            if let policy = vehicle.policies.filter({$0.policyID == event.payload.policyID}).first {
                associatedVehicle = vehicle
                policyToFetch = policy
            }
            // Check if policy is part of extension of parent policy
            vehicle.policies.forEach({ (policy) in
                if let policyFound = policy.extensionPolicies.filter({$0.policyID == event.payload.policyID}).first {
                    associatedVehicle = vehicle
                    policyToFetch = policyFound
                }
            })
        })
        guard let policy = policyToFetch, let vehicle = associatedVehicle else { return nil }
        let pricing = event.payload.pricing?.mapToDatabase()
        let transaction = Transaction(timestamp: event.timestamp, pricing: pricing, key: event.uniqueKey)
        policy.transaction.append(transaction)
        if let index = vehicle.policies.index(of: policy) {
            vehicle.policies.remove(at: index)
            vehicle.policies.append(policy)
        }
        return vehicle
        
    }
    
    
    /// Updates the policy based upon if the type in the payload is 'void'
    /// - Parameters:
    ///   - event: Event of type cancelation with policy details
    ///   - allVehicles: All Vehicales with policies
    /// - Returns: Returns updated vehicle with policy which is cancelled
    @discardableResult
    private func updatePolicyCancellation(with event: APIEvent, and allVehicles: [Vehicle]) -> Vehicle? {
        guard event.type == .policyCancelled else { return nil }
        var policyToFetch: Policy?
        var associatedVehicle: Vehicle?
        allVehicles.forEach { (vehicle) in
            if let policy = vehicle.policies.filter({$0.policyID == event.payload.policyID}).first {
                associatedVehicle = vehicle
                policyToFetch = policy
            }
            
            // Check if policy is part of extension of parent policy
            vehicle.policies.forEach({ (policy) in
                if let policyFound = policy.extensionPolicies.filter({$0.policyID == event.payload.policyID}).first {
                    associatedVehicle = vehicle
                    policyToFetch = policyFound
                }
            })
            
        }
        guard let policy = policyToFetch, let vehicle = associatedVehicle else { return nil }
        policy.isVoid = event.payload.type == "void"
        if let index = vehicle.policies.index(of: policy) {
            vehicle.policies.remove(at: index)
            vehicle.policies.append(policy)
        }
        return vehicle
    }
}
