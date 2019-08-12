//
//  CaculatorButton.swift
//  Caculator
//
//  Created by 王洪运 on 2019/8/12.
//  Copyright © 2019 com.why. All rights reserved.
//

import SwiftUI

struct CaculatorButton: View {
    
    let title: String
    var size: CGSize = CGSize(width: 88, height: 88)
    let backgroundColor: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Text(title)
                    .font(.system(size: 38))
                    .foregroundColor(.white)
                    .frame(width: size.height, height: size.height)
                
                if title == "0" {                
                    Spacer()
                }
            }
        }
        .frame(width: size.width, height: size.height)
        .background(backgroundColor)
        .cornerRadius(size.height / 2)
    }
}

#if DEBUG
struct CaculatorButton_Previews: PreviewProvider {
    static var previews: some View {
        CaculatorButton(title: "0", size: CGSize(width: 174, height: 88), backgroundColor: Color.operatorBackground, action: {})
    }
}
#endif
