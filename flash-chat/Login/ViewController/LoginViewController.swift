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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
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

extension LoginViewController: LoginViewModelProtocol {
    func loginSuccessful() {
        let chat = ChatViewController()
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
