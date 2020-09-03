//
//  HomeViewModel.swift
//  CuvvaCodeTest
//
//  Created by Shyam Bhudia on 01/09/2020.
//  Copyright © 2020 Shyam Bhudia. All rights reserved.
//

import Foundation

protocol HomeViewDelegate {
    func didReceiveData(from apiSource: ViewModelSource)
    func didReceiveError(from apiSource: ViewModelSource, error: Error)
}

class HomeViewModel {
    
    // Local dependancies
    private let networkManager: NetworkProtocol
    private let databaseManager: DatabaseProtocol
    private let dataTransformer: DataTransformerProtocol
    private let delegate: HomeViewDelegate
    
    typealias DataCompletion = (Result<[[Vehicle]], APIError>, ViewModelSource) -> Void
    
    var dataSource = [[Vehicle]]()
    
    // Constructer
    init(networkManager: NetworkProtocol = NetworkManager(),
         databaseManager: DatabaseProtocol = DatabaseManager(),
         dataTransformer: DataTransformerProtocol = DataTransformer(),
         delegate: HomeViewDelegate) {
        self.networkManager = networkManager
        self.databaseManager = databaseManager
        self.dataTransformer = dataTransformer
        self.delegate = delegate
        fetchData(from: [.api, .database]) {[weak self] (result, source) in
            switch result {
            case .success(let vehicles):
                self?.dataSource = vehicles
                delegate.didReceiveData(from: source)
            case .failure(let error):
                delegate.didReceiveError(from: source, error: error)
            }
        }
    }
 
    func fetchData(from sources: [ViewModelSource] = [.api, .database], completion: DataCompletion? = nil) {
        if sources.contains(.database) {
            fetchDataFromDatabase(completion: completion)
        }
        if sources.contains(.api) {
            fetchDataFromAPI(completion: completion)
        }
        
    }
    
    func fetchDataFromDatabase(completion: DataCompletion? = nil) {
        guard  let data = databaseManager.fetchObjects(for: Vehicle.self) as? [Vehicle] else {
            completion?(Result.failure(APIError.invalidData), .database)
            return
        }
        let sortedData = sortDataToActivePoliciesFirst(data: data)
        completion?(Result.success(sortedData), .database)
      }
      
    
    func fetchDataFromAPI(completion: DataCompletion? = nil) {
        networkManager.policiesFeed {[weak self] (result) in
            guard let weakSelf = self else { return }
            switch result {
            case .success(let policies):
                guard let data = weakSelf.dataTransformer.convertAPIDataToDatabase(with: policies) else {
                    completion?(Result.failure(APIError.invalidData), .api)
                    return
                }
                weakSelf.saveAPIDataToDatabase(data: data)
                let sortedData = weakSelf.sortDataToActivePoliciesFirst(data: data)
                completion?(Result.success(sortedData), .api)
            case .failure(let error):
                completion?(Result.failure(error), .api)
            }
        }
    }
    
    
    func sortDataToActivePoliciesFirst(data: [Vehicle]) -> [[Vehicle]] {
        var activePolicies = [Policy]()
        var activePoliciesOnVehicles = [Vehicle]()
        data.forEach({ vehicle in
            let policies = vehicle.policies.filter({$0.isActive})
            
            activePolicies.append(contentsOf: policies)
            vehicle.policies.forEach({
                let extendedPolicies = $0.extensionPolicies.filter({$0.isActive})
                if extendedPolicies.count > 0 {
                    activePolicies.append(contentsOf: extendedPolicies)
                    activePoliciesOnVehicles.append(vehicle)
                }
            })
        })
        
        
        let remainingVehicles = data.filter({ !activePoliciesOnVehicles.contains($0) })
        
        return [activePoliciesOnVehicles, remainingVehicles]
    }
    
     
     func saveAPIDataToDatabase(data: [Vehicle]) {
         databaseManager.addObjects(with: data)
     }
}

enum ViewModelSource {
    /// A database
    case database
    
    /// The API
    case api
}

