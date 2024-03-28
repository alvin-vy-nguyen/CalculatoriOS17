//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Alvin Nguyen on 3/27/24.
//  Copyright © 2024 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    // Optional Double returned in order to return nil
    func calculate(symbol: String, displayValue: Double) -> Double? {
        if symbol == "+/-" {
            return displayValue * -1
        }
        else if symbol == "AC" {
            return 0
        }
        else if symbol == "%" {
            return displayValue * 0.01
        }
        return nil
    }
}
