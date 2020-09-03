//
//  DataTransformerTests.swift
//  CuvvaCodeTestTests
//
//  Created by Shyam Bhudia on 02/09/2020.
//  Copyright © 2020 Shyam Bhudia. All rights reserved.
//

import XCTest
@testable import CuvvaCodeTest
import RealmSwift

class DataTransformerTests: XCTestCase {
    var transformer: DataTransformer!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        transformer = DataTransformer()
    }
    
    func testCreatePolicy() {
        let jsonData = Data(singlePolicyCreatedJson.utf8)
        do {
            let jsonDecoder = JSONDecoder()
            jsonDecoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)
            let createdEvent = try jsonDecoder.decode([APIEvent].self, from: jsonData)
            
            
            let transformedData = transformer.convertAPIDataToDatabase(with: createdEvent)
            XCTAssertNotNil(transformedData)
            XCTAssertTrue(transformedData?.count == 1)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
    
    func testCreatePolicyAndUpdateWithTransaction() {
        let jsonData = Data(policyCreatedWithTransaction.utf8)
        do {
            let jsonDecoder = JSONDecoder()
            jsonDecoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)
            let createdEvents = try jsonDecoder.decode([APIEvent].self, from: jsonData)
            
            let transformedData = transformer.convertAPIDataToDatabase(with: createdEvents)
            XCTAssertNotNil(transformedData)
            
            XCTAssertEqual(transformedData?.first?.policies.first?.transaction.count, 1)
            XCTAssertEqual(transformedData?.first?.policies.first?.transaction.first?.pricing?.totalPayable.value, 870)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
    
    func testCreatePolicyOnExtension() {
        let jsonData = Data(policyExtension.utf8)
        do {
            let jsonDecoder = JSONDecoder()
            jsonDecoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)
            let createdEvents = try jsonDecoder.decode([APIEvent].self, from: jsonData)
            
            let transformedData = transformer.convertAPIDataToDatabase(with: createdEvents)
            XCTAssertNotNil(transformedData)
            
            XCTAssertEqual(transformedData?.first?.policies.first?.extensionPolicies.count, 1)
            let extensionPolicy = transformedData?.first?.policies.first?.extensionPolicies.first
            let originalPolicy = transformedData?.first?.policies.first
            XCTAssertEqual(extensionPolicy?.policyID, "dev_pol_000000BbUNFyNHZ8SKxW5z4ZSnIDw")
            XCTAssertEqual(extensionPolicy?.originalPolicyID, originalPolicy?.policyID)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
    
    func testPolicyExtensionUpdateFinancial() {
        let jsonData = Data(policyExtensionWithTransaction.utf8)
        do {
            let jsonDecoder = JSONDecoder()
            jsonDecoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)
            let createdEvents = try jsonDecoder.decode([APIEvent].self, from: jsonData)
            
            let transformedData = transformer.convertAPIDataToDatabase(with: createdEvents)
            XCTAssertNotNil(transformedData)
            
            XCTAssertEqual(transformedData?.first?.policies.first?.extensionPolicies.count, 1)
            let extensionPolicy = transformedData?.first?.policies.first?.extensionPolicies.first
            let originalPolicy = transformedData?.first?.policies.first
            XCTAssertEqual(extensionPolicy?.policyID, "dev_pol_000000BbUNFyNHZ8SKxW5z4ZSnIDw")
            XCTAssertEqual(extensionPolicy?.originalPolicyID, originalPolicy?.policyID)
            XCTAssertEqual(extensionPolicy?.transaction.count, 1)
            XCTAssertEqual(extensionPolicy?.transaction.first?.pricing?.totalPayable.value, 358)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
    
    /**
     Testing if cancelled policy will map to database objects
     - Add a policy with type created
     - Update policy by adding transaction
     - Set Policy to cancelled
     */
    func testCancelledPolicy() {
        let jsonData = Data(cancelledPolicy.utf8)
        do {
            let jsonDecoder = JSONDecoder()
            jsonDecoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)
            let createdEvents = try jsonDecoder.decode([APIEvent].self, from: jsonData)
            
            let transformedData = transformer.convertAPIDataToDatabase(with: createdEvents)
            XCTAssertNotNil(transformedData)
            
            XCTAssertEqual(transformedData?.first?.policies.first?.transaction.count, 1)
            XCTAssertEqual(transformedData?.first?.policies.first?.isVoid, true)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
    
    func testCreateMultiplePolicy() {
        let jsonData = Data(multiplePolicyCreation.utf8)
        do {
            let jsonDecoder = JSONDecoder()
            jsonDecoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)
            let createdEvent = try jsonDecoder.decode([APIEvent].self, from: jsonData)
            
            
            let transformedData = transformer.convertAPIDataToDatabase(with: createdEvent)
            XCTAssertNotNil(transformedData)
            // Vehicle will be one
            XCTAssertTrue(transformedData?.count == 1)
            XCTAssertEqual(transformedData?.first?.policies.count, 2)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
    
    func testCancelOnExtension() {
        let jsonData = Data(cancelledExtensionPolicy.utf8)
        do {
            let jsonDecoder = JSONDecoder()
            jsonDecoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)
            let createdEvents = try jsonDecoder.decode([APIEvent].self, from: jsonData)
            
            let transformedData = transformer.convertAPIDataToDatabase(with: createdEvents)
            XCTAssertNotNil(transformedData)
            
            XCTAssertEqual(transformedData?.first?.policies.first?.transaction.count, 1)
            XCTAssertEqual(transformedData?.first?.policies.first?.extensionPolicies.first?.isVoid, true)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
}
