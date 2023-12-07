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
    
    lazy var logoutButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .plain()
        button.configuration?.image = UIImage(systemName: "rectangle.portrait.and.arrow.right")
        button.configuration?.baseForegroundColor = .systemBlue.withAlphaComponent(0.8)
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
        bgView.addSubview(logoutButton)
        bgView.addSubview(chatTableView)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            bgView.topAnchor.constraint(equalTo: topAnchor),
            bgView.bottomAnchor.constraint(equalTo: bottomAnchor),
            bgView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bgView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            logoutButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            logoutButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            
            chatTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 45),
            chatTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            chatTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            chatTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}
