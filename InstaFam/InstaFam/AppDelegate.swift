//
//  AppDelegate.swift
//  InstaFam
//
//  Created by Mavey Ma on 2/19/18.
//  Copyright © 2018 Mavey Ma. All rights reserved.
//

import UIKit
import Parse

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    // Initialize Parse
    // Set applicationId and server based on the values in the Heroku settings.
    // clientKey is not used on Parse open source unless explicitly configured
    Parse.initialize(
      with: ParseClientConfiguration(block: { (configuration: ParseMutableClientConfiguration) -> Void in
        configuration.applicationId = "InstaFam"
        configuration.clientKey = "kdajfkadsfklasfjdksiojaokfnadiiafj"  // set to nil assuming you have not set clientKey
        configuration.server = "https://quiet-river-66768.herokuapp.com/parse"
      })
    )
    
    // Keep a look out for if user clicked "Logout"
    NotificationCenter.default.addObserver(forName: Notification.Name("didLogout"), object: nil, queue: OperationQueue.main) { (Notification) in
      print("Logout notification received")
      self.logOut()
    }
    
    // Keep a look out for if user clicked "Cancel"
    NotificationCenter.default.addObserver(forName: Notification.Name("didCancel"), object: nil, queue: OperationQueue.main) { (Notification) in
      print("Cancel notification received")
      self.cancel()
    }
    
    // check if user is logged in.
    if PFUser.current() != nil {
      // Load and show the home view controller
      let storyboard = UIStoryboard(name: "Main", bundle: nil)
      let navigationViewController = storyboard.instantiateViewController(withIdentifier: "AuthenticatedViewController")
      self.window?.rootViewController = navigationViewController
    }
    
    return true
  }
  
  func logOut() {
    // Logout the current user
    PFUser.logOutInBackground(block: { (error) in
      if let error = error {
        print(error.localizedDescription)
      } else {
        print("Successful logout")
        // Load and show the login view controller
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
        self.window?.rootViewController = loginViewController
      }
    })
  }
  
  func cancel() {
    // Load and show the home view controller
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let navigationViewController = storyboard.instantiateViewController(withIdentifier: "AuthenticatedViewController")
    self.window?.rootViewController = navigationViewController
    print("Successful cancel")
  }
  
  func applicationWillResignActive(_ application: UIApplication) {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
  }
  
  func applicationDidEnterBackground(_ application: UIApplication) {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
  }
  
  func applicationWillEnterForeground(_ application: UIApplication) {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
  }
  
  func applicationDidBecomeActive(_ application: UIApplication) {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  }
  
  func applicationWillTerminate(_ application: UIApplication) {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  }
  
  
}

