//
//  LoginViewController.swift
//  flash-chat
//
//  Created by Guilherme Viana on 06/12/2023.
//

import UIKit

class LoginViewController: UIViewController {
    private var screen: LoginView?
    private var viewModel: LoginViewModel = LoginViewModel()
    
    override func loadView() {
        screen = LoginView()
        view = screen
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signProtocols()
        skipLogin()
    }
    
    private func signProtocols() {
        screen?.delegate(delegate: self)
        viewModel.delegate(delegate: self)
    }
    
    // FIXME: delete
    private func skipLogin() {
        screen?.emailTextField.text = "testing@gmail.com"
        screen?.passwordTextField.text = "123456"
        tappedLoginButton()
    }
}

extension LoginViewController {
    private func setupNavigationBar() {
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.tintColor = .white
        navigationItem.title = "⚡️FlashChat"
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .systemPurple.withAlphaComponent(0.6)
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white,
                                          NSAttributedString.Key.font : UIFont.systemFont(ofSize: 22, weight: .bold)]
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
    }
}

extension LoginViewController: LoginViewModelProtocol {
    func loginSuccessful(user: String) {
        let chat = ChatViewController(user: user)
        navigationController?.pushViewController(chat, animated: true)
    }
    
    func loginFailed(error: Error) {
        AlertFailedLoginorRegister(controller: self).showAlert(title: "Warning", message: error.localizedDescription)
    }
}

extension LoginViewController: LoginViewProtocol {
    func tappedBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    func tappedLoginButton() {
        if let email = screen?.emailTextField.text, let password = screen?.passwordTextField.text {
            viewModel.signInUser(email: email, password: password)
        }
    }
}
