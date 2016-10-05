//
//  Operators.swift
//  simple-calc
//
//  Created by Keegan Farley on 10/5/16.
//  Copyright © 2016 Keegan Farley. All rights reserved.
//

import Foundation

typealias OperatorFunction = ([UInt]) -> UInt

protocol SimpleOperator {
    var operate: OperatorFunction { get }
    var isValidOperandCount: (Int) -> Bool { get }
}

class BinaryOperator : SimpleOperator {

    let operate: OperatorFunction
    let isValidOperandCount: (Int) -> Bool = { $0 == 2 }

    required init(_ operation: @escaping (UInt, UInt) -> UInt) {
        self.operate = {
            return operation( $0[$0.count - 2], $0[$0.count - 1] )
        }
    }
}

class MultaryOperator : SimpleOperator {

    let operate: OperatorFunction
    let isValidOperandCount: (Int) -> Bool = { $0 >= 2 }

    required init(_ operation: @escaping OperatorFunction) {
        self.operate = operation
    }
}
