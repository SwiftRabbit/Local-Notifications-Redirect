//
//  AppDelegate.swift
//  Notification Redirection
//
//  Created by Leopold Roitel on 16-06-24.
//  Copyright © 2016 Swift Rabbit. All rights reserved.
//

import UIKit
import SwiftyJSON

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        let pushSettings = UIUserNotificationSettings(forTypes: [.Alert, .Badge, .Sound], categories: nil)
        UIApplication.sharedApplication().registerUserNotificationSettings(pushSettings)
        UIApplication.sharedApplication().registerForRemoteNotifications()
        
        let prefs: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        if let remoteNotification = launchOptions?[UIApplicationLaunchOptionsRemoteNotificationKey] as? NSDictionary {
            prefs.setObject(remoteNotification as [NSObject : AnyObject], forKey: "startUpNotif")
            prefs.synchronize()
        }
        else if launchOptions?[UIApplicationLaunchOptionsLocalNotificationKey] != nil {
            prefs.setObject("SOMESTRING", forKey: "startUpNotif")
            prefs.synchronize()
        }

        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        
        let localNotification = UILocalNotification()
        localNotification.fireDate = NSDate(timeIntervalSinceNow: 5)
        localNotification.alertBody = "My Local Notification"
        localNotification.timeZone = NSTimeZone.defaultTimeZone()
        localNotification.applicationIconBadgeNumber = UIApplication.sharedApplication().applicationIconBadgeNumber + 1
        
        UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
        
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        
        UIApplication.sharedApplication().applicationIconBadgeNumber = 0
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject]) {
        // TODO: your implementation for remote notifications
    }
    
    func application(application: UIApplication, didReceiveLocalNotification notification: UILocalNotification) {
        NSNotificationCenter.defaultCenter().postNotificationName("myNotif", object: nil)
    }

}

