//
//  APIVehicle.swift
//  CuvvaCodeTest
//
//  Created by Shyam Bhudia on 02/09/2020.
//  Copyright © 2020 Shyam Bhudia. All rights reserved.
//

import Foundation


struct APIVehicle: Codable {
    var vrm: String
    var prettyVrm: String
    var make: Make
    var model: String
    var variant: String?
    var color: Color
    
    enum CodingKeys: String, CodingKey {
        case vrm
        case prettyVrm
        case model
        case variant
        case color
        case make
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

extension APIVehicle {
    func mapToDatabase() -> Vehicle {
        let vehicle = Vehicle(vrm: vrm,
                              prettyVrm: prettyVrm,
                              model: model,
                              variant: variant,
                              colorString: color.rawValue,
                              makeString: make.rawValue)
        return vehicle
    }
}
