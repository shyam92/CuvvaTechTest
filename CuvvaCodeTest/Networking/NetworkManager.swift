//
//  NetworkManager.swift
//  CuvvaCodeTest
//
//  Created by Shyam Bhudia on 31/08/2020.
//  Copyright © 2020 Shyam Bhudia. All rights reserved.
//

import Foundation

/**
 Protocol of the Network Manager so that ViewModels can use anything that conforms to it
 */
protocol NetworkProtocol: APIProtocol {
    typealias PoliciesDataCompletion = (Result<[Policy], APIError>) -> Void
    func policiesFeed(completion: PoliciesDataCompletion?)
}

/**
 Network Manager that gets data from the REST API, parses it and returns models based on data
 */
class NetworkManager: NetworkProtocol {
    
    let session: URLSession
    let urlBuilder: URLBuilderProtocol
    typealias PoliciesDataCompletion = (Result<[Policy], APIError>) -> Void
    
    convenience init() {
        self.init(configuration: .default, urlBuilder: URLBuilder())
    }
    
    init(configuration: URLSessionConfiguration, urlBuilder: URLBuilderProtocol) {
        self.session = URLSession(configuration: configuration)
        self.urlBuilder = urlBuilder
    }
    
    /**
     Fetches data from the REST API and returns completion with data
     - parameter completion: Returns Result with data or error
     */
    func policiesFeed(completion: PoliciesDataCompletion?) {
        let policiesUrl = urlBuilder.url(for: .policies)
        guard let url = policiesUrl else {
            completion?(Result.failure(.invalidUrl))
            return
        }
        
        fetchArray(with: url, decode: { (decodable) -> [Policy]? in
            return decodable as? [Policy]
        }, completion: completion)
    }
}
