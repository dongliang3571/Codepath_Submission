//
//  SettingsViewController.swift
//  tipster
//
//  Created by dong liang on 12/6/15.
//  Copyright © 2015 dong liang. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var default_tip: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = NSUserDefaults.standardUserDefaults()
        
        if let percentValue: Int? = defaults.integerForKey("saved_tip_percentage"){
            default_tip.selectedSegmentIndex = percentValue!
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func default_tip_settings(sender: UISegmentedControl) {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(default_tip.selectedSegmentIndex, forKey: "saved_tip_percentage")
        defaults.synchronize()
    }

   

}
