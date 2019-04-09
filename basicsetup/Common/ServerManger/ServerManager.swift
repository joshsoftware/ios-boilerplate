//
//  ServerManager.swift
//  basicsetup
//
//  Created by Amit on 23/01/19.
//  Copyright © 2019 Josh Software. All rights reserved.
//

import Foundation
import Alamofire
import SKToast


class ServerManager: NSObject {
    
    static let sharedInstance = ServerManager()
    
    
    func GetDailyVitals(startDate: String,endDate: String,completionClouser:@escaping (_ isSuccessful: Bool,_ error: String?,_ result: Any?,_ statusCode: Int) -> Void){
        //5aff3333e4d64236b0a5274f
        if
            let tempURL = Configuration.sharedConfiguration.apiBaseURL{
            let userID = "5affa02de4d642335a33496c"
            let urlString = tempURL + "/users/\(userID)/daily_vitals?start_date=\(startDate)&end_date=\(endDate)"
            print(urlString)
            self.webServiceCallTypeGET(API: urlString,
                                       httpMethodType: Constants.KAPIConfigConstants.KHttpGET,
                                       APIVersionKey: Constants.KAPIConfigConstants.KApiVersionV1,
                                       APIVersionValue : "",
                                       contentTypeKey: Constants.KAPIConfigConstants.KContentTypeKey,
                                       contentTypeValue: Constants.KAPIConfigConstants.KAppJson,
                                       authTokenKey: Constants.KKeyValues.KAuthTokenKey,
                                       authTokenValue: "KHyI2eKPzOogHmReDK53tVPaFo5eGGP_",
                                       completionClouser: completionClouser)
            }
        
    }
    
    
    
    
    //MARK:- Server Connections Method
    
    func webServiceCallTypeGET(API :String,httpMethodType: String, APIVersionKey: String,APIVersionValue: String,contentTypeKey: String,contentTypeValue: String,authTokenKey: String,authTokenValue: String,completionClouser :@escaping (_ isSuccessful: Bool,_ error: String?,_ result: Any?,_ statusCode: Int) -> Void){
        if
            API != ""{
            print("API:-\(API)")
            print("httpMethodType:-\(httpMethodType)")
            print("APIVersion:-\(APIVersionKey)")
            print("APIVersionValue:-\(APIVersionValue)")
            print("contentTypeKey:-\(contentTypeKey)")
            print("contentTypeValue:-\(contentTypeValue)")
            print("authTokenKey:-\(authTokenKey)")
            
            
            if
                let url = URL(string: API){
                
                var request = URLRequest(url: url)
                request.httpMethod = httpMethodType
                request.timeoutInterval = 300
                request.setValue(contentTypeValue, forHTTPHeaderField: contentTypeKey)
                request.setValue(APIVersionValue, forHTTPHeaderField: APIVersionKey)
                request.setValue(authTokenValue, forHTTPHeaderField: authTokenKey)
                
                
                Alamofire.request(request)
                    .responseJSON { response in
                        if response.result.isSuccess{
                            
                            print("Sucess:-\(response.result.isSuccess)")
                            if
                                let statusCode = response.response?.statusCode{
                                if statusCode == 200{
                                    
                                    //let dictionary = try JSONSerialization.jsonObject(with: response.data!, options: JSONSerialization.ReadingOptions.mutableContainers)
                                    //print("Respose:-\(dictionary)")
                                    guard let responseData = response.data else{
                                        return
                                    }
                                    completionClouser(response.result.isSuccess,nil,responseData,statusCode)
                                  
                                }
                                else{
                                    print(response.result)
                                    SKToast.show(withMessage: "Connection failed")
                                    
                                }
                            }
                            
                        }
                        else{
                            
                            print("isSucess:-\(response.result.isSuccess)")
                            if
                                let statusCode = response.response?.statusCode{
                                if statusCode == 401{
                                    
                                    SKToast.show(withMessage: "Unauthrized")
                                    completionClouser(response.result.isSuccess,response.error as? String,response.result.value,statusCode)
                                    
                                }else if statusCode == 500{
                                    
                                    SKToast.show(withMessage: "Internal Server error")
                                    completionClouser(response.result.isSuccess,response.error as? String,response.result.value,statusCode)
                                    
                                }else if statusCode == 422{
                                    
                                    SKToast.show(withMessage: "Unprocessible Entity")
                                    completionClouser(response.result.isSuccess,response.error as? String,response.result.value,statusCode)
                                    
                                }
                                else{
                                    
                                    SKToast.show(withMessage: "Something went wrong")
                                    completionClouser(response.result.isSuccess,response.error as? String,response.result.value,statusCode)
                                    
                                }
                            }
                        }
                        
                        
                }
            }
        }
        else{
            
            SKToast.show(withMessage: "Empty URL")
        }
        
    }
    

}

