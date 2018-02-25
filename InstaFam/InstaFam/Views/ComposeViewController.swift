//
//  ComposeViewController.swift
//  InstaFam
//
//  Created by Mavey Ma on 2/24/18.
//  Copyright © 2018 Mavey Ma. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController, UITextViewDelegate {
  
  @IBOutlet weak var captionTextView: UITextView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    captionTextView.delegate = self
    captionTextView.text = "Write a caption..."
    captionTextView.textColor = UIColor.lightGray
  
    self.hideKeyboard()
  }
  
  func textViewDidBeginEditing(_ textView: UITextView) {
    if captionTextView.textColor == UIColor.lightGray {
      captionTextView.text = nil
      captionTextView.textColor = UIColor.black
    }
  }
  
  func textViewDidEndEditing(_ textView: UITextView) {
    if captionTextView.text.isEmpty {
      captionTextView.text = "Write a caption..."
      captionTextView.textColor = UIColor.lightGray
    }
  }
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func onCancel(_ sender: Any) {
    captionTextView.resignFirstResponder()
    print("Clicked cancel")
    NotificationCenter.default.post(name: NSNotification.Name("didCancel"), object: nil)
  }
  
  @IBAction func onShare(_ sender: Any) {
    captionTextView.resignFirstResponder()
    print("Clicked share")
    NotificationCenter.default.post(name: NSNotification.Name("didCancel"), object: nil)
  }
  
}

extension UIViewController
{
  func hideKeyboard()
  {
    let tap: UITapGestureRecognizer = UITapGestureRecognizer(
      target: self,
      action: #selector(UIViewController.dismissKeyboard))
    
    view.addGestureRecognizer(tap)
  }
  
  @objc func dismissKeyboard()
  {
    view.endEditing(true)
  }
}
