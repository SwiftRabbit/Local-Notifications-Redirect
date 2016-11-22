//
//  AlertVC.swift
//  Notification Redirection
//
//  Created by Leopold Roitel on 16-06-24.
//  Copyright © 2016 Swift Rabbit. All rights reserved.
//

import UIKit

extension UIViewController{
    
    func catchIt(_ userInfo: Notification){
        
        if userInfo.userInfo?["userInfo"] != nil{
            let prefs: UserDefaults = UserDefaults.standard
            prefs.removeObject(forKey: "startUpNotif")
            prefs.synchronize()
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc: RedirectAppInactiveVC = storyboard.instantiateViewController(withIdentifier: "RedirectAppInactiveVC") as! RedirectAppInactiveVC
            self.navigationController?.pushViewController(vc, animated: true)

        }
        else{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc: RedirectAppActiveVC = storyboard.instantiateViewController(withIdentifier: "RedirectAppActiveVC") as! RedirectAppActiveVC
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func triggerAlert(_ title: String){
        let alert = UIAlertController(title: "Alert", message: title, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
}
