//
//  ModelClass.swift
//  basicsetup
//
//  Created by Amit on 22/01/19.
//  Copyright © 2019 Josh Software. All rights reserved.
//

import Foundation

class dailyVital: Codable {

    let blood_pressure      : String?
    let blood_pressure_max  : String?
    //let breakfast_sugar     : String?
    
    
    enum keyTest: String, CodingKey {
        case bloodPressure = "blood_pressure"
        case bloodPressureMax = "blood_pressure_max"
    }
    
    
}

//class ModelClass: NSObject {
//    
//    static let sharedGlobal = ModelClass()
//    
//    var member : Test?
//    
//}
