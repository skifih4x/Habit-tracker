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
    static let fontExtraBold: String = "Manrope-ExtraBold"
    
    // MARK: - Colors
    static let appColor: UIColor = UIColor(named: "AccentColor") ?? .white
    static let backgroundLight: UIColor = UIColor(named: "BackgroundColor") ?? .white
    static let backgroundWhite: UIColor = UIColor(named: "BackgroundColor2") ?? .white
    static let buttonAccentDark: UIColor = UIColor(named: "ButtonAccentDark") ?? .white
    static let buttonAccentLight: UIColor = UIColor(named: "ButtonAccentLight") ?? .white
    static let buttonBorder: UIColor = UIColor(named: "ButtonBorder") ?? .white
    static let deleteBackground: UIColor = UIColor(named: "DeleteBackground") ?? .white
    static let cellDoneBackground: UIColor = UIColor(named: "CellDoneBackground") ?? .white

    static let textDark: UIColor = UIColor(named: "TextColorDark") ?? .white
    static let textLight: UIColor = UIColor(named: "TextColorLight") ?? .white
    
    // MARK: - Style
    static let buttonCornerRadius: CGFloat = 20
    static let fontSize20: CGFloat = 0.02159
    static let fontSize14: CGFloat = 0.01511
    static let fontSize16: CGFloat = 0.01727
    static let fontSize22: CGFloat = 0.02375
    
    // MARK: - Layout
    static let spacing: CGFloat = 20
    static let leftOffset: CGFloat = 20
    static let topOffset: CGFloat = 0.01079
    static let multiplier: CGFloat = 0.05183
    
    //MARK: - Constants

}
