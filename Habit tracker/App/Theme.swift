//
//  Theme.swift
//  Habit tracker
//
//  Created by Alexander Altman on 23.01.2023.
//

import UIKit
enum Theme {
    //MARK: - Fonts
    static let fontName: String = "Manrope-Regular"
    static let fontBoldName: String = "Manrope-Bold"
    
    
    // MARK: - Colors
    static let appColor: UIColor = UIColor(named: "AccentColor")!
    static let backgroundLight: UIColor = UIColor(named: "BackgroundColor")!
    static let backgroundWhite: UIColor = UIColor(named: "BackgroundColor2")!
    static let buttonAccentDark: UIColor = UIColor(named: "ButtonAccentDark")!
    static let buttonAccentLight: UIColor = UIColor(named: "ButtonAccentLight")!
    static let textDark: UIColor = UIColor(named: "TextColorDark")!
    static let textLight: UIColor = UIColor(named: "TextColorLight")!
    
    // MARK: - Style
    static let buttonCornerRadius: CGFloat = 15
    static let imageCornerRadius: CGFloat = 20
    
    // MARK: - Layout
    static let spacing: CGFloat = 20
    static let leftOffset: CGFloat = 20
    static let topOffset: CGFloat = 10
}
