//
//  AppDelegate.swift
//  LavaTrianglesBackground
//
//  Created by Kristaps Grinbergs on 12/05/2018.
//  Copyright © 2018 fassko. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
 
    window = UIWindow()
    window?.rootViewController = ViewController()
    window?.makeKeyAndVisible()
    
    return true
  }
}
