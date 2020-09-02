//
//  DatabaseManagerTests.swift
//  CuvvaCodeTestTests
//
//  Created by Shyam Bhudia on 01/09/2020.
//  Copyright © 2020 Shyam Bhudia. All rights reserved.
//

import XCTest
@testable import CuvvaCodeTest
import RealmSwift
class DatabaseManagerTests: XCTestCase {
    
    var realm: Realm?
    var databaseManager: DatabaseManager?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        let config = Realm.Configuration(inMemoryIdentifier: "database-tests")
        realm = try Realm(configuration: config)
        
        databaseManager = DatabaseManager(realm: realm)
    }
    
    override func tearDownWithError() throws {
        try realm?.write {
            realm?.deleteAll()
        }
        try super.tearDownWithError()
    }
    
    func testAddObjects() {
        
        XCTAssert(databaseManager?.defaultRealm?.objects(Policy.self).count == 0)
        let policy = Policy()
        policy.type = EventType.policyCreated
        policy.uniqueKey = "test"
        
        
        databaseManager?.addObjects(with: [policy])
        
        XCTAssert(databaseManager?.defaultRealm?.objects(Policy.self).count == 1)
    }
    
    func testAddAndFetchObjects() {
        
        XCTAssert(databaseManager?.defaultRealm?.objects(Policy.self).count == 0)
        let policy = Policy()
        policy.type = EventType.policyCreated
        policy.uniqueKey = "test"
        
        
        databaseManager?.addObjects(with: [policy])
        
        XCTAssert(databaseManager?.defaultRealm?.objects(Policy.self).count == 1)
        
        let objects = databaseManager?.fetchObjects(for: Policy.self)
        XCTAssertTrue(objects?.count == 1)
    }
    
    func testFetchEmptyObjects() {
        
        XCTAssert(databaseManager?.defaultRealm?.objects(Policy.self).count == 0)
        let objects = databaseManager?.fetchObjects(for: Policy.self)
        XCTAssertTrue(objects == [])
    }
  
}
