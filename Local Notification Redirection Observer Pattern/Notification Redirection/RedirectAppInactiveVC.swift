//
//  RedirectAppInactiveVC.swift
//  Notification Redirection
//
//  Created by Leopold Roitel on 16-06-24.
//  Copyright © 2016 Swift Rabbit. All rights reserved.
//


import Foundation
import UIKit

class RedirectAppInactiveVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "RedirectAppInactiveVC"
    }
    
    override func viewWillAppear(animated: Bool) {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(self.catchIt), name: "myNotif", object: nil)
    }
    
    override func viewWillDisappear(animated: Bool) {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

