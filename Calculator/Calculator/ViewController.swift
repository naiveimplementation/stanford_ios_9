//
//  ViewController.swift
//  Calculator
//
//  Created by Pradeep Kumar on 8/2/16.
//  Copyright © 2016 Pradeep. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var userIsTyping = false
    
    // computed property
    private var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            // newValue is a special keyword returning the displayValue someone set
            display.text = String(newValue)
        }
    }
    
    var savedProgram: CalculatorBrain.PropertyList?
    
    @IBAction func save() {
        savedProgram = brain.program
    }
    
    @IBAction func restore() {
        if savedProgram != nil {
            brain.program = savedProgram!
            displayValue = brain.result
        }
    }
    
    
    @IBAction private func touchDigit(sender: UIButton) {
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
    @IBOutlet private weak var display: UILabel!
    
    private var brain: CalculatorBrain = CalculatorBrain()
    
    @IBAction private func performOperation(sender: UIButton) {
        if userIsTyping {
            brain.setOperand(displayValue)
            userIsTyping = false
        }
        if let mathematicalSymbol = sender.currentTitle {
            brain .performOperation(mathematicalSymbol)
        }
        displayValue = brain.result
    }
}

