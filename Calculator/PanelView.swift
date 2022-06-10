//
//  PanelView.swift
//  Calculator
//
//  Created by 서광현 on 2022/06/10.
//

import SwiftUI

struct PanelView: View {
    // MARK: - PROPERTIES

    let fitSize: CGFloat
    @Binding var displayNumber: String
    @Binding var operators: Operations
    @Binding var secondOperand: String
    @Binding var typeSecond: Bool
    @State var startType: Bool = false
    
    // MARK: - BODY

    var body: some View {
        VStack {
            HStack {
                CustomButtonView(
                    title: startType ? "C" : "AC",
                    buttonType: .function1,
                    fitSize: fitSize,
                    displayNumber: $displayNumber,
                    startType: $startType,
                    operators: $operators,
                    secondOperand: $secondOperand,
                    typeSecond: $typeSecond
                )
                
                CustomButtonView(
                    title: "±",
                    buttonType: .function1,
                    fitSize: fitSize,
                    displayNumber: $displayNumber,
                    startType: $startType,
                    operators: $operators,
                    secondOperand: $secondOperand,
                    typeSecond: $typeSecond
                )
                
                CustomButtonView(
                    title: "%",
                    buttonType: .function1,
                    fitSize: fitSize,
                    displayNumber: $displayNumber,
                    startType: $startType,
                    operators: $operators,
                    secondOperand: $secondOperand,
                    typeSecond: $typeSecond
                )
                
                CustomButtonView(
                    title: "÷",
                    buttonType: .function2,
                    fitSize: fitSize,
                    displayNumber: $displayNumber,
                    startType: $startType,
                    operators: $operators,
                    secondOperand: $secondOperand,
                    typeSecond: $typeSecond
                )
            } //: 1st HSTACK
            HStack {
                CustomButtonView(
                    title: "7",
                    buttonType: .number,
                    fitSize: fitSize,
                    displayNumber: $displayNumber,
                    startType: $startType,
                    operators: $operators,
                    secondOperand: $secondOperand,
                    typeSecond: $typeSecond
                )
                
                CustomButtonView(
                    title: "8",
                    buttonType: .number,
                    fitSize: fitSize,
                    displayNumber: $displayNumber,
                    startType: $startType,
                    operators: $operators,
                    secondOperand: $secondOperand,
                    typeSecond: $typeSecond
                )
                
                CustomButtonView(
                    title: "9",
                    buttonType: .number,
                    fitSize: fitSize,
                    displayNumber: $displayNumber,
                    startType: $startType,
                    operators: $operators,
                    secondOperand: $secondOperand,
                    typeSecond: $typeSecond
                )
                
                CustomButtonView(
                    title: "X",
                    buttonType: .function2,
                    fitSize: fitSize,
                    displayNumber: $displayNumber,
                    startType: $startType,
                    operators: $operators,
                    secondOperand: $secondOperand,
                    typeSecond: $typeSecond
                )
            } //: 2nd HSTACK
            HStack {
                CustomButtonView(
                    title: "4",
                    buttonType: .number,
                    fitSize: fitSize,
                    displayNumber: $displayNumber,
                    startType: $startType,
                    operators: $operators,
                    secondOperand: $secondOperand,
                    typeSecond: $typeSecond
                )
                
                CustomButtonView(
                    title: "5",
                    buttonType: .number,
                    fitSize: fitSize,
                    displayNumber: $displayNumber,
                    startType: $startType,
                    operators: $operators,
                    secondOperand: $secondOperand,
                    typeSecond: $typeSecond
                )
                
                CustomButtonView(
                    title: "6",
                    buttonType: .number,
                    fitSize: fitSize,
                    displayNumber: $displayNumber,
                    startType: $startType,
                    operators: $operators,
                    secondOperand: $secondOperand,
                    typeSecond: $typeSecond
                )
                
                CustomButtonView(
                    title: "-",
                    buttonType: .function2,
                    fitSize: fitSize,
                    displayNumber: $displayNumber,
                    startType: $startType,
                    operators: $operators,
                    secondOperand: $secondOperand,
                    typeSecond: $typeSecond
                )
            } //: 3rd HSTACK
            HStack {
                CustomButtonView(
                    title: "1",
                    buttonType: .number,
                    fitSize: fitSize,
                    displayNumber: $displayNumber,
                    startType: $startType,
                    operators: $operators,
                    secondOperand: $secondOperand,
                    typeSecond: $typeSecond
                )
                
                CustomButtonView(
                    title: "2",
                    buttonType: .number,
                    fitSize: fitSize,
                    displayNumber: $displayNumber,
                    startType: $startType,
                    operators: $operators,
                    secondOperand: $secondOperand,
                    typeSecond: $typeSecond
                )
                
                CustomButtonView(
                    title: "3",
                    buttonType: .number,
                    fitSize: fitSize,
                    displayNumber: $displayNumber,
                    startType: $startType,
                    operators: $operators,
                    secondOperand: $secondOperand,
                    typeSecond: $typeSecond
                )
                
                CustomButtonView(
                    title: "+",
                    buttonType: .function2,
                    fitSize: fitSize,
                    displayNumber: $displayNumber,
                    startType: $startType,
                    operators: $operators,
                    secondOperand: $secondOperand,
                    typeSecond: $typeSecond
                )
            } //: 4th HSTACK
            HStack {
                CustomButtonView(
                    title: "0",
                    buttonType: .number,
                    fitSize: fitSize,
                    isZeroButton: true,
                    displayNumber: $displayNumber,
                    startType: $startType,
                    operators: $operators,
                    secondOperand: $secondOperand,
                    typeSecond: $typeSecond
                )
                
                CustomButtonView(
                    title: ".",
                    buttonType: .number,
                    fitSize: fitSize,
                    displayNumber: $displayNumber,
                    startType: $startType,
                    operators: $operators,
                    secondOperand: $secondOperand,
                    typeSecond: $typeSecond
                )
                
                CustomButtonView(
                    title: "=",
                    buttonType: .function2,
                    fitSize: fitSize,
                    displayNumber: $displayNumber,
                    startType: $startType,
                    operators: $operators,
                    secondOperand: $secondOperand,
                    typeSecond: $typeSecond
                )
            } //: 5th HSTACK
        } //: VSTACK
        .scaledToFit()
    } //: GEOMETRY
}

