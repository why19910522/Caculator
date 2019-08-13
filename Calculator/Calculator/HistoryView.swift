//
//  HistoryView.swift
//  Calculator
//
//  Created by 王洪运 on 2019/8/12.
//  Copyright © 2019 com.why. All rights reserved.
//

import SwiftUI
import Combine

struct HistoryView: View {
    
    @ObservedObject var model: CalculatorModel
    @Binding var editingHistory: Bool
    
    var body: some View {
        VStack {
            if model.totalCount == 0 {
                Text("没有履历")
            } else {
                HStack {
                    Text("履历")
                        .font(.headline)
                    Text("\(model.historyDetail)")
                        .lineLimit(nil)
                }
                
                HStack {
                    Text("显示")
                        .font(.headline)
                    Text("\(model.brain.output)")
                }
                
                Slider(
                    value: $model.slidingIndex,
                    in: 0...Float(model.totalCount),
                    step: 1
                )
            }
            
            Button(action: {
                self.editingHistory = false
            }) {
                Text("关闭")
                    .font(.largeTitle)
                    .frame(width: 100, height: 100)
            }
                
        }
        .padding()
    }
}

#if DEBUG
struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView(model: CalculatorModel(), editingHistory: .constant(true))
    }
}
#endif
