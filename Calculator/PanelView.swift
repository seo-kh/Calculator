//
//  PanelView.swift
//  Calculator
//
//  Created by 서광현 on 2022/06/10.
//

import SwiftUI

enum CalculatorCategory: String, Hashable {
    case funcion1, function2, number
}

struct PanelView: View {
    var body: some View {
        HStack {
            CustomButtonView(
                title: "C",
                buttonType: .funcion1
            )
            
            CustomButtonView(
                title: "+/-",
                buttonType: .funcion1
            )
            
            CustomButtonView(
                title: "%",
                buttonType: .funcion1
            )
            
            CustomButtonView(
                title: "%",
                buttonType: .function2
            )
        }
    }
}

struct CustomButtonView: View {
    let title: String
    let buttonType: CalculatorCategory
    var buttonColor: String {
        switch buttonType {
        case .funcion1:
            return "ButtonColor-1"
        case .function2:
            return "ButtonColor-2"
        case .number:
            return "NumberColor"
        }
    }
    var textColor: Color {
        switch buttonType {
        case .funcion1:
            return Color.black
        case .function2:
            return Color.white
        case .number:
            return Color.white
        }
    }
    
    var body: some View {
        Button {
            //
        } label: {
            GeometryReader { geo in
                let width = geo.size.width
                let height = geo.size.height
                let isWidthBig = width > height
                let fitSize = isWidthBig ? height / 2 : width / 2
                
                Circle()
                    .fill(Color(buttonColor))
                    .overlay(
                        Text(title)
                            .minimumScaleFactor(0.5)
                            .font(.system(size: fitSize))
                            .frame(
                                width: fitSize,
                                height: fitSize,
                                alignment: .center)
                            .foregroundColor(textColor)
                )
            }
        }

    }
}

struct PanelView_Previews: PreviewProvider {
    static var previews: some View {
        PanelView()
    }
}
