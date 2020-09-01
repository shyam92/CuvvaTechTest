//
//  URLBuilder.swift
//  CuvvaCodeTest
//
//  Created by Shyam Bhudia on 31/08/2020.
//  Copyright © 2020 Shyam Bhudia. All rights reserved.
//

import Foundation

/**
 Protocol to create URL and use it in the API Protocol
 */
protocol URLBuilderProtocol {
    var apiURL: String { get set }
    func url(for endpoint: Endpoints) -> URL?
}

/**
 List of Endpoints
 */
enum Endpoints: String {
    case policies
}

/**
 URLBuilder conforming to URLBuilderProtocol with Production data
 */
class URLBuilder: URLBuilderProtocol {
    
    var apiURL = "https://cuvva.herokuapp.com"
    
    func url(for endpoint: Endpoints) -> URL? {
        switch endpoint {
        case .policies:
            return URL(string: apiURL)
        }
    }
}
