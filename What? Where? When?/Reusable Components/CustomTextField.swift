//
//  CustomTextFieldd.swift
//  What? Where? When?
//
//  Created by Macbook Air 13 on 05.02.24.
//

import UIKit

final class CustomTextField: UITextField {
        
    // MARK: - Initializers
    init(placeholder: String, borderColor: UIColor, icon: String, isPassword: Bool) {
        super.init(frame: .zero)
        setupTextField(placeholder: placeholder, borderColor: borderColor, icon: icon, isPassword: isPassword)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Private Methods
    private func setupTextField(placeholder: String, borderColor: UIColor, icon: String, isPassword: Bool) {
        setupTextSettings(placeholder: placeholder, isPassword: isPassword)
        setupBorders(borderColor: borderColor)
        setupLeftAndRightViews(borderColor: borderColor, icon: icon)
        setupConstraints()
    }
    
    private func setupTextSettings(placeholder: String, isPassword: Bool) {
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.accentDarkGray])
        font = .ninoMkhedruliBook?.withSize(18)
        textColor = .backgroundGold
        isSecureTextEntry = isPassword
    }
    
    private func setupBorders(borderColor: UIColor) {
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 8
    }
    
    private func setupLeftAndRightViews(borderColor: UIColor, icon: String) {
        let width = (icon != "") ? 36 : 8
        let leftOuterView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 20))
        let leftIconView = UIImageView(frame: CGRect(x: 8, y: 0, width: 20, height: 20))
        leftIconView.contentMode = .scaleAspectFit
        leftIconView.tintColor = borderColor
        leftIconView.image = UIImage(systemName: icon)
        leftOuterView.addSubview(leftIconView)
        leftView = leftOuterView
        leftViewMode = .always
        
        rightView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: frame.height))
        rightViewMode = .always
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: self.leadingAnchor),
            trailingAnchor.constraint(equalTo: self.trailingAnchor),
            heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}
