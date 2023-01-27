//
//  SecondSectionCell.swift
//  Habit tracker
//
//  Created by Alexander Altman on 27.01.2023.
//

import UIKit

class SecondSectionCell: UICollectionViewCell {
    
    var daysStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 10
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let separator: UIView = {
       let separator = UIView()
        separator.backgroundColor = Theme.buttonAccentLight
        separator.translatesAutoresizingMaskIntoConstraints = false
        return separator
    }()
    
    let mondayButton: UIButton = {
        let button = UIButton()
        button.setAttributedTitle(NSAttributedString(
            string: "пн",
            attributes: [NSAttributedString.Key.foregroundColor: Theme.textDark,
                         NSAttributedString.Key.font: UIFont(name: "Manrope-Regular", size: 10) as Any]
        ), for: .normal)
        button.setBackgroundColor(color: Theme.backgroundLight, forState: .normal)
        button.setBackgroundColor(color: Theme.buttonAccentLight, forState: .selected)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let tuesdayButton: UIButton = {
        let button = UIButton()
        button.setAttributedTitle(NSAttributedString(
            string: "вт",
            attributes: [NSAttributedString.Key.foregroundColor: Theme.textDark,
                         NSAttributedString.Key.font: UIFont(name: "Manrope-Regular", size: 10) as Any]
        ), for: .normal)
        button.setBackgroundColor(color: Theme.backgroundLight, forState: .normal)
        button.setBackgroundColor(color: Theme.buttonAccentLight, forState: .selected)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let wednesdayButton: UIButton = {
        let button = UIButton()
        button.setAttributedTitle(NSAttributedString(
            string: "ср",
            attributes: [NSAttributedString.Key.foregroundColor: Theme.textDark,
                         NSAttributedString.Key.font: UIFont(name: "Manrope-Regular", size: 10) as Any]
        ), for: .normal)
        button.setBackgroundColor(color: Theme.backgroundLight, forState: .normal)
        button.setBackgroundColor(color: Theme.buttonAccentLight, forState: .selected)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let thursdayButton: UIButton = {
        let button = UIButton()
        button.setAttributedTitle(NSAttributedString(
            string: "чт",
            attributes: [NSAttributedString.Key.foregroundColor: Theme.textDark,
                         NSAttributedString.Key.font: UIFont(name: "Manrope-Regular", size: 10) as Any]
        ), for: .normal)
        button.setBackgroundColor(color: Theme.backgroundLight, forState: .normal)
        button.setBackgroundColor(color: Theme.buttonAccentLight, forState: .selected)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let fridayButton: UIButton = {
        let button = UIButton()
        button.setAttributedTitle(NSAttributedString(
            string: "пт",
            attributes: [NSAttributedString.Key.foregroundColor: Theme.textDark,
                         NSAttributedString.Key.font: UIFont(name: "Manrope-Regular", size: 10) as Any]
        ), for: .normal)
        button.setBackgroundColor(color: Theme.backgroundLight, forState: .normal)
        button.setBackgroundColor(color: Theme.buttonAccentLight, forState: .selected)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let satursdayButton: UIButton = {
        let button = UIButton()
        button.setAttributedTitle(NSAttributedString(
            string: "сб",
            attributes: [NSAttributedString.Key.foregroundColor: Theme.textDark,
                         NSAttributedString.Key.font: UIFont(name: "Manrope-Regular", size: 10) as Any]
        ), for: .normal)
        button.setBackgroundColor(color: Theme.backgroundLight, forState: .normal)
        button.setBackgroundColor(color: Theme.buttonAccentLight, forState: .selected)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let sundayButton: UIButton = {
        let button = UIButton()
        button.setAttributedTitle(NSAttributedString(
            string: "вс",
            attributes: [NSAttributedString.Key.foregroundColor: Theme.textDark,
                         NSAttributedString.Key.font: UIFont(name: "Manrope-Regular", size: 10) as Any]
        ), for: .normal)
        button.setBackgroundColor(color: Theme.backgroundLight, forState: .normal)
        button.setBackgroundColor(color: Theme.buttonAccentLight, forState: .selected)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
//    var dayButtons: [UIButton] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        layer.cornerRadius = 10
        layer.borderWidth = 1
        layer.borderColor = Theme.buttonAccentLight.cgColor
        
        addSubview(daysStackView)
        daysStackView.addArrangedSubview(mondayButton)
        daysStackView.addArrangedSubview(separator)
        daysStackView.addArrangedSubview(tuesdayButton)
        daysStackView.addArrangedSubview(separator)
        daysStackView.addArrangedSubview(wednesdayButton)
        daysStackView.addArrangedSubview(separator)
        daysStackView.addArrangedSubview(thursdayButton)
        daysStackView.addArrangedSubview(separator)
        daysStackView.addArrangedSubview(fridayButton)
        daysStackView.addArrangedSubview(separator)
        daysStackView.addArrangedSubview(satursdayButton)
        daysStackView.addArrangedSubview(separator)
        daysStackView.addArrangedSubview(sundayButton)
        
//        daysStackView = UIStackView(arrangedSubviews: dayButtons)
//
//        setupButtons()
    }
    
    func configureCell(title: String?, image: UIImage?) {
        
    }
    
//    private func setupButtons() {
//        let titles = ["пн", "вт", "ср", "чт", "пт", "сб", "вс"]
//
//        for index in 0..<8 {
//            let button = UIButton()
//            button.setTitle(titles[index], for: .normal)
//            button.tag = index
//            button.addTarget(self, action: #selector(dayButtonTapped), for: .touchUpInside)
//            dayButtons.append(button)
//        }
//    }
    
    //метод окрашивания выделенной кнопки
    @objc func dayButtonTapped() {
        
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            daysStackView.topAnchor.constraint(equalTo: topAnchor),
            daysStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            daysStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            daysStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            separator.heightAnchor.constraint(equalToConstant: 32),
            separator.widthAnchor.constraint(equalToConstant: 1)
        ])
        
        
    }
    
}

extension UIButton {
    func setBackgroundColor(color: UIColor, forState: UIControl.State) {
        self.clipsToBounds = true  // add this to maintain corner radius
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        if let context = UIGraphicsGetCurrentContext() {
            context.setFillColor(color.cgColor)
            context.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
            let colorImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            self.setBackgroundImage(colorImage, for: forState)
        }
    }
}
