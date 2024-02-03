//
//  HomeViewController.swift
//  What? Where? When?
//
//  Created by Macbook Air 13 on 02.02.24.
//

import UIKit
import SwiftUI

final class HomeViewController: UIViewController {
    
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
    
    private let mainScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 22
        return stackView
    }()
    
    private let profileLabel: UILabel = {
        let label = UILabel()
        label.text = "პროფილი"
        label.font = .ninoMtavruliBold?.withSize(24)
        label.textColor = .white
        return label
    }()
    
    private let profileStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .center
        return stackView
    }()
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        imageView.image = UIImage(named: "GamePicture")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 60
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "ანრი ბერიძე"
        label.font = .ninoMtavruli?.withSize(22)
        label.textColor = .white
        return label
    }()
    
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.text = "მოაზროვნე"
        label.font = .ninoMkhedruliBook?.withSize(16)
        label.textColor = .accentDarkGray
        return label
    }()
    
    private let resultDashboardStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .backgroundGold
        stackView.distribution = .fillEqually
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16)
        stackView.layer.cornerRadius = 12
        stackView.clipsToBounds = true
        return stackView
    }()
    
    private let gameHistoryLabel: UILabel = {
        let label = UILabel()
        label.text = "წინა თამაშები"
        label.font = .ninoMtavruli?.withSize(20)
        label.textColor = .accentDarkGray
        return label
    }()
    
    private let gameNumberResult = customResultStackView(
        score: "12",
        label: "თამაში"
    )
    
    private let gameScoreResult = customResultStackView(
        score: "21",
        label: "ქულა"
    )
    
    private let ratingsResult = customResultStackView(
        score: "#11",
        label: "რეიტინგი"
    )
    
    private let dummyView: UIView = {
        let view = UIView()
        view.setContentHuggingPriority(.defaultLow, for: .vertical)
        return view
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
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.tabBarController?.tabBar.isTranslucent = true
    }
    
    private func setupUI() {
        view.backgroundColor = .backgroundGray
        setupMainScrollView()
    }
    
    private func setupMainScrollView() {
        view.addSubview(mainScrollView)
        setMainScrollViewConstraints()
        setupMainStackView()
    }
    
    private func setupMainStackView() {
        mainScrollView.addSubview(mainStackView)
        setMainStackViewConstraints()
        setMainStackViewMargins()
        mainStackView.addArrangedSubview(profileLabel)
        setupProfileStackView()
        setupResultDashboardStackView()
        setupGameHistoryStackView()
        mainStackView.addArrangedSubview(dummyView)
    }
    
    private func setupProfileStackView() {
        mainStackView.addArrangedSubview(profileStackView)
        profileStackView.addArrangedSubview(profileImageView)
        profileStackView.addArrangedSubview(nameLabel)
        profileStackView.setCustomSpacing(2, after: nameLabel)
        profileStackView.addArrangedSubview(statusLabel)
    }
    
    private func setupResultDashboardStackView() {
        mainStackView.addArrangedSubview(resultDashboardStackView)
        resultDashboardStackView.addArrangedSubview(gameNumberResult)
        resultDashboardStackView.addArrangedSubview(gameScoreResult)
        resultDashboardStackView.addArrangedSubview(ratingsResult)
    }
    
    private func setupGameHistoryStackView() {
        mainStackView.addArrangedSubview(gameHistoryLabel)
        mainStackView.setCustomSpacing(50, after: resultDashboardStackView)
    }
    
    
    // MARK: - Constraints & Margins
    private func setMainScrollViewConstraints() {
        NSLayoutConstraint.activate([
            mainScrollView.topAnchor.constraint(equalTo: view.topAnchor),
            mainScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mainScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setMainStackViewConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: mainScrollView.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: mainScrollView.leadingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: mainScrollView.trailingAnchor),
            
            mainStackView.heightAnchor.constraint(equalTo: mainScrollView.heightAnchor),
            mainStackView.widthAnchor.constraint(equalTo: mainScrollView.widthAnchor)
        ])
    }
    
    private func setMainStackViewMargins() {
        mainStackView.isLayoutMarginsRelativeArrangement = true
        mainStackView.layoutMargins = UIEdgeInsets(top: 20, left: 16, bottom: 0, right: 16)
    }
}
