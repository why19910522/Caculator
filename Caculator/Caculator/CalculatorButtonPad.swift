//
//  CalculatorButtonPad.swift
//  Caculator
//
//  Created by 王洪运 on 2019/8/12.
//  Copyright © 2019 com.why. All rights reserved.
//

import SwiftUI

struct CalculatorButtonPad: View {
    
    let pad: [[CaculatorButtonItem]] = [
        [.command(.clear), .command(.flip), .command(.persent), .op(.divide)],
        [.digit(7), .digit(8), .digit(9), .op(.multiply)],
        [.digit(4), .digit(5), .digit(6), .op(.minus)],
        [.digit(1), .digit(2), .digit(3), .op(.plus)],
        [.digit(0), .dot, .op(.equal)]
    ]
    
    var body: some View {
        VStack(spacing: 8) {
            ForEach(pad, id: \.self) { row in
                CaculatorButtonRow(row: row)
            }
        }
    }
}

#if DEBUG
struct CalculatorButtonPad_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorButtonPad()
    }
}
#endif
