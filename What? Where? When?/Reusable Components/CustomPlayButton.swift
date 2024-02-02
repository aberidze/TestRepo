//
//  CustomPlayButton.swift
//  What? Where? When?
//
//  Created by Macbook Air 13 on 02.02.24.
//

import UIKit

final class CustomPlayButton: UIView {

    // MARK: - Properties
    private let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "GamePicture")
        return imageView
    }()
    
    private let displayStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .backgroundGold
        return stackView
    }()
    
    private let titleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 4
        return stackView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "რა? სად? როდის?"
        label.font = .ninoMtavruliBold?.withSize(18)
        label.textColor = .black
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "სრული თამაში"
        label.font = .ninoMkhedruliBook?.withSize(16)
        label.textColor = .black
        return label
    }()
    
    private let playIconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "play.circle")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .black
        imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor).isActive = true
        return imageView
    }()
    
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Private Methods
    private func setupUI() {
        addSubview(mainImageView)
        setMainImageViewConstraints()
        addSubview(displayStackView)
        setTitleStackViewConstraints()
        setTitleStackViewMargins()
        displayStackView.addArrangedSubview(titleStackView)
        titleStackView.addArrangedSubview(titleLabel)
        titleStackView.addArrangedSubview(subtitleLabel)
        displayStackView.addArrangedSubview(playIconImage)
    }
    
    
    // MARK: - Constraints and Margins
    private func setMainImageViewConstraints() {
        NSLayoutConstraint.activate([
            mainImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainImageView.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    private func setTitleStackViewConstraints() {
        NSLayoutConstraint.activate([
            displayStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            displayStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            displayStackView.bottomAnchor.constraint(equalTo: mainImageView.bottomAnchor),
            displayStackView.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
    
    private func setTitleStackViewMargins() {
        displayStackView.isLayoutMarginsRelativeArrangement = true
        displayStackView.layoutMargins = UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 16)
    }
}
