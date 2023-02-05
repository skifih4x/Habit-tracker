//
//  AddHabitScreen.swift
//  Habit tracker
//
//  Created by Alexander Altman on 24.01.2023.
//

import UIKit

final class AddHabitScreen: UIViewController {
    //H 926
    //W 428
    
    //MARK: - UI Elements
    
    //MARK: First Section
    private lazy var habitLabel: UILabel = {
        let label = UILabel()
        label.text = "Название"
        label.font = UIFont(name: "Manrope-Regular", size: view.frame.height * 0.02159)
        label.textColor = Theme.textDark
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var textInputField: UITextField = {
        let text = UITextField()
        text.layer.cornerRadius = 10
        text.layer.borderWidth = 1
        text.layer.borderColor = Theme.buttonAccentDark.cgColor
        text.attributedPlaceholder = NSAttributedString(
            string: "Введине не более 20 символов",
            attributes: [NSAttributedString.Key.foregroundColor: Theme.buttonAccentLight,
                         NSAttributedString.Key.font: UIFont(name: "Manrope-Regular", size: 18) as Any]
        )
        
        let paddingView = UIView(frame: CGRectMake(0, 0, 16, text.frame.height))
        text.leftView = paddingView
        text.leftViewMode = UITextField.ViewMode.always
        
        
        text.backgroundColor = .white
        text.textColor = Theme.textDark
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private lazy var addButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = Theme.buttonAccentDark
        button.setAttributedTitle(NSAttributedString(
            string: "Добавить привычку",
            attributes: [NSAttributedString.Key.foregroundColor: Theme.textLight,
                         NSAttributedString.Key.font: UIFont(name: "Manrope-Regular", size: 16) as Any]
        ), for: .normal)
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(addHabitAction), for: .touchUpInside)
        return button
    }()
    
    //MARK: Second Section
    
    let sections = MockData.shared.pageData
    private var firstSection: [ListItem] = []
    
    private lazy var imageChooseLabel: UILabel = {
        let label = UILabel()
        label.text = "Выберите иконку привычки"
        label.font = UIFont(name: "Manrope-Regular", size: view.frame.height * 0.02159)
        label.textColor = Theme.textDark
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var imageCollectionView: UICollectionView!
    
    
    //MARK: Third Section
    
    private lazy var dayChooseLabel: UILabel = {
        let label = UILabel()
        label.text = "Повторять по дням недели"
        label.font = UIFont(name: "Manrope-Regular", size: view.frame.height * 0.02159)
        label.textColor = Theme.textDark
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var daysStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.layer.cornerRadius = 10
        stack.layer.borderWidth = 1
        stack.layer.borderColor = Theme.buttonAccentLight.cgColor
        stack.backgroundColor = .white
        stack.spacing = 0
        stack.distribution = .equalCentering
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let separator1: UIView = {
        let separator = UIView()
        separator.backgroundColor = Theme.buttonAccentLight
        separator.translatesAutoresizingMaskIntoConstraints = false
        return separator
    }()
    
    private let separator2: UIView = {
        let separator = UIView()
        separator.backgroundColor = Theme.buttonAccentLight
        separator.translatesAutoresizingMaskIntoConstraints = false
        return separator
    }()
    
    private let separator3: UIView = {
        let separator = UIView()
        separator.backgroundColor = Theme.buttonAccentLight
        separator.translatesAutoresizingMaskIntoConstraints = false
        return separator
    }()
    
    private let separator4: UIView = {
        let separator = UIView()
        separator.backgroundColor = Theme.buttonAccentLight
        separator.translatesAutoresizingMaskIntoConstraints = false
        return separator
    }()
    
    private let separator5: UIView = {
        let separator = UIView()
        separator.backgroundColor = Theme.buttonAccentLight
        separator.translatesAutoresizingMaskIntoConstraints = false
        return separator
    }()
    
    private let separator6: UIView = {
        let separator = UIView()
        separator.backgroundColor = Theme.buttonAccentLight
        separator.translatesAutoresizingMaskIntoConstraints = false
        return separator
    }()
    
    let mondayButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.setAttributedTitle(NSAttributedString(
            string: "пн",
            attributes: [NSAttributedString.Key.foregroundColor: Theme.textDark,
                         NSAttributedString.Key.font: UIFont(name: "Manrope-Regular", size: 10) as Any]
        ), for: .normal)
        //        button.setBackgroundColor(color: .white, forState: .normal)
        //        button.setBackgroundColor(color: Theme.buttonAccentLight, forState: .selected)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let tuesdayButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.setAttributedTitle(NSAttributedString(
            string: "вт",
            attributes: [NSAttributedString.Key.foregroundColor: Theme.textDark,
                         NSAttributedString.Key.font: UIFont(name: "Manrope-Regular", size: 10) as Any]
        ), for: .normal)
        //        button.setBackgroundColor(color: .white, forState: .normal)
        //        button.setBackgroundColor(color: Theme.buttonAccentLight, forState: .selected)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let wednesdayButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.setAttributedTitle(NSAttributedString(
            string: "ср",
            attributes: [NSAttributedString.Key.foregroundColor: Theme.textDark,
                         NSAttributedString.Key.font: UIFont(name: "Manrope-Regular", size: 10) as Any]
        ), for: .normal)
        //        button.setBackgroundColor(color: .white, forState: .normal)
        //        button.setBackgroundColor(color: Theme.buttonAccentLight, forState: .selected)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let thursdayButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.setAttributedTitle(NSAttributedString(
            string: "чт",
            attributes: [NSAttributedString.Key.foregroundColor: Theme.textDark,
                         NSAttributedString.Key.font: UIFont(name: "Manrope-Regular", size: 10) as Any]
        ), for: .normal)
        //        button.setBackgroundColor(color: .white, forState: .normal)
        //        button.setBackgroundColor(color: Theme.buttonAccentLight, forState: .selected)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let fridayButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.setAttributedTitle(NSAttributedString(
            string: "пт",
            attributes: [NSAttributedString.Key.foregroundColor: Theme.textDark,
                         NSAttributedString.Key.font: UIFont(name: "Manrope-Regular", size: 10) as Any]
        ), for: .normal)
        //        button.setBackgroundColor(color: .white, forState: .normal)
        //        button.setBackgroundColor(color: Theme.buttonAccentLight, forState: .selected)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let satursdayButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.setAttributedTitle(NSAttributedString(
            string: "сб",
            attributes: [NSAttributedString.Key.foregroundColor: Theme.textDark,
                         NSAttributedString.Key.font: UIFont(name: "Manrope-Regular", size: 10) as Any]
        ), for: .normal)
        //        button.setBackgroundColor(color: .white, forState: .normal)
        //        button.setBackgroundColor(color: Theme.buttonAccentLight, forState: .selected)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let sundayButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.setAttributedTitle(NSAttributedString(
            string: "вс",
            attributes: [NSAttributedString.Key.foregroundColor: Theme.textDark,
                         NSAttributedString.Key.font: UIFont(name: "Manrope-Regular", size: 10) as Any]
        ), for: .normal)
        //        button.setBackgroundColor(color: .white, forState: .normal)
        //        button.setBackgroundColor(color: Theme.buttonAccentLight, forState: .selected)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Создать новую привычку"
        
        setupStyle()
        setupLayout()
        setConstraints()
        buttonTapped()
        setCollectionView()
    }
    

    @objc private func addHabitAction() {
        navigationController?.pushViewController(TabBarContoller(), animated: true)
    }
    //MARK: - Style
    
    private func setupStyle() {
        view.backgroundColor = Theme.backgroundLight
        
    }
    
    private func setCollectionView() {
        imageCollectionView = UICollectionView(frame: .zero, collectionViewLayout: setupFlowLayout())
        
        view.addSubview(imageCollectionView)
        
        imageCollectionView.backgroundColor = Theme.backgroundLight
        
        NSLayoutConstraint.activate([
            imageCollectionView.topAnchor.constraint(equalTo: imageChooseLabel.bottomAnchor, constant: 10),
            imageCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            imageCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            imageCollectionView.bottomAnchor.constraint(equalTo: dayChooseLabel.topAnchor, constant: -32)
        ])
        
        imageCollectionView.register(FirstSectionCell.self, forCellWithReuseIdentifier: "FirstSectionCell")
        
        imageCollectionView.dataSource = self
        imageCollectionView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: view.frame.height * 0.075, height: view.frame.height * 0.075)
        
        return layout
    }
    
    private func setupLayout() {
        view.addSubview(habitLabel)
        view.addSubview(textInputField)
        view.addSubview(addButton)
        
        view.addSubview(imageChooseLabel)
        view.addSubview(dayChooseLabel)
        view.addSubview(daysStackView)
        
        buttonTapped()
        
        daysStackView.addArrangedSubview(mondayButton)
        daysStackView.addArrangedSubview(separator1)
        daysStackView.addArrangedSubview(tuesdayButton)
        daysStackView.addArrangedSubview(separator2)
        daysStackView.addArrangedSubview(wednesdayButton)
        daysStackView.addArrangedSubview(separator3)
        daysStackView.addArrangedSubview(thursdayButton)
        daysStackView.addArrangedSubview(separator4)
        daysStackView.addArrangedSubview(fridayButton)
        daysStackView.addArrangedSubview(separator5)
        daysStackView.addArrangedSubview(satursdayButton)
        daysStackView.addArrangedSubview(separator6)
        daysStackView.addArrangedSubview(sundayButton)
        
        //        daysStackView.addSeparators(at: [1], color: Theme.buttonAccentLight)
        //        daysStackView.addSeparators(at: [3], color: Theme.buttonAccentLight)
        //        daysStackView.addSeparators(at: [5], color: Theme.buttonAccentLight)
        //        daysStackView.addSeparators(at: [7], color: Theme.buttonAccentLight)
        //        daysStackView.addSeparators(at: [9], color: Theme.buttonAccentLight)
        //        daysStackView.addSeparators(at: [11], color: Theme.buttonAccentLight)
        
        
    }
#warning ("исправить логику нажатия кнопки")
    private func buttonTapped() {
        mondayButton.addTarget(self, action: #selector(dayButtonTapped), for: .touchUpInside)
        tuesdayButton.addTarget(self, action: #selector(dayButtonTapped), for: .touchUpInside)
        wednesdayButton.addTarget(self, action: #selector(dayButtonTapped), for: .touchUpInside)
        thursdayButton.addTarget(self, action: #selector(dayButtonTapped), for: .touchUpInside)
        fridayButton.addTarget(self, action: #selector(dayButtonTapped), for: .touchUpInside)
        satursdayButton.addTarget(self, action: #selector(dayButtonTapped), for: .touchUpInside)
        sundayButton.addTarget(self, action: #selector(dayButtonTapped), for: .touchUpInside)
    }
    
    
    var flag = 0
    @objc private func dayButtonTapped(_ sender: UIButton) {
        
        
        if flag == 0 {
            sender.backgroundColor = Theme.buttonAccentLight
            flag = 1
        } else {
            sender.backgroundColor = .white
            flag = 0
        }
        
    }
}

//MARK: - Constraints
extension AddHabitScreen {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            habitLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            habitLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            habitLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            textInputField.topAnchor.constraint(equalTo: habitLabel.bottomAnchor, constant: 10),
            textInputField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textInputField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            textInputField.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05183),
            //            textInputField.widthAnchor.constraint(equalToConstant: 336),
            
            imageChooseLabel.topAnchor.constraint(equalTo: textInputField.bottomAnchor, constant: 32),
            imageChooseLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            imageChooseLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            
            //            dayChooseLabel.topAnchor.constraint(equalTo: imageCollectionView.bottomAnchor, constant: 32),
            dayChooseLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            dayChooseLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            daysStackView.topAnchor.constraint(equalTo: dayChooseLabel.bottomAnchor, constant: 20),
            daysStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            daysStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            daysStackView.bottomAnchor.constraint(equalTo: addButton.topAnchor, constant: view.frame.height * -0.29157),
            daysStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05283),
            
            mondayButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05183),
            tuesdayButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05183),
            wednesdayButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05183),
            thursdayButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05183),
            fridayButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05183),
            satursdayButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05183),
            sundayButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05183),
            
            mondayButton.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05183),
            tuesdayButton.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05183),
            wednesdayButton.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05183),
            thursdayButton.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05183),
            fridayButton.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05183),
            satursdayButton.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05183),
            sundayButton.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05183),
            
            separator1.heightAnchor.constraint(equalTo: daysStackView.heightAnchor, multiplier: 0.66),
            separator1.widthAnchor.constraint(equalToConstant: 1),
            separator2.heightAnchor.constraint(equalTo: daysStackView.heightAnchor, multiplier: 0.66),
            separator2.widthAnchor.constraint(equalToConstant: 1),
            separator3.heightAnchor.constraint(equalTo: daysStackView.heightAnchor, multiplier: 0.66),
            separator3.widthAnchor.constraint(equalToConstant: 1),
            separator4.heightAnchor.constraint(equalTo: daysStackView.heightAnchor, multiplier: 0.66),
            separator4.widthAnchor.constraint(equalToConstant: 1),
            separator5.heightAnchor.constraint(equalTo: daysStackView.heightAnchor, multiplier: 0.66),
            separator5.widthAnchor.constraint(equalToConstant: 1),
            separator6.heightAnchor.constraint(equalTo: daysStackView.heightAnchor, multiplier: 0.66),
            separator6.widthAnchor.constraint(equalToConstant: 1),
            
            
            
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            addButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            addButton.heightAnchor.constraint(equalToConstant: 48),
            //            addButton.widthAnchor.constraint(equalToConstant: 320)
            
            
            
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

extension AddHabitScreen: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sections[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch sections[indexPath.section] {
        case .first(let first):
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FirstSectionCell", for: indexPath) as? FirstSectionCell else {
                return UICollectionViewCell()
            }
            cell.configureCell(image: first[indexPath.item].image)
            return cell
        }
        
        
    }
}

//extension UIStackView {
//
//    func addSeparators(at positions: [Int], color: UIColor) {
//        for position in positions {
//            let separator = UIView()
//            separator.backgroundColor = color
//
//            insertArrangedSubview(separator, at: position)
//            switch self.axis {
//            case .horizontal:
//                separator.widthAnchor.constraint(equalToConstant: 1).isActive = true
//                separator.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.6).isActive = true
//            case .vertical:
//                separator.heightAnchor.constraint(equalToConstant: 1).isActive = true
//                separator.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1).isActive = true
//            @unknown default:
//                fatalError("Unknown UIStackView axis value.")
//            }
//        }
//    }
//}


import SwiftUI
struct ListProvider: PreviewProvider {
    static var previews: some View {
        ContainterView().edgesIgnoringSafeArea(.all)
            .previewDevice("iPhone 12 Pro Max")
            .previewDisplayName("iPhone 12 Pro Max")
        
        ContainterView().edgesIgnoringSafeArea(.all)
            .previewDevice("iPhone SE (3rd generation)")
            .previewDisplayName("iPhone SE (3rd generation)")
    }
    
    struct ContainterView: UIViewControllerRepresentable {
        let listVC = AddHabitScreen()
        func makeUIViewController(context:
                                  UIViewControllerRepresentableContext<ListProvider.ContainterView>) -> AddHabitScreen {
            return listVC
        }
        
        func updateUIViewController(_ uiViewController:
                                    ListProvider.ContainterView.UIViewControllerType, context:
                                    UIViewControllerRepresentableContext<ListProvider.ContainterView>) {
        }
    }
}
