//
//  Helpers.swift
//  Calculator
//
//  Created by 서광현 on 2022/06/13.
//

import Foundation

enum CalculatorCategory: String, Hashable {
    case function1, function2, number
}
enum Operations: String, Hashable {
    case add = "+"
    case sub = "-"
    case mul = "X"
    case div = "÷"
    case none = "none"
}

let formatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.maximumIntegerDigits = 9
    formatter.maximumFractionDigits = 9
    return formatter
}()

func format(value: Double) -> String { return formatter.string(from: value as NSNumber)! }
