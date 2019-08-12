//
//  CaculatorButtonRow.swift
//  Caculator
//
//  Created by 王洪运 on 2019/8/12.
//  Copyright © 2019 com.why. All rights reserved.
//

import SwiftUI

struct CaculatorButtonRow: View {
    
    let row: [CaculatorButtonItem]
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(row, id: \.self) { item in
                CaculatorButton(title: item.title,
                                size: item.size,
                                backgroundColor: item.backgroundColor)
                {
                    print("Button \(item.title)")
                }
            }
        }
    }
}

#if DEBUG
struct CaculatorButtonRow_Previews: PreviewProvider {
    static var previews: some View {
        CaculatorButtonRow(row: [.digit(7), .digit(8), .digit(9), .op(.multiply)])
    }
}
#endif
