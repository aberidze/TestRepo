//
//  CustomButtonRepresentable.swift
//  What? Where? When?
//
//  Created by Macbook Air 13 on 06.02.24.
//

import UIKit
import SwiftUI

// MARK: - UIViewRepresentable
struct CustomButtonRepresentable: UIViewRepresentable {
    
    // MARK: - Properties
    var title: String
    var backgroundColor: UIColor
    var textColor: UIColor
    var action: () -> Void
    
    
    // MARK: - Coordinator class
    class Coordinator: NSObject {
        var action: () -> Void
        
        init(action: @escaping () -> Void) {
            self.action = action
        }
        
        @objc func buttonTapped() {
            action()
        }
    }
    
    
    // MARK: - Protocol Stubs
    typealias UIViewType = CustomButton
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(action: action)
    }
    
    func makeUIView(context: Context) -> CustomButton {
        let button = CustomButton()
        button.setTitle(title, for: .normal)
        button.setColors(background: backgroundColor, text: textColor)
        button.addTarget(context.coordinator, action: #selector(context.coordinator.buttonTapped), for: .touchUpInside)
        return button
    }
    
    func updateUIView(_ uiView: CustomButton, context: Context) {
        //
    }
}
