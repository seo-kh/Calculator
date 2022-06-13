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
    // MARK: - BODY

    var body: some View {

        VStack {
            Text(displayNumber)
                .font(.system(size: 100, weight: .light, design: .rounded))
                .frame(maxWidth: .infinity ,maxHeight: 250, alignment: .bottomTrailing)
                .minimumScaleFactor(0.5)
                .lineLimit(1)
                .padding()
            //: TEXT
            
            GeometryReader { geo in
                let width = geo.size.width
                let height = geo.size.height
                let isWidthBig = width > height
                let fitSize = isWidthBig ? height / 1.065 : width / 1.065
            
                PanelView(
                    fitSize: fitSize,
                    displayNumber: $displayNumber
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
