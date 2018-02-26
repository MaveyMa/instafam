//
//  HomeViewController.swift
//  InstaFam
//
//  Created by Mavey Ma on 2/24/18.
//  Copyright © 2018 Mavey Ma. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
  @IBOutlet weak var homeFeedTableView: UITableView!
  var posts: [Post] = []
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    homeFeedTableView.delegate = self
    homeFeedTableView.dataSource = self
    self.homeFeedTableView.reloadData()
  
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func onLogout(_ sender: Any) {
    print("Clicked logout")
    NotificationCenter.default.post(name: NSNotification.Name("didLogout"), object: nil)
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = homeFeedTableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostCell
    let post = posts[indexPath.row]
    
    let caption = post.caption
    cell.postCaptionLabel.text = caption
    return cell
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return posts.count
  }
  
}
