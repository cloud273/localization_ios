//
//  AppDelegate.swift
//  Example
//
//  Created by DUNGNGUYEN on 8/28/21.
//

import UIKit
import CLLocalization

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        CLLocalization.initialize(["en", "vi"])
        return true
    }


}

