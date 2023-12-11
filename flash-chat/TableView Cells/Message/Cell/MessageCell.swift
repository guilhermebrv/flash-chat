//
//  MessageCell.swift
//  flash-chat
//
//  Created by Guilherme Viana on 08/12/2023.
//

import UIKit

class MessageCell: UITableViewCell {
    
    static let identifier: String = String(describing: MessageCell.self)
    private var screen: MessageCellView = MessageCellView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupScreen()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupScreen() {
        contentView.addSubview(screen)
        screen.pin(to: contentView)
    }
    
    public func setupCellOut(message: Message) {
        screen.messageLabel.text = message.body
        screen.userImageView.image = UIImage(named: "MeAvatar")
        screen.hourLabel.text = message.hour
        NSLayoutConstraint.activate([
            screen.messageBgView.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: 75),
            screen.messageLabel.trailingAnchor.constraint(equalTo: screen.userImageView.leadingAnchor, constant: -15),
            screen.userImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            screen.hourLabel.trailingAnchor.constraint(equalTo: screen.messageLabel.leadingAnchor, constant: -15),
        ])
    }
    
    public func setupCellIn(message: Message) {
        screen.messageLabel.text = message.body
        screen.messageLabel.textColor = .systemPurple.withAlphaComponent(0.6)
        screen.messageBgView.backgroundColor = .systemPurple.withAlphaComponent(0.2)
        screen.userImageView.image = UIImage(named: "YouAvatar")
        NSLayoutConstraint.activate([
            screen.messageLabel.leadingAnchor.constraint(equalTo: screen.userImageView.trailingAnchor, constant: 15),
            screen.messageBgView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -75),
            screen.userImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            screen.hourLabel.leadingAnchor.constraint(equalTo: screen.messageLabel.trailingAnchor, constant: 15),
        ])
    }
    
    public func twoMessagesInARow() {
        screen.userImageView.image = .none
    }
    
}
