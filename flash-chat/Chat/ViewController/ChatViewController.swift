//
//  ChatViewController.swift
//  flash-chat
//
//  Created by Guilherme Viana on 06/12/2023.
//

import UIKit

class ChatViewController: UIViewController {

    private var user: String
    private var screen: ChatView?
    private var viewModel: ChatViewModel = ChatViewModel()
    
    init(user: String) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MessageCell.identifier, for: indexPath) as? MessageCell
        let message = viewModel.getMessage[indexPath.row]
        if message.sender == user {
            cell?.setupCellOut(message: message)
        } else {
            cell?.setupCellIn(message: message)
        }
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightForRowAt
    }
}

extension ChatViewController: ChatViewProtocol {
    func tappedLogoutButton() {
        viewModel.signOutUser()
    }
}
