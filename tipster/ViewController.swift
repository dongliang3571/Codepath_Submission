//
//  ViewController.swift
//  tipster
//
//  Created by dong liang on 12/5/15.
//  Copyright © 2015 dong liang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
        let defaults = NSUserDefaults.standardUserDefaults()
        if defaults.objectForKey("saved_bill") != nil{
            let stringValue = defaults.objectForKey("saved_bill") as! String
            billField.text = stringValue
        }
        
        if let percentValue: Int? = defaults.integerForKey("saved_tip_percentage"){
            tipControl.selectedSegmentIndex = percentValue!
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
        
    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount = NSString(string: billField.text!).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        
        
    }
    
    @IBAction func selectSeg(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(billField.text, forKey: "saved_bill")
        defaults.setInteger(tipControl.selectedSegmentIndex, forKey: "saved_tip_percentage")
        defaults.synchronize()
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        if defaults.objectForKey("saved_bill") != nil{
            let stringValue = defaults.objectForKey("saved_bill") as! String
            billField.text = stringValue
        }
        
        if let percentValue: Int? = defaults.integerForKey("saved_tip_percentage"){
            tipControl.selectedSegmentIndex = percentValue!
        }
        
        onEditingChanged(tipControl)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let defaults = NSUserDefaults.standardUserDefaults()
        if defaults.objectForKey("saved_bill") != nil{
            let stringValue = defaults.objectForKey("saved_bill") as! String
            billField.text = stringValue
        }
        
        if let percentValue: Int? = defaults.integerForKey("saved_tip_percentage"){
            tipControl.selectedSegmentIndex = percentValue!
        }
        onEditingChanged(tipControl)
    }
    
    
}

