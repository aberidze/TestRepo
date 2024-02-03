//
//  CustomRatingCell.swift
//  What? Where? When?
//
//  Created by Macbook Air 13 on 03.02.24.
//

import UIKit

class CustomRatingCell: UITableViewCell {

    // MARK: - Properties
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.spacing = 15
        return stackView
    }()
    
    private let userProfileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 40
        return imageView
    }()

    private let ratingDataStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 2
        return stackView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .ninoMtavruli?.withSize(20)
        label.textColor = .white
        return label
    }()
    
    private let scoreLabel: UILabel = {
        let label = UILabel()
        label.font = .ninoMtavruli?.withSize(14)
        label.textColor = .accentDarkGray
        return label
    }()
    
    private let gameNumberLabel: UILabel = {
        let label = UILabel()
        label.font = .ninoMtavruli?.withSize(14)
        label.textColor = .accentDarkGray
        return label
    }()
    
    
    // MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupMainStackView()
        fillMainStackView()
        fillRatingStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Configure
    func configure(rating: Rating) {
        userProfileImageView.image = UIImage(named: rating.imageName)
        nameLabel.text = "#\(rating.rating) \(rating.name)"
        scoreLabel.text = "ქულა: \(rating.score)"
        gameNumberLabel.text = "თამაში: \(rating.gameNumber)"
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        selectionStyle = .none
        
        userProfileImageView.image = nil
        nameLabel.text = nil
        scoreLabel.text = nil
        gameNumberLabel.text = nil
    }
    
    
    // MARK: - Private Methods
    private func setupMainStackView() {
        addSubview(mainStackView)
        setMainStackViewConstraints()
        setMainStackViewMargins()
    }
    
    private func fillMainStackView() {
        mainStackView.addArrangedSubview(userProfileImageView)
        mainStackView.addArrangedSubview(ratingDataStackView)
    }

    private func fillRatingStackView() {
        ratingDataStackView.addArrangedSubview(nameLabel)
        ratingDataStackView.addArrangedSubview(scoreLabel)
        ratingDataStackView.addArrangedSubview(gameNumberLabel)
    }
    
    
    // MARK: - Constraints & Margins
    private func setMainStackViewConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: self.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    private func setMainStackViewMargins() {
        mainStackView.isLayoutMarginsRelativeArrangement = true
        mainStackView.layoutMargins = UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16)
    }
}
