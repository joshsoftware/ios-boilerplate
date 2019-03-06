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
        
        let urlString = ""
        print(urlString)
        self.webServiceCallTypeGET(API: urlString,
                                   httpMethodType: Constants.KAPIConfigConstants.KHttpGET,
                                   APIVersion: Constants.KAPIConfigConstants.KApiVersionV1,
                                   contentTypeKey: Constants.KAPIConfigConstants.KContentTypeKey,
                                   contentTypeValue: Constants.KAPIConfigConstants.KAppJson,
                                   authTokenKey: Constants.KKeyValues.KAuthTokenKey,
                                   authTokenValue: "",
                                   completionClouser: completionClouser)
    }
    
    
    
    
    //MARK:- Server Connections Method
    
    func webServiceCallTypeGET(API :String,httpMethodType: String, APIVersion: String,contentTypeKey: String,contentTypeValue: String,authTokenKey: String,authTokenValue: String,completionClouser :@escaping (_ isSuccessful: Bool,_ error: String?,_ result: Any?,_ statusCode: Int) -> Void){
        if
            API != ""{
            print("API:-\(API)")
            print("httpMethodType:-\(httpMethodType)")
            print("APIVersion:-\(APIVersion)")
            print("contentTypeKey:-\(contentTypeKey)")
            print("contentTypeValue:-\(contentTypeValue)")
            print("authTokenKey:-\(authTokenKey)")
            
            
            if
                let url = URL(string: API){
                //auth_token" = "GxTDgvgnxTCeRTNE5qo-jF8ZpwSuh3WF";
                //5affa02de4d642335a33496c
                //http://stage.freedomfromdiabetes.org/api/users/5affa02de4d642335a33496c/daily_vitals?start_date=2019-01-19&end_date=2019-01-23
                /*
                 request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                 request.setValue("application/vnd.ffd.v2+json", forHTTPHeaderField: "Accept")
                 request.setValue(defaults.value(forKey: "AuthenticationToken") as? String , forHTTPHeaderField: "Authorization")
                 */
                
                
                var request = URLRequest(url: url)
                request.httpMethod = httpMethodType
                request.timeoutInterval = 300
                request.setValue(contentTypeValue, forHTTPHeaderField: contentTypeKey)
                request.setValue(APIVersion, forHTTPHeaderField: contentTypeKey)
                request.setValue(authTokenValue, forHTTPHeaderField: authTokenKey)
                
                
                Alamofire.request(request)
                    .responseJSON { response in
                        if response.result.isSuccess{
                            
                            print("Sucess:-\(response.result.isSuccess)")
                            if
                                let statusCode = response.response?.statusCode{
                                if statusCode == 200{
                                    
                                    do {
                                        let dictionary = try JSONSerialization.jsonObject(with: response.data!, options: JSONSerialization.ReadingOptions.mutableContainers)
                                        print("Respose:-\(dictionary)")
                                        completionClouser(response.result.isSuccess,nil,dictionary,statusCode)
                                    }
                                    catch{
                                        
                                    }
                                    return
                                    
                                }
                                else{
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

