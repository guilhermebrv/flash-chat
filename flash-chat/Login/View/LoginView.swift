//
//  LoginView.swift
//  flash-chat
//
//  Created by Guilherme Viana on 06/12/2023.
//

import UIKit

protocol LoginViewProtocol: AnyObject {
    func tappedLoginButton()
    func tappedBackButton()
}

class LoginView: UIView {

    private weak var delegate: LoginViewProtocol?
    public func delegate(delegate: LoginViewProtocol?){
        self.delegate = delegate
    }
    
    lazy var bgView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBlue.withAlphaComponent(0.3)
        return view
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .plain()
        button.configuration?.image = UIImage(systemName: "chevron.backward")
        button.configuration?.baseForegroundColor = .systemBlue.withAlphaComponent(0.8)
        button.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        return button
    }()
    
    @objc public func tappedBackButton() {
        delegate?.tappedBackButton()
    }
    
    lazy var emailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "textfield")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        let attributedString = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray.withAlphaComponent(0.5)])
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.attributedPlaceholder = attributedString
        textField.textColor = .black
        textField.tintColor = .black
        textField.autocapitalizationType = .none
        textField.contentMode = .scaleAspectFill
        textField.font = .systemFont(ofSize: 22, weight: .regular)
        textField.textAlignment = .center
        textField.keyboardType = .emailAddress
        return textField
    }()
    
    lazy var passwordImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "textfield")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        let attributedString = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray.withAlphaComponent(0.5)])
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.attributedPlaceholder = attributedString
        textField.textColor = .black
        textField.tintColor = .black
        textField.autocapitalizationType = .none
        textField.font = .systemFont(ofSize: 22, weight: .regular)
        textField.textAlignment = .center
        textField.isSecureTextEntry = true
        textField.textContentType = .oneTimeCode
        return textField
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .plain()
        button.configuration?.baseForegroundColor = .systemBlue
        button.configuration?.attributedTitle = AttributedString("Login", attributes: AttributeContainer([NSAttributedString.Key.font :UIFont.systemFont(ofSize: 20, weight: .regular)]))
        button.configuration?.baseForegroundColor = .systemBlue.withAlphaComponent(0.8)
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
        addSubview(bgView)
        bgView.addSubview(backButton)
        bgView.addSubview(emailImageView)
        bgView.addSubview(emailTextField)
        bgView.addSubview(passwordImageView)
        bgView.addSubview(passwordTextField)
        bgView.addSubview(loginButton)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            bgView.topAnchor.constraint(equalTo: topAnchor),
            bgView.bottomAnchor.constraint(equalTo: bottomAnchor),
            bgView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bgView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            emailImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
            emailImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            emailImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            emailImageView.heightAnchor.constraint(equalToConstant: 70),
            
            emailTextField.topAnchor.constraint(equalTo: emailImageView.topAnchor, constant: -15),
            emailTextField.leadingAnchor.constraint(equalTo: emailImageView.leadingAnchor, constant: 35),
            emailTextField.trailingAnchor.constraint(equalTo: emailImageView.trailingAnchor, constant: -35),
            emailTextField.heightAnchor.constraint(equalToConstant: 70),
            
            passwordImageView.topAnchor.constraint(equalTo: emailImageView.bottomAnchor, constant: -5),
            passwordImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            passwordImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            passwordImageView.heightAnchor.constraint(equalToConstant: 70),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordImageView.topAnchor, constant: -15),
            passwordTextField.leadingAnchor.constraint(equalTo: passwordImageView.leadingAnchor, constant: 35),
            passwordTextField.trailingAnchor.constraint(equalTo: passwordImageView.trailingAnchor, constant: -35),
            passwordTextField.heightAnchor.constraint(equalToConstant: 70),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 5),
            loginButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
