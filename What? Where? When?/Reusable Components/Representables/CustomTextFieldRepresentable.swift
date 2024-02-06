//
//  CustomTextFieldRepresentable.swift
//  What? Where? When?
//
//  Created by Macbook Air 13 on 06.02.24.
//

import UIKit
import SwiftUI

// MARK: - UIViewRepresentable
struct CustomTextViewRepresentable: UIViewRepresentable {
    
    // MARK: - Properties
    var placeholder: String
    var borderColor: UIColor
    var icon: String
    var isPassword: Bool?
    @Binding var text: String
    var onCommit: (String) -> Void
    
    
    // MARK: - Coordinator class
    class Coordinator: NSObject, UITextFieldDelegate {
        var parent: CustomTextViewRepresentable
        var onCommit: (String) -> Void
        
        init(parent: CustomTextViewRepresentable, onCommit: @escaping (String) -> Void) {
            self.parent = parent
            self.onCommit = onCommit
        }
        
        func textFieldDidChangeSelection(_ textField: UITextField) {
            parent.$text.wrappedValue = textField.text ?? ""
        }
        
        func textFieldDidEndEditing(_ textField: UITextField) {
            onCommit(textField.text ?? "")
        }
    }
    
    
    // MARK: - Protocol Stubs
    typealias UIViewType = CustomTextField
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self, onCommit: onCommit)
    }
    
    func makeUIView(context: Context) -> CustomTextField {
        let textField = CustomTextField(placeholder: placeholder, borderColor: borderColor, icon: icon, isPassword: isPassword)
        textField.delegate = context.coordinator
        return textField
    }
    
    func updateUIView(_ uiView: CustomTextField, context: Context) {
        uiView.text = text
    }
}
