//
//  AlertFailedLoginorRegister.swift
//  flash-chat
//
//  Created by Guilherme Viana on 07/12/2023.
//

import UIKit

class AlertFailedLoginorRegister {
    private let controller: UIViewController
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    public func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "Ok", style: .default)
        alertController.addAction(ok)
        controller.present(alertController, animated: true)
    }
}
