//
//  CustomButton.swift
//  What? Where? When?
//
//  Created by Macbook Air 13 on 01.02.24.
//

import SwiftUI

struct CustomButton: View {
    
    // MARK: - Properties
    @State var text: String
    @State var backgroundColor: UIColor
    @State var textColor: UIColor
    
    
    // MARK: - body
    var body: some View {
        
        HStack {
            Spacer()
            
            Text(text)
                .font(Font(UIFont.ninoMtavruli?.withSize(16) ?? .systemFont(ofSize: 16)))
                .foregroundColor(Color(uiColor: textColor))
            
            Spacer()
        }
        .frame(maxWidth: 260, maxHeight: 44)
        .background(Color(uiColor: backgroundColor))
        .cornerRadius(10)
        .shadow(radius: 20)
    }
}


// MARK: - Preview
struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(text: "შემდეგი", backgroundColor: .white, textColor: .backgroundGray)
    }
}
