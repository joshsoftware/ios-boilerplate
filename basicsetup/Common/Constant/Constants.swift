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
    
    //MARK:- API Configuration Constants
    struct KAPIConfigConstants {
        
        static let KAccept              = "Accept"
        static let KApiVersionV1        = "application/vnd.ffd.v1+json"
        static let KApiVersionV2        = "application/vnd.ffd.v2+json"
        
        static let KHttpGET             = "GET"
        static let KHttpPOST            = "POST"
        static let KHttpPUT             = "PUT"
        static let KHttpDELETE          = "DELETE"
        static let KHttpPATCH           = "PATCH"
        
        static let KContentTypeKey      = "Content-Type"
        static let KAppJson             = "application/json"
        
        
    }
    
    //MARK:- Key-Value Constants
    struct KKeyValues {
        
        static let KAuthTokenKey        = "Authorization"
        
        
    }
    
    //MARK:- Color Constants
    struct kColor {
        
        static let KAppThemeColor = UIColor(red: 72/255, green: 111/255, blue: 217/255, alpha: 1)
    }
    
    //MARK:- Fonts Constants
    struct KFonts{
        
        static let KFontHelveticaNueue = "HelveticaNeue"
    }
    
    //MARK:- Image Constants
    struct KImage {
        
        static let HomeCellPlainBgImage = "homeCellPlainBg"
    }
    
    //MARK:- Notification Identifier Constants
    struct KNotification{
        
        static let KLoginResponseNotification = "LoginResponseNotification"
    }
    
}
