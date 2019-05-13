//
//  LoginViewController.swift
//  FoodScanner
//
//  Created by Ali Jaber on 4/14/19.
//  Copyright © 2019 Ali Jaber. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    var loginViewViewModel = LoginViewViewModel()
    @IBOutlet weak var appLogoImageView: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var dontHaveAccountLabel: UILabel!
    @IBOutlet weak var createAccountBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.underlinedTextField()
        passwordTextField.underlinedTextField()
        createAccountBtn.createUnderlindedButton(title: "Create Account")
        loginBtn.createLoginButtons()
    }
    
    @IBAction func createAccountTapped(_ sender: Any) {
      goToRegistration()
    }
    
    
    @IBAction func loginTapped(_ sender: Any) {
        if let username = emailTextField.text , let password = passwordTextField.text {
            if username.count > 0 && password.count > 0 {
                self.showLoader()
                APIRequests.loginWithEmail(email: username, password:password) { (success, error, user) in
                    self.hideLoader()
                    if success {
                        UserdefaultHelper.loggedIn()
                        self.goToMainView()
                    }else {
                        self.showAlert(title: "Error", body: "Please try again")
                        // fire alert msg
                    }
                }
            }else {
                self.showAlert(title: "", body: "Please fill all fields")
            }
        }
    }
    func goToRegistration()  {
          performSegue(withIdentifier: "registerSegue", sender: self)
    }
    
    func goToMainView()  {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let mainVC = storyBoard.instantiateViewController(withIdentifier: "MainVC") as? MainViewController
        self.navigationController?.pushViewController(mainVC!, animated: true)
       // present(mainVC!, animated: true, completion: nil)
    }
}
