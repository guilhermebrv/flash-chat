//
//  HomeView.swift
//  flash-chat
//
//  Created by Guilherme Viana on 06/12/2023.
//

protocol HomeViewProtocol: AnyObject {
    func tappedRegisterButton()
    func tappedLoginButton()
}

import UIKit

class HomeView: UIView {

    private weak var delegate: HomeViewProtocol?
    public func delegate(delegate: HomeViewProtocol?){
        self.delegate = delegate
    }
    
    lazy var logoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "⚡️FlashChat"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 40, weight: .bold)
        label.textColor = .systemBlue
        return label
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .tinted()
        button.configuration?.attributedTitle = AttributedString("Register", attributes: AttributeContainer([NSAttributedString.Key.font :UIFont.systemFont(ofSize: 25, weight: .regular)]))
        button.configuration?.baseBackgroundColor = .systemBlue.withAlphaComponent(0.3)
        button.configuration?.baseForegroundColor = .systemBlue.withAlphaComponent(0.8)
        button.addTarget(self, action: #selector(tappedRegisterButton), for: .touchUpInside)
        return button
    }()
    
    @objc public func tappedRegisterButton() {
        delegate?.tappedRegisterButton()
    }
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .tinted()
        button.configuration?.attributedTitle = AttributedString("Log in", attributes: AttributeContainer([NSAttributedString.Key.font :UIFont.systemFont(ofSize: 25, weight: .regular)]))
        button.configuration?.baseBackgroundColor = .systemBlue
        button.configuration?.baseForegroundColor = .white
        button.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)
        return button
    }()
    
    @objc public func tappedLoginButton() {
        delegate?.tappedLoginButton()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        addSubview(logoLabel)
        addSubview(registerButton)
        addSubview(loginButton)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            logoLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            logoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            logoLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            
            registerButton.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -15),
            registerButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            registerButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            loginButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            loginButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            loginButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
        ])
    }
}

