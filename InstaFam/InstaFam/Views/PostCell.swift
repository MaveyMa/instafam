//
//  PostCell.swift
//  InstaFam
//
//  Created by Mavey Ma on 2/25/18.
//  Copyright © 2018 Mavey Ma. All rights reserved.
//

import UIKit
import ParseUI
class PostCell: UITableViewCell {

  @IBOutlet weak var postImageView: PFImageView!
  @IBOutlet weak var postCaptionLabel: UILabel!
  
  var instagramPost: PFObject! {
    didSet {
      self.postImageView.file = instagramPost["image"] as? PFFile
      self.postImageView.loadInBackground()
    }
  }
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
