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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let test = Configuration.sharedConfiguration.apiBaseURL{
            
            print("URL:- \(test)")
        }
    }
}
