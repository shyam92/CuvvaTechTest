//
//  Vehicle.swift
//  CuvvaCodeTest
//
//  Created by Shyam Bhudia on 01/09/2020.
//  Copyright © 2020 Shyam Bhudia. All rights reserved.
//

import Foundation
import RealmSwift
// MARK: - Vehicle
class Vehicle: Object {
    @objc dynamic var vrm: String?
    @objc dynamic var prettyVrm: String?
    @objc dynamic var model: String?
    @objc dynamic var variant: String?
    @objc dynamic var colorString: String?
    @objc dynamic var makeString: String?
    
    let policies = List<Policy>()
    
    
    var color: Color? {
        return Color(rawValue: colorString ?? "")
    }
    var make: Make? {
        return Make(rawValue: makeString ?? "")
    }
    
    override class func primaryKey() -> String? {
        return VehiclePropertyKeys.vrm.rawValue
    }
    
    convenience init(vrm: String?,
                     prettyVrm: String?,
                     model: String?,
                     variant: String?,
                     colorString: String?,
                     makeString: String?) {
        self.init()
        self.vrm = vrm
        self.prettyVrm = prettyVrm
        self.model = model
        self.variant = variant
        self.colorString = colorString
        self.makeString = makeString
        
    }
    

    // Keys for Realm linking and filtering
    enum VehiclePropertyKeys: String {
        case vrm
        case prettyVrm
        case model
        case variant
        case colorString
        case makeString
        case policies
    }
}

