//
//  Calculator.swift
//  Sample
//
//  Created by 下澤一輝 on 2019/07/15.
//  Copyright © 2019 下澤一輝. All rights reserved.
//


import Foundation
struct Calculator  {
    
    private var accumulator: String = ""
    private var resultDisplay:Double = 0.0
    
    mutating func performOperation(_ symbol: String) {
        if symbol != "="{
            var calc:String
            if symbol == "×"{
                 calc = "*"
            }else if symbol == "÷"{
                calc = "/"
            }else{
                calc = symbol
            }
            accumulator += calc
            print(accumulator)
        } else {
            let expression = NSExpression(format: accumulator)
            resultDisplay = expression.expressionValue(with: nil, context: nil) as! Double
            print(resultDisplay)
            accumulator = ""
        }

    }
    
    mutating func setOperand(_ operand: String) {
        accumulator += String(Double(operand)!)
        resultDisplay = Double(operand)!
        print(accumulator)
    }
    
   
    var result: Double? {
        get {
            return Double(resultDisplay)
        }
    }
  
}

