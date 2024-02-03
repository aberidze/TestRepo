//
//  PlayViewController.swift
//  What? Where? When?
//
//  Created by Macbook Air 13 on 02.02.24.
//

import UIKit

final class PlayViewController: UIViewController {
    
    // MARK: - Properties
    private let customLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 30
        return stackView
    }()
    
    private let titleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        return stackView
    }()
    
    private let startGameLabel: UILabel = {
        let label = UILabel()
        label.text = "დაიწყე თამაში"
        label.font = .ninoMtavruli?.withSize(26)
        label.textColor = .white
        return label
    }()
    
    private let sublabel: UILabel = {
        let label = UILabel()
        label.text = "დააგროვე ქულები და გახდი საუკეთესო რეიტინგში!"
        label.font = .ninoMkhedruliBook?.withSize(16)
        label.textColor = .accentDarkGray
        return label
    }()
    
    private let playButton: CustomPlayButton = {
        let button = CustomPlayButton()
        return button
    }()
    
    
    // MARK: - View Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupUI()
    }
    
    
    // MARK: - Private Methods
    private func setupNavigationBar() {
        self.navigationItem.titleView = customLogo
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .plain, target: nil, action: nil)
    }
    
    private func setupUI() {
        view.backgroundColor = .backgroundGray
        view.addSubview(mainStackView)
        setMainStackViewConstraints()
        setMainStackViewMargins()
        mainStackView.addArrangedSubview(titleStackView)
        titleStackView.addArrangedSubview(startGameLabel)
        titleStackView.addArrangedSubview(sublabel)
        mainStackView.addArrangedSubview(playButton)
    }
    
    
    // MARK: - Constraints
    private func setMainStackViewConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setMainStackViewMargins() {
        mainStackView.isLayoutMarginsRelativeArrangement = true
        mainStackView.layoutMargins = UIEdgeInsets(top: 20, left: 16, bottom: 0, right: 16)
    }
}
