//
//  Extension - UITableView.swift
//  flash-chat
//
//  Created by Guilherme Viana on 11/12/2023.
//

import UIKit

extension UITableView {
    func scrollToBottom(animated: Bool) {
        let sections = numberOfSections
        guard sections > 0 else { return }

        let rows = numberOfRows(inSection: sections - 1)
        guard rows > 0 else { return }

        let indexPath = IndexPath(row: rows - 1, section: sections - 1)
        scrollToRow(at: indexPath, at: .bottom, animated: animated)
    }
}
