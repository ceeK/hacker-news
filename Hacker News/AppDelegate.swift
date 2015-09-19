//
//  AppDelegate.swift
//  Hacker News
//
//  Created by Chris Howell on 15/09/2015.
//  Copyright © 2015 Chris Howell. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        let storiesViewController = StoriesViewController()
        let navigationController = UINavigationController(rootViewController: storiesViewController)

        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        testFirebase()
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    func testFirebase() {
        let firebase: Firebase = Firebase(url: "https://hacker-news.firebaseio.com/v0/")
        let paths = firebase.childByAppendingPath("topstories").childByAppendingPath("0")
        
        let _ = paths.observeEventType(FEventType.Value) { (snapshot, string) -> Void in
            let itemID = "item/\(10235545)"
            let itemRef = firebase.childByAppendingPath(itemID)
            itemRef.observeEventType(FEventType.Value, andPreviousSiblingKeyWithBlock: { (snapshot, _) -> Void in
                print(snapshot.value)
            })
        }
    }
}

