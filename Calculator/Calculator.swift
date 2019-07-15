//
//  Calculator.swift
//  Calculator
//
//  Created by 下澤一輝 on 2019/07/15.
//  Copyright © 2019 下澤一輝. All rights reserved.
//


import Foundation
struct Calculator  {
    
    private var accumulator: String = ""
    private var resultDisplay : String = ""
    mutating func performOperation(_ symbol: String) {
        if Int(accumulator.suffix(1)) != nil {
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
            } else if symbol == "=" && accumulator != nil{
                let expression = NSExpression(format: accumulator)
                let resultNum = expression.expressionValue(with: nil, context: nil) as! Double
                if String(resultNum).hasSuffix(".0"){
                    resultDisplay = String(String(resultNum).prefix(String(resultNum).count-2))
                } else {
                    resultDisplay = String(resultNum)
                }
                print(accumulator)
                
                accumulator = resultDisplay
            }
        }
    }
    
    mutating func setOperand(_ operand: String) {
        accumulator += String(Double(operand)!)
        print(accumulator)
        resultDisplay = operand
        
    }
    
    
    var result: String? {
        get {
            return resultDisplay
        }
    }
    
    var accum: String? {
        get {
            return accumulator
        }
        set {
            accumulator = newValue!
        }
    }
    
}

