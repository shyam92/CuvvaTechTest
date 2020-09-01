//
//  URLBuilderTests.swift
//  CuvvaCodeTestTests
//
//  Created by Shyam Bhudia on 01/09/2020.
//  Copyright © 2020 Shyam Bhudia. All rights reserved.
//

import XCTest
@testable import CuvvaCodeTest
class URLBuilderTests: XCTestCase {

    func testValidPolicyURL() {
        let urlBuilder = URLBuilder()
        guard let endpoint = urlBuilder.url(for: .policies) else {
            XCTFail("Properties Endpoint is nil")
            return
        }
        let expectedURL = "https://cuvva.herokuapp.com"
        XCTAssertTrue(endpoint.absoluteString == expectedURL, "Expected url is not same cuvva endpoint")
    }
}
