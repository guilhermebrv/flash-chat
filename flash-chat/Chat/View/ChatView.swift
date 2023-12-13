//
//  ChatView.swift
//  flash-chat
//
//  Created by Guilherme Viana on 06/12/2023.
//

import UIKit

import UIKit

protocol ChatViewProtocol: AnyObject {
    func tappedSendButton()
}

class ChatView: UIView {

    private weak var delegate: ChatViewProtocol?
    public func delegate(delegate: ChatViewProtocol?){
        self.delegate = delegate
    }
    
    lazy var bgView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemPurple.withAlphaComponent(0.6)
        return view
    }()
    
    lazy var chatTableView: UITableView = {
        let tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.showsVerticalScrollIndicator = false
        tableview.separatorStyle = .none
        tableview.backgroundColor = .white
        tableview.allowsSelection = false
        tableview.contentInset = UIEdgeInsets(top: 10.0, left: 0, bottom: 10.0, right: 0)
        tableview.register(MessageCellOut.self, forCellReuseIdentifier: MessageCellOut.identifier)
        tableview.register(MessageInCell.self, forCellReuseIdentifier: MessageInCell.identifier)

        return tableview
    }()
    
    public func delegateTableView(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        chatTableView.delegate = delegate
        chatTableView.dataSource = dataSource
    }
    
    lazy var messageTextField: UITextField = {
        let textField = UITextField()
        let attributedString = NSAttributedString(string: "Write a message...", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray.withAlphaComponent(0.5)])
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.attributedPlaceholder = attributedString
        textField.textColor = .black
        textField.backgroundColor = .white
        textField.tintColor = .black
        textField.layer.cornerRadius = 8
        textField.font = .systemFont(ofSize: 18, weight: .regular)
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        return textField
    }()
    
    lazy var sendButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .plain()
        button.configuration?.image = UIImage(systemName: "paperplane")?.withRenderingMode(.alwaysTemplate)
        button.configuration?.baseForegroundColor = .white
        button.addTarget(self, action: #selector(tappedSendButton), for: .touchUpInside)
        return button
    }()
    
    @objc public func tappedSendButton() {
        delegate?.tappedSendButton()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        addSubview(bgView)
        bgView.addSubview(chatTableView)
        bgView.addSubview(messageTextField)
        bgView.addSubview(sendButton)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            bgView.topAnchor.constraint(equalTo: topAnchor),
            bgView.bottomAnchor.constraint(equalTo: bottomAnchor),
            bgView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bgView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            chatTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            chatTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            chatTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            chatTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -60),
            
            messageTextField.topAnchor.constraint(equalTo: chatTableView.bottomAnchor, constant: 15),
            messageTextField.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
            messageTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            messageTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -70),
            
            sendButton.centerYAnchor.constraint(equalTo: messageTextField.centerYAnchor),
            sendButton.leadingAnchor.constraint(equalTo: messageTextField.trailingAnchor)
        ])
    }
}
