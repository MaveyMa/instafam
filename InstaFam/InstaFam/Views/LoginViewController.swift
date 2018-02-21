//
//  LoginViewController.swift
//  InstaFam
//
//  Created by Mavey Ma on 2/19/18.
//  Copyright © 2018 Mavey Ma. All rights reserved.
//

import UIKit
import Parse
class LoginViewController: UIViewController {
  
  @IBOutlet weak var usernameField: UITextField!
  @IBOutlet weak var passwordField: UITextField!
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  @IBAction func onSignIn(_ sender: Any) {
  }
  
  @IBAction func onSignUp(_ sender: Any) {
    
    let newUser = PFUser()
    
    newUser.username = usernameField.text
    newUser.password = passwordField.text
    
    newUser.signUpInBackground { (success, error) in
      if success {
        print("Yay, created a user!")
      } else if let error = error as NSError? {
        print(error.localizedDescription)
        if error.code == 202 {
          print("Username is taken")
        }
      }
    }
    
  }
}
