//
//  ChatViewController.swift
//  flash-chat
//
//  Created by Guilherme Viana on 06/12/2023.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ChatViewController: UIViewController {

    private var user: String
    private var database = Firestore.firestore()
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadMessages()
        signProtocols()
    }
}

extension ChatViewController {
    private func signProtocols() {
        screen?.messageTextField.delegate = self
        screen?.delegate(delegate: self)
        screen?.delegateTableView(delegate: self, dataSource: self)
        viewModel.delegate(delegate: self)
    }
    private func loadMessages() {
        viewModel.getMessageData(from: database)
        viewModel.messagesUpdated = { [weak self] in
            DispatchQueue.main.async {
                self?.screen?.chatTableView.reloadData()
                self?.screen?.chatTableView.scrollToBottom(animated: false)
            }
        }
    }
    private func setupNavigationBar() {
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.tintColor = .white
        navigationItem.hidesBackButton = true
        navigationItem.title = "⚡️FlashChat"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "rectangle.portrait.and.arrow.right"), style: .plain, target: self, action: #selector(tappedLogoutButton))
    }
    @objc private func tappedLogoutButton() {
        viewModel.signOutUser()
    }
}

extension ChatViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
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
        let message = viewModel.getMessage[indexPath.row]
        if message.sender == user {
            let cellOut = tableView.dequeueReusableCell(withIdentifier: MessageOutCell.identifier, for: indexPath) as? MessageOutCell
            cellOut?.setupCellOut(message: message)
            if indexPath.row > 0 && message.sender == viewModel.getMessage[indexPath.row - 1].sender {
                cellOut?.twoMessagesInARow()
            }
            return cellOut ?? UITableViewCell()
        } else {
            let cellIn = tableView.dequeueReusableCell(withIdentifier: MessageInCell.identifier, for: indexPath) as? MessageInCell
            cellIn?.setupCellIn(message: message)
            if indexPath.row > 0 && message.sender == viewModel.getMessage[indexPath.row - 1].sender {
                cellIn?.twoMessagesInARow()
            }
            return cellIn ?? UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightForRowAt(width: tableView.frame.width, indexPath: indexPath)
    }
}

extension ChatViewController: ChatViewProtocol {
    func tappedSendButton() {
        if let textField = screen?.messageTextField, screen?.messageTextField.text != "" {
            viewModel.saveMessageData(from: textField, user: user, to: database)
        }
    }
}
