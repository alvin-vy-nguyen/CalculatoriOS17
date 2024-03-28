//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber: Bool = true
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label text to a Double.")
            }
            return number
        }
        set {
            // Updates text whenever displayValue is changed
            displayLabel.text = String(newValue)
        }
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        isFinishedTypingNumber = true

        if let calcMethod = sender.currentTitle {
            let calculator = CalculatorLogic()
            
            guard let result = calculator.calculate(symbol: calcMethod, displayValue: displayValue) else {
                fatalError("Result of the calculation was nil")
            }
            displayValue = result
        }
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        
        if let numValue = sender.currentTitle {
            // Shorter way of writing if true
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else {
                
                if numValue == "." {

                    let isInt = floor(displayValue) == displayValue
                    
                    // Stop appending if isInt is false (if there is an existing ".")
                    if !isInt {
                        return
                    }
                }
                // Looks at the button's current title and appends it to the current displayLabel text
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }

}

