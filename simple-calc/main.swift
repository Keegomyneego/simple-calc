//
//  main.swift
//  simple-calc
//
//  Created by Keegan Farley on 10/5/16.
//  Copyright © 2016 Keegan Farley. All rights reserved.
//

import Foundation

var definedOperators: [String : SimpleOperator] = [
    "+" : BinaryOperator(+),
    "-" : BinaryOperator(-),
    "*" : BinaryOperator(*),
    "/" : BinaryOperator(/),
    "%" : BinaryOperator(%)
]

func promptForInput() -> UInt {
    var currentOperatorInfo: (name: String, op: SimpleOperator)?
    var numericalInputHistory: [UInt] = []

    repeat {
        let input = readLine(strippingNewline: true)!

        if let numericalInput = UInt.init(input) {
            // accumulate numbers
            numericalInputHistory.append(numericalInput)
        }else if let definedOperator = definedOperators[input] {
            // attempt to set operator
            if currentOperatorInfo == nil {
                currentOperatorInfo = (input, definedOperator)
            } else {
                print("Operator already set to \(currentOperatorInfo!.name)")
                continue
            }
        } else {
            // catch unknown input
            print("\"\(input)\" command not recognized. Try one of [\(definedOperators.keys.joined(separator: ", "))]")
            continue
        }

        // attempt to run current operation if there is one
        if currentOperatorInfo != nil
            && currentOperatorInfo!.op.isValidOperandCount(numericalInputHistory.count) {
            return currentOperatorInfo!.op.operate(numericalInputHistory)
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



