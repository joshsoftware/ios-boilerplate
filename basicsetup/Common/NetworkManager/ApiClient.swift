//
//  ApiClient.swift
//  basicsetup
//
//  Created by Pratik on 19/01/21.
//  Copyright © 2019 Josh Software. All rights reserved.
//

import Foundation
class ApiClient {
	//MARK: get list of details for new home screen
	class func getHomeScreenMediaList(completion: @escaping (Result<DailyVitalResponse,GenericError>) -> Void) {
		//TODO: Refactor url logic to get it from enum endpoints
		let url = Constants.URLEndPoints.mediaList
		Service.shared.request(url: url, method: .GET) { (result) in
			return completion(result)
		}
	}
	
	//MARK: get media details
	class func getMediaDetails(endpoint: String, completion: @escaping (Result<DailyVitalResponse,GenericError>) -> Void) {
		//TODO: Refactor url logic to get it from enum endpoints
		let url = Constants.baseUrl + endpoint
		Service.shared.request(url: url, method: .GET, parameters: nil) { (result) in
			return completion(result)
		}
	}
}

