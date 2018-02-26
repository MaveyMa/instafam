//
//  ComposeViewController.swift
//  InstaFam
//
//  Created by Mavey Ma on 2/24/18.
//  Copyright © 2018 Mavey Ma. All rights reserved.
//

import UIKit
import Toucan
class ComposeViewController: UIViewController, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  @IBOutlet weak var captionTextView: UITextView!
  @IBOutlet weak var newPostImageView: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    captionTextView.delegate = self
    captionTextView.text = "Write a caption..."
    captionTextView.textColor = UIColor.lightGray
    
    self.hideKeyboard()
    
    //To upload the user image to Parse, get the user input from the view controller and then call the postUserImage method from the view controller by passing all the required arguments into it (Please see method's comments for more details on arguments).
    
  }
  
  
  @IBAction func onClickImageView(_ sender: Any) {
    // Instantiate a UIImagePickerController
    let vc = UIImagePickerController()
    vc.delegate = self
    vc.allowsEditing = true
    //vc.sourceType = UIImagePickerControllerSourceType.photoLibrary
    
    
    if UIImagePickerController.isSourceTypeAvailable(.camera) {
      print("Camera is available 📸")
      vc.sourceType = UIImagePickerControllerSourceType.camera
    } else {
      print("Camera 🚫 available so we will use photo library instead")
      vc.sourceType = UIImagePickerControllerSourceType.photoLibrary
    }
    
    self.present(vc, animated: true, completion: nil)
  }
  
  // When the user finishes taking the picture, UIImagePickerController returns a dictionary that contains the image and some other meta data. The full set of keys are listed here.
  func imagePickerController(_ picker: UIImagePickerController,
                             didFinishPickingMediaWithInfo info: [String : Any]) {
    // Get the image captured by the UIImagePickerController
    let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
    // let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
    
    let resizedImage = Toucan.Resize.resizeImage(originalImage, size: CGSize(width: 258, height: 258))
    
    // Do something with the images (based on your use case)
    newPostImageView.image = resizedImage
    // Dismiss UIImagePickerController to go back to your original view controller
    dismiss(animated: true, completion: nil)
    
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
    Post.postUserImage(image: newPostImageView.image, withCaption: captionTextView.text) { (success, error) in
      if success {
        print("Great new post!")
      }
      else if let e = error as NSError? {
        print(e.localizedDescription)
        print("Something went wrong with your post.")
      }
    }
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
