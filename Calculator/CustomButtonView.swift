//
//  CustomButtonView.swift
//  Calculator
//
//  Created by 서광현 on 2022/06/10.
//

import SwiftUI


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
    @Binding var firstOperand: String
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
        // 첫 숫자가 작성되었을 때, 로직
        if startType {
            // 두 번째 숫자가 작성될 때, 로직
            if typeSecond {
                // 소수점 처리 로직
                if title == "." {
                    if secondOperand.isEmpty {
                        secondOperand += "0."
                    } else if secondOperand.contains(".") {
                        //
                    } else { secondOperand += title }
                } else { secondOperand += title }
                displayNumber = secondOperand
            } else {
                firstOperand += firstOperand.contains(".") && title == "." ?  "" : title
                displayNumber = firstOperand
            }
        } else {
            startType = true
            firstOperand = title == "." ? "0." : title
            displayNumber = firstOperand
        }
    } //: Number button에 대한 함수구현
    private func function1Panel(title: String) {
        switch title {
        case "C":
            startType = false
            displayNumber = "0"
            operators = .none
            firstOperand = ""
            secondOperand = ""
            typeSecond = false
        case "±":
            let value = Double(displayNumber) ?? 0.0
            firstOperand = format(value: -value)
            displayNumber = firstOperand
        case "%":
            let value = Double(displayNumber) ?? 0.0
            firstOperand = format(value: value / 100.0)
            displayNumber = firstOperand
            startType = true
        default:
            self.function1Panel(title: "C")
        }
    } //: Function1 button에 대한 함수구현
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
        case "=":
            let first = Double(firstOperand) ?? 0.0
            let second = Double(secondOperand) ?? 0.0
            
            switch operators {
            case .add:
                let result = first + second
                firstOperand = format(value: result)
                displayNumber = firstOperand
            case .sub:
                let result = first - second
                firstOperand = format(value: result)
                displayNumber = firstOperand
            case .mul:
                let result = first * second
                firstOperand = format(value: result)
                displayNumber = firstOperand
            case .div:
                let result = first / second
                firstOperand = format(value: result)
                displayNumber = firstOperand
            case .none:
                self.function1Panel(title: "C")
            }
            
            secondOperand = ""
            
        default:
            self.function1Panel(title: "C")
        }
    } //: Function2 button에 대한 함수구현
    
    // MARK: - BODY

    var body: some View {
        Button {
            switch buttonType {
            case .function1:
                self.function1Panel(title: title)
            case .function2:
                self.function2Panel(title: title)
            case .number:
                self.numberPanel(title: title)
            }
        } label: {
            Capsule()
                .fill(Color(buttonColor))
                .frame(width: isZeroButton ? fitSize / 1.9 : fitSize / 4, height: fitSize / 4)
                .overlay(
                    Text(title)
                        .offset(x: isZeroButton ? fitSize / 16 : 0)
                        .minimumScaleFactor(0.5)
                        .font(.system(size: fitSize / 8))
                        .frame(
                            width: fitSize / 8,
                            height: fitSize / 8,
                            alignment: .center)
                        .foregroundColor(textColor)
                    , alignment: isZeroButton ? .leading : .center
                )
                .scaledToFit()
        }
        
    }
}

