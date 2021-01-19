//
//  DailyVitalResponce.swift
//  basicsetup
//
//  Created by Amit on 09/04/19.
//  Copyright © 2019 Josh Software. All rights reserved.
//

import Foundation

struct DailyVitalResponse: Codable {
    var data: DailyVitalData?
    private enum CodingKeys: String, CodingKey {
        case data
    }
}
