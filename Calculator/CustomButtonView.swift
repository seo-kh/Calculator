//
//  CustomButtonView.swift
//  Calculator
//
//  Created by 서광현 on 2022/06/10.
//

import SwiftUI

enum CalculatorCategory: String, Hashable {
    case function1, function2, number
}
enum Operations: String, Hashable {
    case add = "+"
    case sub = "-"
    case mul = "X"
    case div = "÷"
}

struct CustomButtonView: View {
    // MARK: - PROPERTIES

    //: Parameters
    let title: String
    let buttonType: CalculatorCategory
    let fitSize: CGFloat
    var isZeroButton: Bool = false
    @Binding var displayNumber: String
    @Binding var startType: Bool
    @Binding var operators: Operations
    @Binding var secondOperand: String
    @Binding var typeSecond: Bool
    
    //: Computed Properties
    var buttonColor: String {
        switch buttonType {
        case .function1:
            return "ButtonColor-1"
        case .function2:
            return "ButtonColor-2"
        case .number:
            return "NumberColor"
        }
    }
    var textColor: Color {
        switch buttonType {
        case .function1:
            return Color.black
        case .function2:
            return Color.white
        case .number:
            return Color.white
        }
    }
    
    // MARK: - FUNCTIONS

    private func numberPanel(title: String) {
        if startType {
            if typeSecond {
                secondOperand += title
            } else {
                displayNumber += title
            }
        } else {
            startType = true
            displayNumber = title
        }
    }
    private func function1Panel(title: String) {
        switch title {
        case "C":
            startType = false
            displayNumber = "0"
            operators = .add
            secondOperand = ""
            typeSecond = false
        case "±":
            let value = Float(displayNumber) ?? 0.0
            displayNumber = String(describing: -value)
        case "%":
            let value = Float(displayNumber) ?? 0.0
            displayNumber = String(describing: value / 100.0)
            startType = false
        default:
            fatalError("I don't know")
        }
    }
    private func function2Panel(title: String) {
        switch title {
        case "÷":
            operators = .div
            typeSecond = true
        case "+":
            operators = .add
            typeSecond = true
        case "-":
            operators = .sub
            typeSecond = true
        case "X":
            operators = .mul
            typeSecond = true
        case ".":
            if !displayNumber.contains(".") {
                displayNumber += "."
                startType = true
            }
        case "=":
            let first = Double(displayNumber) ?? 0.0
            let second = Double(secondOperand) ?? 0.0
            
            switch operators {
            case .add:
                let result = first + second
                displayNumber = String(describing: result)
            case .sub:
                let result = first - second
                displayNumber = String(describing: result)
            case .mul:
                let result = first * second
                displayNumber = String(describing: result)
            case .div:
                let result = first / second
                displayNumber = String(describing: result)
            }
            
            self.clear()
            
        default:
            fatalError("I don't know")
        }
    }
    private func clear() {
        operators = .add
        secondOperand = ""
        typeSecond = false
    }
    
    // MARK: - BODY

    var body: some View {
        Button {
            if "0123456789".contains(title) {
                self.numberPanel(title: title)
            } else if "C±%".contains(title) {
                self.function1Panel(title: title)
            } else {
                self.function2Panel(title: title)
            }
        } label: {
            Capsule()
                .fill(Color(buttonColor))
                .frame(width: isZeroButton ? fitSize / 2 : fitSize / 4, height: fitSize / 4)
                .overlay(
                    Text(title)
                        .minimumScaleFactor(0.5)
                        .font(.system(size: fitSize / 8))
                        .frame(
                            width: fitSize / 8,
                            height: fitSize / 8,
                            alignment: .center)
                        .foregroundColor(textColor)
                )
                .scaledToFit()
        }
        
    }
}

