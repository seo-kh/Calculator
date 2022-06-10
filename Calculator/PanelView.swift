//
//  PanelView.swift
//  Calculator
//
//  Created by 서광현 on 2022/06/10.
//

import SwiftUI

struct PanelView: View {
    var body: some View {
        GeometryReader { geo in
            let width = geo.size.width
            let height = geo.size.height
            let isWidthBig = width > height
            let fitSize = isWidthBig ? height / 1.065 : width / 1.065
            
            VStack {
                HStack {
                    CustomButtonView(
                        title: "C",
                        buttonType: .function1,
                        fitSize: fitSize
                    )
                    
                    CustomButtonView(
                        title: "+/-",
                        buttonType: .function1,
                        fitSize: fitSize
                    )
                    
                    CustomButtonView(
                        title: "%",
                        buttonType: .function1,
                        fitSize: fitSize
                    )
                    
                    CustomButtonView(
                        title: "%",
                        buttonType: .function2,
                        fitSize: fitSize
                    )
                } //: 1st HSTACK
                HStack {
                    CustomButtonView(
                        title: "7",
                        buttonType: .number,
                        fitSize: fitSize
                    )
                    
                    CustomButtonView(
                        title: "8",
                        buttonType: .number,
                        fitSize: fitSize
                    )
                    
                    CustomButtonView(
                        title: "9",
                        buttonType: .number,
                        fitSize: fitSize
                    )
                    
                    CustomButtonView(
                        title: "X",
                        buttonType: .function2,
                        fitSize: fitSize
                    )
                } //: 2nd HSTACK
                HStack {
                    CustomButtonView(
                        title: "4",
                        buttonType: .number,
                        fitSize: fitSize
                    )
                    
                    CustomButtonView(
                        title: "5",
                        buttonType: .number,
                        fitSize: fitSize
                    )
                    
                    CustomButtonView(
                        title: "6",
                        buttonType: .number,
                        fitSize: fitSize
                    )
                    
                    CustomButtonView(
                        title: "-",
                        buttonType: .function2,
                        fitSize: fitSize
                    )
                } //: 3rd HSTACK
                HStack {
                    CustomButtonView(
                        title: "1",
                        buttonType: .number,
                        fitSize: fitSize
                    )
                    
                    CustomButtonView(
                        title: "2",
                        buttonType: .number,
                        fitSize: fitSize
                    )
                    
                    CustomButtonView(
                        title: "3",
                        buttonType: .number,
                        fitSize: fitSize
                    )
                    
                    CustomButtonView(
                        title: "+",
                        buttonType: .function2,
                        fitSize: fitSize
                    )
                } //: 4th HSTACK
                HStack {
                    CustomButtonView(
                        title: "0",
                        buttonType: .number,
                        fitSize: fitSize,
                        isZeroButton: true
                    )
                    
                    CustomButtonView(
                        title: ".",
                        buttonType: .number,
                        fitSize: fitSize
                    )
                    
                    CustomButtonView(
                        title: "=",
                        buttonType: .function2,
                        fitSize: fitSize
                    )
                } //: 5th HSTACK
            } //: VSTACK
        } //: GEOMETRY
        .frame(width: .infinity, height: .infinity, alignment: .center)
    }
}


struct PanelView_Previews: PreviewProvider {
    static var previews: some View {
        PanelView()
    }
}
