//
//  RegisterViewModel.swift
//  flash-chat
//
//  Created by Guilherme Viana on 07/12/2023.
//

import UIKit
import FirebaseAuth

protocol RegisterViewModelProtocol: AnyObject {
    func registerSuccessful()
    func registerFailed(error: Error)
}

class RegisterViewModel {
    
    private weak var delegate: RegisterViewModelProtocol?
    public func delegate(delegate: RegisterViewModelProtocol) {
        self.delegate = delegate
    }
    
    public func createUser(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if error == nil {
                self.delegate?.registerSuccessful()
            } else if let error = error {
                self.delegate?.registerFailed(error: error)
            }
        }
    }
}
