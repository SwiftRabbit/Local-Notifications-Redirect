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

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(self.catchIt), name: NSNotification.Name(rawValue: "myNotif"), object: nil)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let prefs: UserDefaults = UserDefaults.standard
        if prefs.value(forKey: "startUpNotif") != nil {
            let userInfo: [AnyHashable: Any] = ["inactive": "inactive"]
            NotificationCenter.default.post(name: Notification.Name(rawValue: "myNotif"), object: nil, userInfo: userInfo as [AnyHashable: Any])
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    @IBAction private func btnAction(_ sender: AnyObject) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc: OtherVC = storyboard.instantiateViewController(withIdentifier: "OtherVC") as! OtherVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

