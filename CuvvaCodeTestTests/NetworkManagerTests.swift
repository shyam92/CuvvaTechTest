//
//  NetworkManagerTests.swift
//  CuvvaCodeTestTests
//
//  Created by Shyam Bhudia on 01/09/2020.
//  Copyright © 2020 Shyam Bhudia. All rights reserved.
//

import XCTest
@testable import CuvvaCodeTest
class NetworkManagerTests: XCTestCase {

    func testValidURLPoliciesFeed() {
        let networkManager = NetworkManager()
        
        let policyExpectation = expectation(description: "data")
        var dataReturned: [APIEvent]?
        
        networkManager.policiesFeed { (result) in
            switch result {
            case .success(let policies):
                dataReturned = policies
            case .failure( _):
                dataReturned = nil
            }
            policyExpectation.fulfill()
            XCTAssertTrue(dataReturned?.count == 66, "Invalid Data returned")

        }
        waitForExpectations(timeout: 100, handler: nil)
    }
    
    /**
    This test will give a invalid url to see if it would fail with correct error handling with Invalid url
    */
    func testInvalidURLPoliciesFeed() {
        let mockURLBuilder = MockURLBuilder()
        let networkManager = NetworkManager(configuration: .default, urlBuilder: mockURLBuilder)
        let policyInvalidExpectation = expectation(description: "data")

        networkManager.policiesFeed { (result) in
            policyInvalidExpectation.fulfill()
            switch result {
            case.success(_):
                XCTFail("Valid Data came back where it should have invalid url")
                break
            case .failure(let error):
                XCTAssertTrue(error == .invalidUrl, "Invalid url was not the failure")
            }
        }
        waitForExpectations(timeout: 100, handler: nil)
    }
    
    /**
     This test will give a valid url but invalid data to see if it would fail with correct error handling
     */
    func testValidURLInvalidPoliciesFeed() {
        var mockURLBuilder = MockURLBuilder()
        mockURLBuilder.apiURL = "https://jsonplaceholder.typicode.com/todos/1"
        let networkManager = NetworkManager(configuration: .default, urlBuilder: mockURLBuilder)
        let policyInvalidExpectation = expectation(description: "data")

        networkManager.policiesFeed { (result) in
            policyInvalidExpectation.fulfill()
            switch result {
            case.success(_):
                XCTFail("Valid Data came back where it should have invalid data")
                break
            case .failure(let error):
                XCTAssertTrue(error == .invalidData, "Invalid data was not the failure")
            }
        }
        waitForExpectations(timeout: 100, handler: nil)
    }
    
    struct MockURLBuilder: URLBuilderProtocol {
        var apiURL: String = ""
        
        func url(for endpoint: Endpoints) -> URL? {
            switch endpoint {
            case .policies:
                return URL(string: apiURL)
            }
        }
    }


}
