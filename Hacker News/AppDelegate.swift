//
//  AppDelegate.swift
//  Hacker News
//
//  Created by Chris Howell on 15/09/2015.
//  Copyright © 2015 Chris Howell. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        let storiesViewController = StoriesViewController()
        let navigationController = UINavigationController(rootViewController: storiesViewController)

        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        window?.tintColor = UIColor.appPrimaryColor()
        
        return true
    }
}

