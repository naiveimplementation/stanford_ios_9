//
//  ViewController.swift
//  Calculator
//
//  Created by Pradeep Kumar on 8/2/16.
//  Copyright © 2016 Pradeep. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var userIsTyping = false
    
    @IBAction func touchDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsTyping {
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        } else {
            display.text = digit
        }
        userIsTyping = true
    }
    
    // optionals are always initially set to nil
    @IBOutlet weak var display: UILabel!
    
    @IBAction func performOperation(sender: UIButton) {
        userIsTyping = false
        if let mathematicalSymbol = sender.currentTitle {
            if mathematicalSymbol == "π" {
                display.text = String(M_PI)
            }
        }
    }
}

