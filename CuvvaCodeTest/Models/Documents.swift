//
//  Documents.swift
//  CuvvaCodeTest
//
//  Created by Shyam Bhudia on 01/09/2020.
//  Copyright © 2020 Shyam Bhudia. All rights reserved.
//

import Foundation
import RealmSwift
// MARK: - Documents
class Documents: Object, Codable {
    @objc dynamic var certificateURL: String?
    @objc dynamic var termsURL: String?

    enum CodingKeys: String, CodingKey {
        case certificateURL = "certificate_url"
        case termsURL = "terms_url"
    }
}
