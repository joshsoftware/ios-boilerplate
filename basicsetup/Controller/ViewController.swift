//
//  ViewController.swift
//  basicsetup
//
//  Created by Amit on 21/01/19.
//  Copyright © 2019 Josh Software. All rights reserved.
//

import UIKit
import Alamofire


class ViewController: UIViewController {
    
    let loader = AJProgressView()
    private let decoder = JSONDecoder()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        loader.imgLogo = UIImage(named:"ProjectIcon")!
        loader.firstColor = .green
//        loader.secondColor = UIColor(red: 59/255, green: 152/255, blue: 148/255, alpha: 1)
//        loader.thirdColor = UIColor(red: 59/255, green: 152/255, blue: 148/255, alpha: 1)
        loader.duration = 2.0
        loader.lineWidth = 4.0
        loader.bgColor =  UIColor.clear
        
        loader.show()
        
    }
    
    
    func callAPI() {
        
        if let test = Configuration.sharedConfiguration.apiBaseURL{
            
            print("URL:- \(test)")
            DataManager.GetDailyVitals(startDate: "2019-04-04", endDate: "2019-04-08") { (isSucessful, error, result, statusCode) in
                
                if isSucessful{
                    
                    self.AlertMessages(title: "API Call", message: "Sucess", actionTitle: "OK", alertStyle: .alert, actionStyle: .cancel, handler: nil)
                    
                    guard let response = result as? Data else{
                        
                        self.AlertMessages(title: "Error", message: "Something went wrong", actionTitle: "OK", alertStyle: .alert, actionStyle: .cancel, handler: nil)
                        
                        return
                    }
                    do{
                        
                        
                        let dailyVitalObject = try self.decoder.decode(DailyVitalResponce.self, from: response)
                        
                        if
                            let bloodPressure = dailyVitalObject.data?.dailyVitals?[0].bloodPressure{
                            print(bloodPressure)
                        }
                        
                        
                    }
                    catch{
                        self.AlertMessages(title: "Error", message: error.localizedDescription, actionTitle: "OK", alertStyle: .alert, actionStyle: .cancel, handler: nil)
                        //print(error.localizedDescription)
                    }
                }
                else{
                    self.AlertMessages(title: "API Call", message: "Failure", actionTitle: "OK", alertStyle: .alert, actionStyle: .cancel, handler: nil)
                }
                
            }
            
        }
    }
}
