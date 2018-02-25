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
    
    // Make keyboard automatically appear
    usernameField.becomeFirstResponder()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  @IBAction func onSignIn(_ sender: Any) {
    PFUser.logInWithUsername(inBackground: usernameField.text!, password: passwordField.text!) { (user, error) -> Void in
      if user != nil {
        print("You're logged in!")
        self.performSegue(withIdentifier: "loginSegue", sender: nil)
      }
    }
  }
  
  @IBAction func onSignUp(_ sender: Any) {
    let newUser = PFUser()
    
    newUser.username = usernameField.text
    newUser.password = passwordField.text
    
    newUser.signUpInBackground { (success, error) in
      if success {
        print("Yay, created a user!")
        self.performSegue(withIdentifier: "loginSegue", sender: nil)
      } else if let e = error as NSError? {
        print(e.localizedDescription)
        if e.code == 202 {
          print("Username is taken")
        }
      }
    }
  }
  
}
