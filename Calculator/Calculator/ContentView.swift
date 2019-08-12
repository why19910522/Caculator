//
//  ContentView.swift
//  Calculator
//
//  Created by 王洪运 on 2019/8/12.
//  Copyright © 2019 com.why. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var inputString = "0"
    
    var body: some View {
        VStack(spacing: 12) {
            Spacer()
            
            Text(inputString)
                .font(.system(size: 76))
                .minimumScaleFactor(0.5)
                .lineLimit(1)
                .foregroundColor(.black)
                .padding(.horizontal, 24)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
            
            CalculatorButtonPad()
                .padding(.bottom)
        }
//        .frame(minHeight: 0, maxHeight: .infinity, alignment: .bottom)
    }
    
    func input(_ value: Int) {
        if inputString == "0" {
            inputString = "\(value)"
        } else {
            inputString += "\(value)"
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.colorScheme, .dark)
//            .previewDevice("iPhone SE")
            .previewDevice("iPad Air 2")
    }
}
#endif
