//
//  PostDetailViewController.swift
//  InstaFam
//
//  Created by Mavey Ma on 2/25/18.
//  Copyright © 2018 Mavey Ma. All rights reserved.
//

import UIKit
import ParseUI
class PostDetailViewController: UIViewController {
  
  @IBOutlet weak var detailImageView: PFImageView!
  @IBOutlet weak var numLikesLabel: UILabel!
  @IBOutlet weak var authorLabel: UILabel!
  @IBOutlet weak var captionLabel: UILabel!
  @IBOutlet weak var timestampLabel: UILabel!
  
  var post: Post?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if let post = post {
      numLikesLabel.text = String(post.likesCount) + " likes"
      
      
      authorLabel.text = post.author.username
      captionLabel.text = post.caption
      
      let dateFormatterGet = DateFormatter()
      dateFormatterGet.dateFormat = "yyyy-MM-dd hh:mm:ss"
      
      let dateFormatterPrint = DateFormatter()
      dateFormatterPrint.dateFormat = "MMM dd, yyyy"
      
      timestampLabel.text = dateFormatterPrint.string(from: post.createdAt!)
      
      if let imageFile : PFFile = post.media {
        imageFile.getDataInBackground(block: { (data, error) in
          if error == nil {
            DispatchQueue.main.async {
              // Async main thread
              let image = UIImage(data: data!)
              self.detailImageView.image = image
            }
          } else {
            print(error!.localizedDescription)
          }
        })
      }
      
      
      
    }
  
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
}
