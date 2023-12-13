//
//  MessageCellInView.swift
//  flash-chat
//
//  Created by Guilherme Viana on 13/12/2023.
//

import UIKit

class MessageCellInView: UIView {

    lazy var messageBgView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemPurple.withAlphaComponent(0.6)
        view.layer.cornerRadius = 10
        return view
    }()
    
    lazy var messageLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.clipsToBounds = true
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    lazy var hourLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    lazy var userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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
        addSubview(messageBgView)
        addSubview(userImageView)
        addSubview(hourLabel)
        messageBgView.addSubview(messageLabel)
    }
    
    private func configConstraints() {
    NSLayoutConstraint.activate([
        messageBgView.centerYAnchor.constraint(equalTo: centerYAnchor),
        messageBgView.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 15),
        messageBgView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -75),
        
        hourLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        hourLabel.leadingAnchor.constraint(equalTo: messageLabel.trailingAnchor, constant: 15),
        
        userImageView.centerYAnchor.constraint(equalTo: messageBgView.centerYAnchor),
        userImageView.heightAnchor.constraint(equalToConstant: 30),
        userImageView.widthAnchor.constraint(equalToConstant: 30),
        userImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
        
        messageLabel.topAnchor.constraint(equalTo: messageBgView.topAnchor, constant: 6),
        messageLabel.leadingAnchor.constraint(equalTo: messageBgView.leadingAnchor, constant: 6),
        messageLabel.trailingAnchor.constraint(equalTo: messageBgView.trailingAnchor, constant: -6),
        messageLabel.bottomAnchor.constraint(equalTo: messageBgView.bottomAnchor, constant: -6),
        ])
    }
}

