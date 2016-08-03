//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Pradeep Kumar on 8/2/16.
//  Copyright © 2016 Pradeep. All rights reserved.
//

import Foundation

class CalculatorBrain {
    
    private var accumulator = 0.0
    
    func setOperand(operand: Double) {
        accumulator = operand
    }
    
    private var operations: Dictionary<String, Operation> = [
        "π": Operation.Constant(M_PI), //M_PI,
        "e": Operation.Constant(M_E), //M_E,
        "±": Operation.UnaryOperation({ -$0 }),
        "√": Operation.UnaryOperation(sqrt), //sqrt,
        "cos": Operation.UnaryOperation(cos), //cos
        "x": Operation.BinaryOperation({ $0 * $1 }),
        "/": Operation.BinaryOperation({ $0 / $1 }),
        "+": Operation.BinaryOperation({ $0 + $1 }),
        "-": Operation.BinaryOperation({ $0 - $1 }),
        "=": Operation.Equals
    ]
    
    private enum Operation {
        case Constant(Double)
        case UnaryOperation((Double) -> Double)
        case BinaryOperation((Double, Double) -> Double)
        case Equals
    }
    
    func performOperation(symbol: String) {
        if let operation = operations[symbol] {
            switch operation {
            case .Constant(let associatedConstantValue):
                accumulator = associatedConstantValue
            case .UnaryOperation(let associatedFunction):
                accumulator = associatedFunction(accumulator)
            case .BinaryOperation(let associatedFunction):
                executePendingBinaryOperation()
                pending = PendingBinaryOperationInfo(binaryFunction: associatedFunction, firstOperand: accumulator)
            case .Equals:
                executePendingBinaryOperation()
            }
        }
    }
    
    private func executePendingBinaryOperation() {
        if pending != nil {
            accumulator = pending!.binaryFunction(pending!.firstOperand, accumulator)
            pending = nil
        }
    }
    
    private var pending: PendingBinaryOperationInfo?
    
    // structs (like enums) are passed by value
    private  struct PendingBinaryOperationInfo {
        var binaryFunction: (Double, Double) -> Double
        var firstOperand: Double
    }
    
    // read only property, because there is no set
    var result: Double {
        get { return accumulator }
    }
    
}
