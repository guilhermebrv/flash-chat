//
//  MessageInCell.swift
//  flash-chat
//
//  Created by Guilherme Viana on 13/12/2023.
//

import UIKit

class MessageInCell: UITableViewCell {
    
    static let identifier: String = String(describing: MessageInCell.self)
    private var screen: MessageCellInView = MessageCellInView()

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
   
   public func setupCellIn(message: Message) {
       screen.messageLabel.text = message.body
       screen.messageLabel.textColor = .systemPurple.withAlphaComponent(0.6)
       screen.messageBgView.backgroundColor = .systemPurple.withAlphaComponent(0.2)
       screen.userImageView.image = UIImage(named: "YouAvatar")
       screen.hourLabel.text = message.hour
   }
    
    public func twoMessagesInARow() {
        screen.userImageView.image = .none
    }
}
