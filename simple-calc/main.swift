//
//  main.swift
//  simple-calc
//
//  Created by Keegan Farley on 10/5/16.
//  Copyright © 2016 Keegan Farley. All rights reserved.
//

import Foundation

typealias OperatorFunction = ([UInt]) -> UInt

class SimpleOperation {

    let minOperands: Int
    let operate: OperatorFunction

    init(minOperands: Int, operation: @escaping OperatorFunction) {
        self.minOperands = minOperands
        self.operate = operation
    }
}

var numericalInputHistory: [UInt] = []

var operatorFunctions: [String : SimpleOperation] = [
    "+" : SimpleOperation(minOperands: 2, operation: { inputs in
        return inputs.reduce(0, +)
    })
]

func promptForInput() -> UInt {
    repeat {
        let input = readLine(strippingNewline: true)!

        if let numericalInput = UInt.init(input) {
            numericalInputHistory.append(numericalInput)
        } else if let operatorFunction = operatorFunctions[input] {
            return operatorFunction.operate(numericalInputHistory)
        } else {
            print("\"\(input)\" command not recognized. Try one of \(operatorFunctions.keys)")
        }
    } while true
}


// Main logic
repeat {
    print("Enter an expression separated by returns:")

    let result = promptForInput()

    print("Result: \(result)")
    print("")
    print("")
} while true



