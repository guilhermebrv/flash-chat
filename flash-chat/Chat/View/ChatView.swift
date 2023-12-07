//
//  ChatView.swift
//  flash-chat
//
//  Created by Guilherme Viana on 06/12/2023.
//

import UIKit

import UIKit

protocol ChatViewProtocol: AnyObject {
    func tappedLogoutButton()
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
    
    lazy var logoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textAlignment = .center
        label.text = "⚡️FlashChat"
        return label
    }()
    
    lazy var logoutButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .plain()
        button.configuration?.image = UIImage(systemName: "rectangle.portrait.and.arrow.right")?.withRenderingMode(.alwaysTemplate)
        button.configuration?.baseForegroundColor = .white
        button.addTarget(self, action: #selector(tappedLogoutButton), for: .touchUpInside)
        return button
    }()
    
    @objc public func tappedLogoutButton() {
        delegate?.tappedLogoutButton()
    }
    
    lazy var chatTableView: UITableView = {
        let tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.showsVerticalScrollIndicator = false
        tableview.separatorStyle = .none
        //tableView.register(ProductsTableViewCell.self, forCellReuseIdentifier: ProductsTableViewCell.identifier)
        return tableview
    }()
    
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
        //button.addTarget(self, action: #selector(tappedSendButton), for: .touchUpInside)
        return button
    }()
    
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
        bgView.addSubview(logoLabel)
        bgView.addSubview(logoutButton)
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
            
            logoLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5),
            logoLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            logoutButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            logoutButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            
            chatTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 45),
            chatTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -60),
            chatTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            chatTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            messageTextField.topAnchor.constraint(equalTo: chatTableView.bottomAnchor, constant: 15),
            messageTextField.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
            messageTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            messageTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -70),
            
            sendButton.centerYAnchor.constraint(equalTo: messageTextField.centerYAnchor),
            sendButton.leadingAnchor.constraint(equalTo: messageTextField.trailingAnchor)
        ])
    }
}
