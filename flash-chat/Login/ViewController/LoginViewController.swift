//
//  LoginViewController.swift
//  flash-chat
//
//  Created by Guilherme Viana on 06/12/2023.
//

import UIKit

class LoginViewController: UIViewController {
    private var screen: LoginView?
    
    override func loadView() {
        screen = LoginView()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        signProtocols()
    }
    
    private func signProtocols() {
        screen?.delegate(delegate: self)
    }
}

extension LoginViewController: LoginViewProtocol {
    func tappedRegisterButton() {
        let register = RegisterViewController()
        navigationController?.pushViewController(register, animated: true)
    }
}
