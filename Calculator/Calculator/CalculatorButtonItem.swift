//
//  CalculatorButtonItem.swift
//  Calculator
//
//  Created by 王洪运 on 2019/8/12.
//  Copyright © 2019 com.why. All rights reserved.
//

import SwiftUI

enum CalculatorButtonItem: Hashable {
    
    enum Op: String {
        case plus = "+"
        case minus = "-"
        case divide = "÷"
        case multiply = "×"
        case equal = "="
    }
    
    enum Command: String {
        case clear = "AC"
        case flip = "+/-"
        case persent = "%"
    }
    
    case digit(Int)
    case dot
    case op(Op)
    case command(Command)
    
}

extension CalculatorButtonItem {
    
    var title: String {
        switch self {
        case .digit(let value): return "\(value)"
        case .dot: return "."
        case .op(let op): return op.rawValue
        case .command(let command): return command.rawValue
        }
    }
    
    var size: CGSize {
        var wh = CGFloat(Int((screenW - 10 * 2 - 8 * 3) / 4))
        if wh > 88 { wh = 88 }
        if case .digit(let value) = self, value == 0 {
            return CGSize(width: wh * 2 + 8, height: wh)
        }
        return CGSize(width: wh, height: wh)
    }
    
    var backgroundColor: Color {
        switch self {
        case .digit, .dot: return .digitBackground
        case .op: return .operatorBackground
        case .command: return .commandBG
        }
    }
    
}
