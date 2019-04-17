//
//  LoginViewController.swift
//  FoodScanner
//
//  Created by Ali Jaber on 4/14/19.
//  Copyright © 2019 Ali Jaber. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var appLogoImageView: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var dontHaveAccountLabel: UILabel!
    @IBOutlet weak var createAccountBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    @IBAction func createAccountTapped(_ sender: Any) {
        performSegue(withIdentifier: "registerSegue", sender: self)
    }
    
    
    @IBAction func loginTapped(_ sender: Any) {
       goToRegistration()
    }
    
    func goToRegistration()  {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let mainVC = storyBoard.instantiateViewController(withIdentifier: "MainVC") as? MainViewController
        self.navigationController?.pushViewController(mainVC!, animated: true)
       // present(mainVC!, animated: true, completion: nil)
        
    }
}
