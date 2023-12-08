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
        screen.messageLabel.textAlignment = .right
        NSLayoutConstraint.activate([
            screen.messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
        ])
    }
    
    public func setupCellIn(message: Message) {
        screen.messageLabel.text = message.body
        NSLayoutConstraint.activate([
            screen.messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
        ])
    }
    
}
