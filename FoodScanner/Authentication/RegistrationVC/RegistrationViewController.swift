//
//  RegistrationViewController.swift
//  FoodScanner
//
//  Created by Ali Jaber on 4/14/19.
//  Copyright © 2019 Ali Jaber. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {
    @IBOutlet weak var registerBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    registerBtn.createLoginButtons()
     
    }
    

}
