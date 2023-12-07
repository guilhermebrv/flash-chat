//
//  ChatViewController.swift
//  flash-chat
//
//  Created by Guilherme Viana on 06/12/2023.
//

import UIKit

class ChatViewController: UIViewController {

    private var screen: ChatView?
    
    override func loadView() {
        screen = ChatView()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signProtocols()
    }
    
    private func signProtocols() {
        screen?.delegate(delegate: self)
    }

}

extension ChatViewController: ChatViewProtocol {
    func tappedLogoutButton() {
        let home = HomeViewController()
        navigationController?.pushViewController(home, animated: true)
    }
    
    
}
