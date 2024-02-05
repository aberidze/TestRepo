//
//  SignUpViewController.swift
//  What? Where? When?
//
//  Created by Macbook Air 13 on 31.01.24.
//

import UIKit
import SwiftUI

final class SignUpViewController: UIViewController {
    
    // MARK: - Properties
    private let mainScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 40
        return stackView
    }()
    
    private let titleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 6
        return stackView
    }()
    
    private let mainTitle: UILabel = {
        let label = UILabel()
        label.text = "ელიტარული ინტელექტ კლუბი"
        label.font = .ninoMtavruli?.withSize(26)
        label.textColor = .backgroundGold
        label.numberOfLines = 0
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "შეავსე სარეგისტრაციო ფორმა და გახდი ელიტარული ინტელექტ კლუბის \"რა? სად? როდის?\" წევრი."
        label.font = .ninoMkhedruliBook?.withSize(18)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    private let textFieldsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 12
        return stackView
    }()
    
    private let fullNameTextField = CustomTextField(placeholder: "სახელი, გვარი", borderColor: .accentLightGray, icon: "person.fill", isPassword: false)
    
    private let mailTextField = CustomTextField(placeholder: "მეილი", borderColor: .accentLightGray, icon: "envelope.fill", isPassword: false)
    
    private let birthdateTextField = CustomTextField(placeholder: "დაბადების თარიღი", borderColor: .accentLightGray, icon: "calendar", isPassword: false)
    
    private let passwordsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 12
        return stackView
    }()
    
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "დაიცავი პაროლთან დაკავშირებული მოთხოვნები."
        label.font = .ninoMkhedruliBook?.withSize(18)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    private let passwordTextField = CustomTextField(placeholder: "პაროლი", borderColor: .accentLightGray, icon: "lock.fill", isPassword: true)
    
    private let confirmPasswordTextField = CustomTextField(placeholder: "გაიმეორე პაროლი", borderColor: .accentLightGray, icon: "lock.fill", isPassword: true)
    
    private let signUpButtonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .backgroundGray
        stackView.layer.shadowColor = UIColor.black.cgColor
        stackView.layer.shadowRadius = 10
        stackView.layer.shadowOpacity = 0.2
        stackView.layer.shadowOffset = CGSize(width: 0, height: -10)
        return stackView
    }()
    
    private let signUpButton: CustomButtonn = {
        let button = CustomButtonn()
        button.setTitle("რეგისტრაცია", for: .normal)
        button.setColors(background: .white, text: .backgroundGray)
        return button
    }()
    
    private let dummyView: UIView = {
        let view = UIView()
        view.setContentHuggingPriority(.defaultLow, for: .vertical)
        return view
    }()
    
    
    // MARK: - View Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    // MARK: - Private Methods
    private func setupUI() {
        view.backgroundColor = .backgroundGray
        setupMainScrollView()
        setupSignUpButtonStackView()
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
        setupTitleStackView()
        setupTextFieldsStackView()
        setupPasswordsStackView()
        mainStackView.addArrangedSubview(dummyView)
    }
    
    private func setupTitleStackView() {
        mainStackView.addArrangedSubview(titleStackView)
        titleStackView.addArrangedSubview(mainTitle)
        titleStackView.addArrangedSubview(subtitleLabel)
    }
    
    private func setupTextFieldsStackView() {
        mainStackView.addArrangedSubview(textFieldsStackView)
        textFieldsStackView.addArrangedSubview(fullNameTextField)
        textFieldsStackView.addArrangedSubview(mailTextField)
        textFieldsStackView.addArrangedSubview(birthdateTextField)
    }
    
    private func setupPasswordsStackView() {
        mainStackView.addArrangedSubview(passwordsStackView)
        passwordsStackView.addArrangedSubview(passwordLabel)
        passwordsStackView.addArrangedSubview(passwordTextField)
        passwordsStackView.addArrangedSubview(confirmPasswordTextField)
    }
    
    private func setupSignUpButtonStackView() {
        view.addSubview(signUpButtonStackView)
        setSignUpButtonStackViewConstraints()
        setSignUpButtonStackViewMargins()
        signUpButtonStackView.addArrangedSubview(signUpButton)
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
    
    private func setSignUpButtonStackViewConstraints() {
        NSLayoutConstraint.activate([
            signUpButtonStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            signUpButtonStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            signUpButtonStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setSignUpButtonStackViewMargins() {
        signUpButtonStackView.isLayoutMarginsRelativeArrangement = true
        signUpButtonStackView.layoutMargins = UIEdgeInsets(top: 20, left: 40, bottom: 20, right: 40)
    }
}

// MARK: - UIViewControllerRepresentable
struct SignUpViewControllerRepresentable: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = SignUpViewController
    
    func makeUIViewController(context: Context) -> SignUpViewController {
        return SignUpViewController()
    }
    
    func updateUIViewController(_ uiViewController: SignUpViewController, context: Context) {
        //
    }
}
