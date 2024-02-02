//
//  CustomTextField.swift
//  What? Where? When?
//
//  Created by Macbook Air 13 on 02.02.24.
//

import SwiftUI

struct CustomTextField: View {
    
    // MARK: - Properties
    @State var color: UIColor
    @State var title: String
    @State var text: String
    @State var optionalIconName: String?
    
    
    // MARK: - body
    var body: some View {
        HStack(spacing: 10) {
            textfield
            optionalRightIcon
        }
        .frame(height: 50)
        .padding(.horizontal, 10)
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color(uiColor: color), lineWidth: 1)
        }
    }
    
    
    // MARK: - Private Views
    private var textfield: some View {
        TextField(title, text: $text)
            .font(Font(UIFont.ninoMkhedruliBook?.withSize(20) ?? .systemFont(ofSize: 20)))
            .foregroundColor(Color(uiColor: .accentDarkGray))
    }

    private var optionalRightIcon: some View {
        Image(systemName: optionalIconName ?? "")
            .resizable()
            .scaledToFit()
            .frame(width: 24, height: 24)
            .foregroundColor(Color(uiColor: color))
    }
}


// MARK: - Preview
struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        let text = ""
        CustomTextField(color: .accentGold, title: "eye.slash.fill", text: "მეილი", optionalIconName: "eye.slash.fill")
    }
}
