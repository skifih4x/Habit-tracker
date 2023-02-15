//
//  ListSection.swift
//  Habit tracker
//
//  Created by Alexander Altman on 27.01.2023.
//

import UIKit

enum ListSection {
    case first([ListItem])
    
    // Define sections
    var items: [ListItem] {
        switch self {
        case .first(let items):
            return items
        }
    }
    
    // Numbers of items in section
    var count: Int {
        items.count
    }
    
    // Sections headers
    var title: NSAttributedString {
        switch self {
        case .first(_):
            return NSAttributedString(
                string:"Выберите иконку привычки",
                attributes: [NSAttributedString.Key.foregroundColor: Theme.textDark,
                             NSAttributedString.Key.font: UIFont(name: Theme.fontName, size: 20) as Any]
            )
        }
    }
}
