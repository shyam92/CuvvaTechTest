//
//  APITests.swift
//  CuvvaCodeTestTests
//
//  Created by Shyam Bhudia on 01/09/2020.
//  Copyright © 2020 Shyam Bhudia. All rights reserved.
//

import XCTest
@testable import CuvvaCodeTest

class APITests: XCTestCase {
    
    
    //MARK: Fetch testing
    
    /**
     Test downloading of data and testing if it decodes correctly
     */
    func testValidDecodingTask() {
        let request = URLRequest(url: URL(string: "https://cuvva.herokuapp.com/")!)
        let networkManger = MockNetworkManager()
        let decodingExpectation = expectation(description: "decoding")
        
        let task = networkManger.decodingTask(with: request, decodingType: [Policy].self) { (json, error) in
            decodingExpectation.fulfill()
            guard let json = json else {
                XCTFail("No data was parsed")
                return
            }
            if let values = json as? [Policy] {
                XCTAssertEqual(values.count, 66)
                
            }
            
        }
        task.resume()
        waitForExpectations(timeout: 100, handler: nil)
    }

    /**
     Test:
     - Requesting a valid url
     - invalid httpResponse

     Error should be .requestFailed
     */
    func testInvalidHttpResponse() {
        let request = URLRequest(url: URL(string: "www.google.com")!)
        let networkManger = MockNetworkManager()
        let decodingExpectation = expectation(description: "invalid decoding")

        let task = networkManger.decodingTask(with: request, decodingType: [Policy].self) { (json, error) in
            decodingExpectation.fulfill()
            guard let error = error else {
                XCTFail("JSON data was parsed")
                return
            }
            XCTAssertTrue(error == .requestFailed, "Error was not equal to request failed")
        }
        task.resume()
        waitForExpectations(timeout: 100, handler: nil)
    }

    /**
     Test Requesting a valid url with valid httpResponse with data that does not parse Policy Type
     */
    func testInvalidDataResponse() {
        let request = URLRequest(url: URL(string: "https://jsonplaceholder.typicode.com/todos/1")!)
        let networkManger = MockNetworkManager()
        let decodingExpectation = expectation(description: "InvalidData")

        let task = networkManger.decodingTask(with: request, decodingType: Policy.self) { (json, error) in
            decodingExpectation.fulfill()
            if let policy = json as? Policy {
                XCTAssertNil(policy.uniqueKey)
            }
            
        }
        task.resume()
        waitForExpectations(timeout: 100, handler: nil)
    }

    /**
     Test Requesting a valid url with httpResponse == 404
     */
    func testNotFoundDataResponse() {
        let request = URLRequest(url: URL(string: "https://raw.githubusercontent.com/shyam92/demo/master/empty1.json")!)
        let networkManger = MockNetworkManager()
        let decodingExpectation = expectation(description: "NotFound")

        let task = networkManger.decodingTask(with: request, decodingType: Policy.self) { (json, error) in
            decodingExpectation.fulfill()
            guard let error = error else {
                XCTFail("JSON data was parsed")
                return
            }
            XCTAssertTrue(error == .requestFailed, "Error was not equal to request failed")
        }
        task.resume()
        waitForExpectations(timeout: 100, handler: nil)
    }

    /**
     Test Requesting a valid url with httpResponse == 200
     - data is empty
     */
    func testEmptyDataResponse() {
        let request = URLRequest(url: URL(string: "https://raw.githubusercontent.com/shyam92/demo/master/invalidJson.json")!)
        let networkManger = MockNetworkManager()
        let decodingExpectation = expectation(description: "EmptyData")

        let task = networkManger.decodingTask(with: request, decodingType: Policy.self) { (json, error) in
            decodingExpectation.fulfill()
            guard let error = error else {
                XCTFail("JSON data was parsed")
                return
            }
            XCTAssertTrue(error == .invalidData, "Error was not equal to request failed")
        }
        task.resume()
        waitForExpectations(timeout: 100, handler: nil)
    }
    
    //MARK: Array Testing
    /**
     Test array decoding with valid data
     */
    func testValidArrayDecodingTask() {
        let request = URLRequest(url: URL(string: "https://cuvva.herokuapp.com/")!)
        let networkManger = MockNetworkManager()
        let decodingExpectation = expectation(description: "decoding")
        
        let task = networkManger.arrayDecodingTask(with: request, decodingType: Policy.self) { (json, error) in
            decodingExpectation.fulfill()
            guard let json = json else {
                XCTFail("No data was parsed")
                return
            }
            if let values = json as? [Policy] {
                XCTAssertEqual(values.count, 66)
                
            }
            
        }
        task.resume()
        waitForExpectations(timeout: 100, handler: nil)
    }
    
    /**
     Test:
     - Requesting a valid url
     - invalid httpResponse

     Error should be .requestFailed
     */
    func testInvalidHttpResponseForArray() {
        let request = URLRequest(url: URL(string: "www.google.com")!)
        let networkManger = MockNetworkManager()
        let decodingExpectation = expectation(description: "invalid decoding")

        let task = networkManger.arrayDecodingTask(with: request, decodingType: Policy.self) { (json, error) in
            decodingExpectation.fulfill()
            guard let error = error else {
                XCTFail("JSON data was parsed")
                return
            }
            XCTAssertTrue(error == .requestFailed, "Error was not equal to request failed")
        }
        task.resume()
        waitForExpectations(timeout: 100, handler: nil)
    }

    /**
     Test Requesting a valid url with valid httpResponse with data that does not parse Policy Type
     */
    func testInvalidDataResponseForArray() {
        let request = URLRequest(url: URL(string: "https://jsonplaceholder.typicode.com/todos/1")!)
        let networkManger = MockNetworkManager()
        let decodingExpectation = expectation(description: "InvalidData")

        let task = networkManger.arrayDecodingTask(with: request, decodingType: Policy.self) { (json, error) in
            decodingExpectation.fulfill()
            guard let error = error else {
                XCTFail("JSON data was parsed")
                return
            }
            XCTAssertTrue(error == .invalidData, "Error was not equal to invalid Data")
        }
        task.resume()
        waitForExpectations(timeout: 100, handler: nil)
    }

    /**
     Test Requesting a valid url with httpResponse == 404
     */
    func testNotFoundDataResponseForArray() {
        let request = URLRequest(url: URL(string: "https://raw.githubusercontent.com/shyam92/demo/master/empty1.json")!)
        let networkManger = MockNetworkManager()
        let decodingExpectation = expectation(description: "NotFound")

        let task = networkManger.arrayDecodingTask(with: request, decodingType: Policy.self) { (json, error) in
            decodingExpectation.fulfill()
            guard let error = error else {
                XCTFail("JSON data was parsed")
                return
            }
            XCTAssertTrue(error == .requestFailed, "Error was not equal to request failed")
        }
        task.resume()
        waitForExpectations(timeout: 100, handler: nil)
    }

    /**
     Test Requesting a valid url with httpResponse == 200
     - data is empty
     */
    func testEmptyDataResponseForArray() {
        let request = URLRequest(url: URL(string: "https://raw.githubusercontent.com/shyam92/demo/master/invalidJson.json")!)
        let networkManger = MockNetworkManager()
        let decodingExpectation = expectation(description: "EmptyData")

        let task = networkManger.arrayDecodingTask(with: request, decodingType: Policy.self) { (json, error) in
            decodingExpectation.fulfill()
            guard let error = error else {
                XCTFail("JSON data was parsed")
                return
            }
            XCTAssertTrue(error == .invalidData, "Error was not equal to request failed")
        }
        task.resume()
        waitForExpectations(timeout: 100, handler: nil)
    }
}
/**
 Mock Network Manager to use custom URLBuilder and different urlsession to the app
 */
class MockNetworkManager: NetworkProtocol {
    
    var session: URLSession
    
    var urlBuilder: URLBuilderProtocol
    convenience init() {
        self.init(configuration: .default, urlBuilder: URLBuilder())
    }
    
    init(configuration: URLSessionConfiguration, urlBuilder: URLBuilderProtocol) {
        self.session = URLSession(configuration: configuration)
        self.urlBuilder = urlBuilder
    }
    func policiesFeed(completion: PoliciesDataCompletion?) {
        guard let url = urlBuilder.url(for: .policies) else {
            completion?(Result.failure(.invalidUrl))
            return
        }
        fetchArray(with: url, decode: { data in
            guard let policies = data as? [Policy] else {
                return nil
            }
            return policies
        }, completion: completion)
        
    }
    
}
