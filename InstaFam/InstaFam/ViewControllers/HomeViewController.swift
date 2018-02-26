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
    get20PostsFromParse()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func onLogout(_ sender: Any) {
    print("Clicked logout")
    NotificationCenter.default.post(name: NSNotification.Name("didLogout"), object: nil)
  }
  
  func get20PostsFromParse(){
    let query = Post.query()
    query?.order(byDescending: "createdAt")
    query?.includeKey("author")
    query?.limit = 20
    
    // fetch data asynchronously
    query?.findObjectsInBackground { (Post, error: Error?) -> Void in
      if let posts = Post {
        // do something with the data fetched
        print(posts)
        // passing over my local posts to my global posts
        self.posts = posts as! [Post]
        self.homeFeedTableView.reloadData()
      } else {
        // handle error
        print("Failed to retrieve 20 objects from Parse server")
      }
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = homeFeedTableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostCell
    let post = posts[indexPath.row]
    
    let caption = post.caption
    cell.postCaptionLabel.text = caption
    
    if let imageFile : PFFile = post.media {
      imageFile.getDataInBackground(block: { (data, error) in
        if error == nil {
          DispatchQueue.main.async {
            // Async main thread
            let image = UIImage(data: data!)
            cell.postImageView.image = image
          }
        } else {
          print(error!.localizedDescription)
        }
      })
    }
    return cell
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return posts.count
  }
  
}
