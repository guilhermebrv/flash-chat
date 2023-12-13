//
//  MessageOutCell.swift
//  flash-chat
//
//  Created by Guilherme Viana on 13/12/2023.
//

import UIKit

class MessageOutCell: UITableViewCell {
    
    static let identifier: String = String(describing: MessageOutCell.self)
    private var screen: MessageCellOutView = MessageCellOutView()

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
   }
    
    public func twoMessagesInARow() {
        screen.userImageView.image = .none
    }
}

