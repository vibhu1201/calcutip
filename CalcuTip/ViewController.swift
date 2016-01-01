//
//  ViewController.swift
//  CalcuTip
//
//  Created by Vaibhav Sharma on 12/17/15.
//  Copyright (c) 2015 Vaibhav Sharma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billLabel:
        UILabel!
    
    @IBOutlet weak var tipLabel:
        UILabel!
    
    @IBOutlet weak var billField:
        UITextField!
    
    
    @IBOutlet weak var tipField:
        UITextField!
    
    @IBOutlet weak var tipControl:
        UISegmentedControl!
    
    @IBOutlet weak var tipHeading:
        UILabel!
    
    @IBOutlet weak var totalTip:
        UILabel!
    
    @IBOutlet weak var totalBill:
        UILabel!
    
    @IBOutlet weak var dividerLine:
        UIView!
    
    func UIColorFromHex(rgbValue:UInt32, alpha:Double=1.0)->UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        
        return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tip Calculator"
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColorFromHex(0x95d1f4, alpha:1.0)

        
        self.billLabel.alpha = 1
        self.billField.alpha = 1
        self.tipField.alpha = 0
        self.tipLabel.alpha = 0
        self.tipControl.alpha = 0
        self.tipHeading.alpha = 0
        self.totalTip.alpha = 0
        self.totalBill.alpha = 0
        self.billLabel.alpha = 0
        self.dividerLine.alpha = 0
        
        
        tipLabel.text="$0.00"
        billLabel.text="$0.00"
        tipField.userInteractionEnabled = false
        
    }
    
    override func viewDidAppear(animated: Bool) {
        [billField .becomeFirstResponder()]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        
        UIView.animateWithDuration(0.4, animations: {
            self.billLabel.alpha = 1
            self.billField.alpha = 1
            self.tipField.alpha = 1
            self.tipLabel.alpha = 1
            self.tipControl.alpha = 1
            self.tipHeading.alpha = 1
            self.totalTip.alpha = 1
            self.totalBill.alpha = 1
            self.billLabel.alpha = 1
            self.dividerLine.alpha = 1
        })
        
        var tipPercentages = [0.1, 0.15, 0.18, "other"]
        let tip_Percentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        let billamount = NSString(string: billField.text!).doubleValue
        
        var tip = billamount
        
        if (tip_Percentage != "other") {
            tipField.userInteractionEnabled = false
            let doubled_tip_Percentage = tip_Percentage as! Double
            
            tip = tip * doubled_tip_Percentage
        }
        
        else {
            print(tip_Percentage)
            tipField.userInteractionEnabled = true
            
            let tipField_Percentage = ((NSString(string: tipField.text!).doubleValue) / 100)
            
            tip = tip * tipField_Percentage
        }
        
        let total = billamount + tip
        
        tipLabel.text = "$\(tip)"
        billLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        billLabel.text = String(format: "$%.2f", total)
        
    }
    
    @IBAction func onTap(sender: AnyObject) {
        UIView.animateWithDuration(0.4, animations: {
            self.view.backgroundColor = self.UIColorFromHex(0x93ec94, alpha:1.0)
        })
        
        view.endEditing(true)
    }
}

