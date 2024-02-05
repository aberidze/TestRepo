//
//  CustomButtonn.swift
//  What? Where? When?
//
//  Created by Macbook Air 13 on 05.02.24.
//

import UIKit

final class CustomButtonn: UIButton {
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Private Methods
    private func setupButton() {
        setupButtonDesign()
        setConstraints()
    }
    
    private func setupButtonDesign() {
        titleLabel?.font = .ninoMtavruli?.withSize(16)
        layer.cornerRadius = 10
        clipsToBounds = true
    }
    
    func setColors(background bckgColor: UIColor, text textColor: UIColor) {
        backgroundColor = bckgColor
        setTitleColor(textColor, for: .normal)
    }
    
    private func setConstraints() {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
}
