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
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var companyNameTextField: UITextField!
    @IBOutlet weak var memorablePlaceTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var backupEmailTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    registerBtn.createLoginButtons()
     
    }
    
    
    @IBAction func registerTapped(_ sender: Any) {
        if let name = nameTextField.text , let username = usernameTextField.text, let email = emailTextField.text , let password = passwordTextField.text, let memorablePlaces = memorablePlaceTextField.text , let backupEmail = backupEmailTextField.text , let companyName = companyNameTextField.text {
            if name.count > 0 && username.count > 0 && email.count > 0 && password.count > 0 && memorablePlaces.count > 0 && backupEmail.count > 0 && companyName.count > 0 {
                self.showLoader()
                APIRequests.checkIfEmailExistWithEmail(email: email) { (success, error) in
                    self.hideLoader()
                    if(success) {
                        APIRequests.checkIfUsernameExistWithName(username: username, completion: { (success, error) in
                            self.hideLoader()
                            if success {
                                APIRequests.registerUserWithName(name: name, usename: username, email: email, password: password, memorablePlaces: memorablePlaces, backupEmail: backupEmail, companyName: companyName) { (success, error) in
                                    self.hideLoader()
                                    if success {
                                        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                                        let mainVC = storyBoard.instantiateViewController(withIdentifier: "MainVC") as? MainViewController
                                        self.navigationController?.pushViewController(mainVC!, animated: true)
                                        
                                    }else {
                                        self.showAlert(title: "", body: "An error occured, please try again")
                                    }
                                }
                            }else {
                                self.showAlert(title: "", body: "Username already exist")
                                return
                            }
                        })
                    }else {
                        self.showAlert(title: "", body: "Email already exist")
                        return
                    }
                }
            }else {
                self.showAlert(title: "", body: "Please fill all fields.")
            }
        }
    }
}
