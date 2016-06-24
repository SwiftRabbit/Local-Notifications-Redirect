//
//  SplashScreenVC.swift
//  Notification Redirection
//
//  Created by Leopold Roitel on 16-06-24.
//  Copyright © 2016 Swift Rabbit. All rights reserved.
//

import UIKit
import SwiftyJSON

class SplashScreenVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "SplashScreenVC"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(animated: Bool) {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(self.catchIt), name: "myNotif", object: nil)
    }

    override func viewDidAppear(animated: Bool) {
        let prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        if prefs.valueForKey("startUpNotif") != nil{
            let userInfo: [NSObject : AnyObject] = ["inactive": "inactive"]
            NSNotificationCenter.defaultCenter().postNotificationName("myNotif", object: nil, userInfo: userInfo as [NSObject : AnyObject])
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    @IBAction func btnAction(sender: AnyObject) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc: OtherVC = storyboard.instantiateViewControllerWithIdentifier("OtherVC") as! OtherVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

