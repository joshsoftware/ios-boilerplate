//
//  Constants.swift
//  basicsetup
//
//  Created by Amit on 23/01/19.
//  Copyright © 2019 Josh Software. All rights reserved.
//

import Foundation
import UIKit
struct Constants {
    // MARK: - API Configuration Constants
	static let baseUrl = "https://mojo-media-62a00-default-rtdb.firebaseio.com"
	static let appName = "App Name"
	struct URLEndPoints {
		static let mediaList = baseUrl + "/home.json?print=pretty"
	}
    struct APIConfigConstants {
        static let accept = "Accept"
        static let apiVersionV1 = "application/vnd.ffd.v1+json"
        static let apiVersionV2 = "application/vnd.ffd.v2+json"
        static let contentTypeKey = "Content-Type"
        static let appJson = "application/json"
    }

    // MARK: - Key-Value Constants

    struct KeyValues {
        static let authTokenKey = "Authorization"
    }

    // MARK: - Color Constants

    struct Colors {
        static let appThemeColor = UIColor(red: 72 / 255, green: 111 / 255, blue: 217 / 255, alpha: 1)
    }

    // MARK: - Fonts Constants

    struct Fonts {
		static let helveticaNueue = "HelveticaNeue"
    }

    // MARK: - Image Constants

    struct Images {
        static let homeCellPlainBgImage = "homeCellPlainBg"
    }

    // MARK: - Notification Identifier Constants

    struct Notifications {
        static let loginResponseNotification = "LoginResponseNotification"
    }
}

enum  ApiMethods: String {
	case GET
	case POST
	case PUT
	case DELETE
	case PATCH
}
