//
//  APIDocument.swift
//  CuvvaCodeTest
//
//  Created by Shyam Bhudia on 02/09/2020.
//  Copyright © 2020 Shyam Bhudia. All rights reserved.
//

import Foundation

struct APIDocuments: Codable {
    let certificateURL: String
    let termsURL: String

    enum CodingKeys: String, CodingKey {
        case certificateURL = "certificate_url"
        case termsURL = "terms_url"
    }
}

// Convert API Model to DB
extension APIDocuments {
    func mapToDatabase() -> Documents {
        let document = Documents(certificateURL: self.certificateURL, termsURL: self.termsURL)
        return document
    }
}
