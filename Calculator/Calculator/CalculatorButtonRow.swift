//
//  CalculatorButtonRow.swift
//  Calculator
//
//  Created by 王洪运 on 2019/8/12.
//  Copyright © 2019 com.why. All rights reserved.
//

import SwiftUI

struct CalculatorButtonRow: View {
    
    let row: [CalculatorButtonItem]

//    @Binding var brain: CalculatorBrain
//    var model: CalculatorModel
    @EnvironmentObject var model: CalculatorModel
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(row, id: \.self) { item in
                CalculatorButton(title: item.title,
                                size: item.size,
                                backgroundColor: item.backgroundColor)
                {
                    self.model.apply(item)
                }
            }
        }
    }
}

#if DEBUG
struct CalculatorButtonRow_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorButtonRow(row: [.digit(7), .digit(8), .digit(9), .op(.multiply)]).environmentObject(CalculatorModel())
    }
}
#endif
