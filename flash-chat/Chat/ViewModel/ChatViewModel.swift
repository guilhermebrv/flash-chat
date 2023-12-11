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
import FirebaseFirestore

class ChatViewModel {
    var messages: [Message] = []
    var messagesUpdated: (() -> Void)?
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
    
    public func heightForRowAt(width: CGFloat, indexPath: IndexPath) -> CGFloat {
        let message = messages[indexPath.row].body.height(withConstrainedWidth: width - 78 - 60, font: .systemFont(ofSize: 18, weight: .bold))
        return message + 18
    }
    
    public func getHour() -> String {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let formattedDate = dateFormatter.string(from: currentDate)
        return formattedDate
    }
    
    public func getMessageData(from database: Firestore) {
        database.collection(K.FStore.collectionName)
            .order(by: K.FStore.dateField)
            .addSnapshotListener { querySnapshot, error in
            if error == nil {
                if let snapshotDocuments = querySnapshot?.documents {
                    self.messages = []
                    for doc in snapshotDocuments {
                        let data = doc.data()
                        if let sender = data[K.FStore.senderField] as? String, 
                            let body = data[K.FStore.bodyField] as? String,
                            let hour = data[K.FStore.hourField] as? String {
                            let message = Message(sender: sender, body: body, hour: hour)
                            self.messages.append(message)
                        }
                    }
                    self.messagesUpdated?()
                }
            } else {
                print("There was an issue retrieving your data from the Firestore database - \(String(describing: error?.localizedDescription))")
            }
        }
    }
    
    public func saveMessageData(from textField: UITextField, user: String, to database: Firestore) {
        if let message = textField.text {
            database.collection(K.FStore.collectionName)
                .addDocument(data: [K.FStore.senderField: user,
                                    K.FStore.bodyField: message,
                                    K.FStore.dateField: Date().timeIntervalSince1970,
                                    K.FStore.hourField: self.getHour()]) { error in
                if error == nil {
                    textField.text = ""
                    print("sucessfully saving data to database")
                } else {
                    print("There was an issue trying to save your data to the Firestore database - \(String(describing: error?.localizedDescription))")
                }
            }
        }
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
