//
//  RegisterViewController.swift
//  flash-chat
//
//  Created by Guilherme Viana on 06/12/2023.
//

import UIKit

class RegisterViewController: UIViewController {
    private var screen: RegisterView?
    private var viewModel: RegisterViewModel = RegisterViewModel()
    
    override func loadView() {
        screen = RegisterView()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        signProtocols()
    }
    
    private func signProtocols() {
        screen?.delegate(delegate: self)
        viewModel.delegate(delegate: self)
    }
}

extension RegisterViewController: RegisterViewModelProtocol {
    func registerSuccessful(user: String) {
        let chat = ChatViewController(user: user)
        navigationController?.pushViewController(chat, animated: true)
    }
    
    func registerFailed(error: Error) {
        AlertFailedLoginorRegister(controller: self).showAlert(title: "Warning", message: error.localizedDescription)
    }
}

extension RegisterViewController: RegisterViewProtocol {
    func tappedBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    func tappedRegisterButton() {
        if let email = screen?.emailTextField.text, let password = screen?.passwordTextField.text {
            viewModel.createUser(email: email, password: password)
        }
        /*
        let login = LoginViewController()
        navigationController?.pushViewController(login, animated: true)
         */
    }
    
    
}
