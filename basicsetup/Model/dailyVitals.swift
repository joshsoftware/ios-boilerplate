//
//  ModelClass.swift
//  basicsetup
//
//  Created by Amit on 22/01/19.
//  Copyright © 2019 Josh Software. All rights reserved.
//

import Foundation

struct dailyVitals : Codable {

    var bloodPressure       : Int?
    
    //comment : You can use you coding case style even if key from json support other style
    //comment : E.g Here I am using camel case style even though server json is in snake case. That's use of "CodingKey" class
    private enum CodingKeys: String, CodingKey {
        case bloodPressure = "blood_pressure"
    }
    
}



