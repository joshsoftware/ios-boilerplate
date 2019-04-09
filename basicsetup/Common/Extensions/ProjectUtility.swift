//
//  ProjectUtility.swift
//  basicsetup
//
//  Created by Amit on 09/04/19.
//  Copyright © 2019 Josh Software. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController{

    func AlertMessages(title: String?, message: String?, actionTitle:String?, alertStyle:UIAlertController.Style, actionStyle:UIAlertAction.Style, handler:((UIAlertAction) -> Void)?){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: alertStyle)
        let action = UIAlertAction(title: actionTitle, style: actionStyle, handler: handler)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}
