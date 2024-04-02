//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Alvin Nguyen on 3/27/24.
//  Copyright © 2024 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    // Turn tuple into an optional
    var intermediateCalculation: (n1: Double, calcMethod: String)?
    
    // Optional Double returned in order to return nil
    mutating func calculate(symbol: String, displayValue: Double) -> Double? {
        if symbol == "+/-" {
            return displayValue * -1
        }
        else if symbol == "AC" {
            return 0
        }
        else if symbol == "%" {
            return displayValue * 0.01
        }
        else if symbol == "=" {
            return performTwoNumCalculation(n2: displayValue)
        }
        // Make all other symbols do their calculations (2 number calcs)
        else {
            intermediateCalculation = (n1: displayValue, calcMethod: symbol)
        }
        return nil
    }
    
    private func performTwoNumCalculation(n2: Double) -> Double? {
        // Optional chaining
        if let n1 = intermediateCalculation?.n1, let operation = intermediateCalculation?.calcMethod {
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                fatalError("The operation passed in does not match any of the cases.")
            }
        }
        return nil
    }
}
