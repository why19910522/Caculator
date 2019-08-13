//
//  CalculatorModel.swift
//  Calculator
//
//  Created by 王洪运 on 2019/8/12.
//  Copyright © 2019 com.why. All rights reserved.
//

import SwiftUI
import Combine



class CalculatorModel: ObservableObject {
    
    var objectWillChange = PassthroughSubject<Void, Never>()
    
    @Published var brain: CalculatorBrain = .left("0")
    
    @Published var history = [CalculatorButtonItem]()
    
    var equation: String {
        
        
        
        let equation = Array(history.split(whereSeparator: {
            switch $0 {
            case .command(let command):
                return command == .clear
            default:
                return false
            }
        }).last ?? [])
        
        return equation.compactMap { (item) -> CalculatorButtonItem? in
            switch item {
            case .command(let command):
                return command == .clear ? nil : item
            case .op(let op):
                return op == .equal ? nil : item
            default:
                return item
            }
        }.map({$0.description}).joined() + "=\(brain.output)"
    }
    
    var historyDetail: String {
        history.map({$0.description}).joined()
    }
    
    var temporaryKept = [CalculatorButtonItem]()
    
    var totalCount: Int { history.count + temporaryKept.count }
    
    var slidingIndex: Float = 0 {
        didSet {
            keepHistory(upTo: Int(slidingIndex))
        }
    }
    
    func apply(_ item: CalculatorButtonItem) {
        brain = brain.apply(item: item)
        history.append(item)
        
        temporaryKept.removeAll()
        slidingIndex = Float(totalCount)
    }
    
    func keepHistory(upTo index: Int) {
        precondition(index <= totalCount, "Out of index.")
        
        let total = history + temporaryKept
        
        history = Array(total[..<index])
        temporaryKept = Array(total[index...])
        brain = history.reduce(CalculatorBrain.left("0"), { $0.apply(item: $1) })
    }
    
}
