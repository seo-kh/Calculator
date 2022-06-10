//
//  ContentView.swift
//  Calculator
//
//  Created by 서광현 on 2022/06/10.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES

    @State private var displayNumber = "0"
    
    //: Helper Variables
    @State var operators: Operations = .add
    @State var secondOperand: String = ""
    @State var typeSecond: Bool = false

    var formattedNumber: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 5
        formatter.maximumIntegerDigits = 9
        
        return formatter.string(from: (Double(displayNumber) ?? 0.0) as NSNumber)!
    }
    // MARK: - BODY

    var body: some View {

        VStack {
            Text(formattedNumber)
                .font(.system(size: 100, weight: .light, design: .rounded))
                .frame(maxWidth: .infinity ,maxHeight: 250, alignment: .bottomTrailing)
                .minimumScaleFactor(0.5)
                .lineLimit(1)
            //: TEXT
            
            GeometryReader { geo in
                let width = geo.size.width
                let height = geo.size.height
                let isWidthBig = width > height
                let fitSize = isWidthBig ? height / 1.065 : width / 1.065
            
                PanelView(
                    fitSize: fitSize,
                    displayNumber: $displayNumber,
                    operators: $operators,
                    secondOperand: $secondOperand,
                    typeSecond: $typeSecond
                )
            } //: GEOMETRY
        } //: VSTACK
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
