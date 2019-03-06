//
//  DataManager.swift
//  basicsetup
//
//  Created by Amit on 23/01/19.
//  Copyright © 2019 Josh Software. All rights reserved.
//

import Foundation

class DataManager: NSObject {
    
    static let sharedInstance = ServerManager()
    
    
    
    class func GetDailyVitals(startDate: String,endDate: String,completionClouser:@escaping (_ isSuccessful: Bool,_ error: String?,_ result: Any?,_ statusCode: Int) -> Void){
        
        ServerManager.sharedInstance.GetDailyVitals(startDate: startDate,endDate : endDate,completionClouser: { (isSuccessful, error, result, statusCode) in
            
            if isSuccessful
            {
                completionClouser(isSuccessful,nil,result,statusCode)
            }
            else
            {
                completionClouser(isSuccessful,error,nil,statusCode)
            }
        })
        
    }
    
    
    
}
