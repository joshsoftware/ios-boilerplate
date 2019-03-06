//
//  Configuration.swift
//  TestDemo
//
//  Created by Amit Dhadse on 10/01/19.
//  Copyright © 2019 Akshay Dibe. All rights reserved.
//

import UIKit

class Configuration: NSObject{

    var configuration   : String?
    var variables       : NSDictionary?
    var apiBaseURL      : String?
    var isDebugEnable  : Bool = false
    
    static let sharedConfiguration = Configuration()
    
    func initialize(){
        //Fetch current configuration
        let configureKeyValue = Bundle.main.infoDictionary
        self.configuration = configureKeyValue!["Configuration"] as? String
        
        //Load configurations
        let path = Bundle.main.path(forResource: "Configurations", ofType: "plist")
        let configurations = NSDictionary(contentsOf: URL(fileURLWithPath: path!))
        
        //Load variables for current configuration
        self.variables = configurations?[self.configuration ?? ""] as? NSDictionary
        
        self.apiBaseURL = self.APIBaseURL()
        self.isDebugEnable = self.isDebugingEnable()
    }
    
    func APIBaseURL() -> String{
        if Configuration.sharedConfiguration.variables != nil{
            return Configuration.sharedConfiguration.variables?.object(forKey: "baseURL") as! String
        }
        return ""
    }
    
    func isDebugingEnable() -> Bool{
        return Configuration.sharedConfiguration.variables?.object(forKey: "isDebugingEnable") as! Bool
    }
}
