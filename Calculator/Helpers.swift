//
//  Helpers.swift
//  Calculator
//
//  Created by 서광현 on 2022/06/13.
//

import Foundation

/**
    Button의 기능을 구분하기 위한 enum
*/
enum CalculatorCategory: String, Hashable {
    case function1, function2, number
}

/**
    Operation(연산)을 구분하기위한 enum

 */
enum Operations: String, Hashable {
    case add = "+"
    case sub = "-"
    case mul = "X"
    case div = "÷"
    case none = "none"
    
    var currentOperation: String {
        self.rawValue
    }
}

/// 계산기 화면 ( Display )에 나타날 문자 포맷 기능구현
let formatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.maximumIntegerDigits = 9
    formatter.maximumFractionDigits = 9
    return formatter
}()

func format(value: Double) -> String { return formatter.string(from: value as NSNumber)! }
