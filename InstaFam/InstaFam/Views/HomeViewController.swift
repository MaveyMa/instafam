//
//  HomeViewController.swift
//  InstaFam
//
//  Created by Mavey Ma on 2/24/18.
//  Copyright © 2018 Mavey Ma. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
  
  @IBOutlet weak var loginBarButtonItem: UIBarButtonItem!
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func onLogout(_ sender: Any) {
    NotificationCenter.default.post(name: NSNotification.Name("didLogout"), object: nil)
    
  }
  
  
}
