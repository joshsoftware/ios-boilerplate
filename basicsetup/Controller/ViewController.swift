//
//  ViewController.swift
//  basicsetup
//
//  Created by Amit on 21/01/19.
//  Copyright © 2019 Josh Software. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
		fetchHomeList()
    }

    func fetchHomeList() {
		ApiClient.getHomeScreenMediaList { (result) in
			switch result {
				case .failure(let error):
					print(error)
				case .success(let result):
					print(result)
			}
		}
	}
}
