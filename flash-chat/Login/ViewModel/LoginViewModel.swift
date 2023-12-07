//
//  LoginViewModel.swift
//  flash-chat
//
//  Created by Guilherme Viana on 07/12/2023.
//

import UIKit
import FirebaseAuth

protocol LoginViewModelProtocol: AnyObject {
    func loginSuccessful()
    func loginFailed(error: Error)
}

class LoginViewModel {
    
    private weak var delegate: LoginViewModelProtocol?
    public func delegate(delegate: LoginViewModelProtocol) {
        self.delegate = delegate
    }
    
    public func signInUser(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            if error == nil {
                self?.delegate?.loginSuccessful()
            } else if let error = error {
                self?.delegate?.loginFailed(error: error)
            }
        }
    }
}
