//
//  ComposeViewController.swift
//  InstaFam
//
//  Created by Mavey Ma on 2/24/18.
//  Copyright © 2018 Mavey Ma. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  @IBOutlet weak var captionTextView: UITextView!
  @IBOutlet weak var newPostImageView: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    captionTextView.delegate = self
    captionTextView.text = "Write a caption..."
    captionTextView.textColor = UIColor.lightGray
  
    self.hideKeyboard()
    
    
  }
  
  @IBAction func onClickImageView(_ sender: Any) {
    // Instantiate a UIImagePickerController
    let vc = UIImagePickerController()
    vc.delegate = self
    vc.allowsEditing = true
    vc.sourceType = UIImagePickerControllerSourceType.photoLibrary
    
    self.present(vc, animated: true, completion: nil)
  }
  
  // When the user finishes taking the picture, UIImagePickerController returns a dictionary that contains the image and some other meta data. The full set of keys are listed here.
  func imagePickerController(_ picker: UIImagePickerController,
                             didFinishPickingMediaWithInfo info: [String : Any]) {
    // Get the image captured by the UIImagePickerController
    let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
    let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
    print("f")
    // Do something with the images (based on your use case)
    newPostImageView.image = originalImage
    // Dismiss UIImagePickerController to go back to your original view controller
    dismiss(animated: true, completion: nil)
    print("f")
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
