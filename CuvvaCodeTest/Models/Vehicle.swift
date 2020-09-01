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
class Vehicle: Object, Codable {
    @objc dynamic var vrm: String?
    @objc dynamic var prettyVrm: String?
    @objc dynamic var model: String?
    @objc dynamic var variant: String?
    @objc dynamic var colorString: String?
    @objc dynamic var makeString: String?
    
    var color: Color? {
        return Color(rawValue: colorString ?? "")
    }
    var make: Make? {
        return Make(rawValue: makeString ?? "")
    }
    
    enum CodingKeys: String, CodingKey {
        case vrm
        case prettyVrm
        case model
        case variant
        case colorString = "color"
        case makeString = "make"
    }

}

enum Color: String, Codable {
    case beige = "Beige"
    case blue = "Blue"
    case gold = "Gold"
    case silver = "Silver"
}

enum Make: String, Codable {
    case ford = "Ford"
    case mercedesBenz = "Mercedes-Benz"
    case mini = "MINI"
    case nissan = "Nissan"
    case volkswagen = "Volkswagen"
}
