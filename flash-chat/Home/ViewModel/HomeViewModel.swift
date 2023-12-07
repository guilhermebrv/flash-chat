//
//  HomeViewModel.swift
//  flash-chat
//
//  Created by Guilherme Viana on 06/12/2023.
//

import UIKit

class HomeViewModel {

    public func animateLogo(logo: UILabel) {
        logo.text = ""
        var charIndex = 0
        let logoText = "⚡️FlashChat"
        for letter in logoText {
            Timer.scheduledTimer(withTimeInterval: 0.07 * Double(charIndex), repeats: false) { timer in
                logo.text?.append(letter)
            }
            charIndex += 1
        }
    }
}
