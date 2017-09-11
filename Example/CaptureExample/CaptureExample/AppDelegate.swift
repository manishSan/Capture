//
//  AppDelegate.swift
//  CaptureExample
//
//  Created by Sanwal, Manish on 9/11/17.
//  Copyright © 2017 Toys R Us. All rights reserved.
//

import UIKit
import Capture

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let capture = Capture()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        capture.clear()
        addLogs()

        let nc = capture.getUI()
        self.window?.rootViewController = nc

        // Override point for customization after application launch.
        return true
    }

    private func addLogs() {

        capture.saveEntry(name: "First Log", details: nil)
        capture.saveEntry(name: "Second Log", details: [("a key", "a small value"), ("2 key", "a long value"), ("3 key", "a mdeium value"),("4 key", "a ver very value")])
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

