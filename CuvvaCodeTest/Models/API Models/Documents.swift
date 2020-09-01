//
//  Documents.swift
//  CuvvaCodeTest
//
//  Created by Shyam Bhudia on 01/09/2020.
//  Copyright © 2020 Shyam Bhudia. All rights reserved.
//

import Foundation

// MARK: - Documents
struct Documents: Codable {
    let certificateURL: String
    let termsURL: String

    enum CodingKeys: String, CodingKey {
        case certificateURL = "certificate_url"
        case termsURL = "terms_url"
    }
}
