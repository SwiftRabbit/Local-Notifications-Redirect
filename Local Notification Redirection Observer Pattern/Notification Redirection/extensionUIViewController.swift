//
//  AlertVC.swift
//  Notification Redirection
//
//  Created by Leopold Roitel on 16-06-24.
//  Copyright © 2016 Swift Rabbit. All rights reserved.
//

import UIKit

extension UIViewController{
    
    func catchIt(userInfo: NSNotification){
        if userInfo.valueForKey("userInfo") != nil{
            let prefs: NSUserDefaults = NSUserDefaults.standardUserDefaults()
            prefs.removeObjectForKey("startUpNotif")
            prefs.synchronize()
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc: RedirectAppInactiveVC = storyboard.instantiateViewControllerWithIdentifier("RedirectAppInactiveVC") as! RedirectAppInactiveVC
            self.navigationController?.pushViewController(vc, animated: true)

        }
        else{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc: RedirectAppActiveVC = storyboard.instantiateViewControllerWithIdentifier("RedirectAppActiveVC") as! RedirectAppActiveVC
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func triggerAlert(title: String){
        let alert = UIAlertController(title: "Alert", message: title, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
}
