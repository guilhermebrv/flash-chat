//
//  ChatViewModel.swift
//  flash-chat
//
//  Created by Guilherme Viana on 07/12/2023.
//

protocol ChatViewModelProtocol: AnyObject {
    func signOutSuccessful()
    func signOutFailed(error: NSError)
}

import UIKit
import FirebaseAuth

class ChatViewModel {
    var messages: [Message] = [Message(sender: "1@2.com", body: "Hey"),
                               Message(sender: "testing@gmail.com", body: "What's up! test test test test test test test test test test test"),
                               Message(sender: "1@2.com", body: "Bad news."),
                               Message(sender: "1@2.com", body: "You won't believe it! test test test test test test test test test")]
    private weak var delegate: ChatViewModelProtocol?
    public func delegate(delegate: ChatViewModelProtocol) {
        self.delegate = delegate
    }
    
    public var getMessage: [Message] {
        return messages
    }
    
    public var numberOfRowsInSection: Int {
        return messages.count
    }
    
    public var heightForRowAt: CGFloat {
        return 40
    }
    
    public func signOutUser() {
        do {
          try Auth.auth().signOut()
            delegate?.signOutSuccessful()
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
            delegate?.signOutFailed(error: signOutError)
        }
    }
}
