//
//  ContentView.swift
//  Calculator
//
//  Created by 王洪运 on 2019/8/12.
//  Copyright © 2019 com.why. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
    
//    @State var brain: CalculatorBrain = .left("0")
//    @ObservedObject var model = CalculatorModel()
    @EnvironmentObject var model: CalculatorModel
    
    @State var editingHistory = false
    @State var showResult = false
    
    var body: some View {
        VStack(spacing: 12) {
            Spacer()
            
            Button(action: {
                self.editingHistory = true
            }) {
                Text("操作履历: \(model.history.count)")
            }
            .sheet(isPresented: self.$editingHistory) {
                HistoryView(model: self.model,
                            editingHistory: self.$editingHistory)
            }
            
            Text(model.brain.output)
                .font(.system(size: 76))
                .minimumScaleFactor(0.5)
                .lineLimit(1)
                .foregroundColor(.black)
                .padding(.horizontal, 24)
                .frame(minWidth: 0, maxWidth: .infinity,
                       alignment: .trailing)
                .onTapGesture {
                    self.showResult = true
                }
                .alert(isPresented: $showResult) {
                    return Alert(title: Text(model.equation),
                                 primaryButton: .default(Text("复制"), action: {
                                    UIPasteboard.general.string = self.model.equation
                                 }),
                                 secondaryButton: .cancel())
                }
            
            CalculatorButtonPad()
                .padding(.bottom)
        }
    }
    
    
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(CalculatorModel())
            .environment(\.colorScheme, .dark)
//            .previewDevice("iPhone SE")
//            .previewDevice("iPad Air 2")
    }
}
#endif
