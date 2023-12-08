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
        navigationController?.isNavigationBarHidden = true
        signProtocols()
    }
    
    private func signProtocols() {
        screen?.delegate(delegate: self)
        screen?.delegateTableView(delegate: self, dataSource: self)
        viewModel.delegate(delegate: self)
    }
}

extension ChatViewController: ChatViewModelProtocol {
    func signOutSuccessful() {
        navigationController?.popToRootViewController(animated: true)
    }
    func signOutFailed(error: NSError) {
        AlertFailedLoginorRegister(controller: self).showAlert(title: "Warning", message: error.localizedDescription)
    }
}

extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Int()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension ChatViewController: ChatViewProtocol {
    func tappedLogoutButton() {
        viewModel.signOutUser()
    }
}
