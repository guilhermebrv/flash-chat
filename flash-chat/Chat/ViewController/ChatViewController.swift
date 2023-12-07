//
//  ChatViewController.swift
//  flash-chat
//
//  Created by Guilherme Viana on 06/12/2023.
//

import UIKit

class ChatViewController: UIViewController {

    private var screen: ChatView?
    private var viewModel: ChatViewModel = ChatViewModel()
    
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
        viewModel.delegate(delegate: self)
    }
}

extension ChatViewController: ChatViewModelProtocol {
    func signOutSuccessful() {
        let home = HomeViewController()
        navigationController?.pushViewController(home, animated: true)
    }
    func signOutFailed(error: Error) {
        print(error.localizedDescription)
    }
}

extension ChatViewController: ChatViewProtocol {
    func tappedLogoutButton() {
        viewModel.signOutUser()
    }
}
