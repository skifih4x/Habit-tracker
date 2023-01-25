//
//  AddHabitScreen.swift
//  Habit tracker
//
//  Created by Alexander Altman on 24.01.2023.
//

import UIKit

final class AddHabitScreen: UIViewController {
    
    private lazy var habitLabel: UILabel = {
        let label = UILabel()
        label.text = "Название"
        label.font = UIFont(name: "Manrope-Regular", size: 20)
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
    
    private lazy var habitImageLabel: UILabel = {
        let label = UILabel()
        label.text = "Выберите иконку привычки"
        label.font = UIFont(name: "Manrope-Regular", size: 20)
        label.textColor = Theme.textDark
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var habitImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "HabitIcon")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let stackHView: UIStackView = {
       let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.alignment = .center
        stack.spacing = 14
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let stackVView: UIStackView = {
       let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.alignment = .center
        stack.spacing = 1
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Создать новую привычку"
        
        setupStyle()
        setupLayout()
        setConstraints()
        buttonTapped()
        
        print(stackImages.count)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        arrangeHStack()
    }
    
    private func setupStyle() {
        view.backgroundColor = Theme.backgroundLight
        
    }
    
    private func setupLayout() {
        view.addSubview(habitLabel)
        view.addSubview(textInputField)
        view.addSubview(habitImageLabel)
        view.addSubview(stackHView)
        
        arrangeHStack()
    }
    
    
    
    private var stackImages: [UIImageView] = []
    private func arrangeHStack() {
        for num in 0...4 {
            stackImages.append(habitImageView)
            stackHView.addArrangedSubview(stackImages[num])
        }
        
    }
    
    private func arrangeVStack() {
        
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            habitLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            habitLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            habitLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            textInputField.topAnchor.constraint(equalTo: habitLabel.bottomAnchor, constant: 10),
            textInputField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textInputField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            textInputField.heightAnchor.constraint(equalToConstant: 48),
//            textInputField.widthAnchor.constraint(equalToConstant: 336),
            
            habitImageLabel.topAnchor.constraint(equalTo: textInputField.bottomAnchor, constant: 32),
            habitImageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            habitImageLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            stackHView.topAnchor.constraint(equalTo: habitImageLabel.bottomAnchor, constant: 10),
            stackHView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackHView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackHView.heightAnchor.constraint(equalToConstant: 56),
        
        
        ])
        
    }
    
    private func buttonTapped() {
        
    }
    
}

import SwiftUI
struct ListProvider: PreviewProvider {
    static var previews: some View {
        ContainterView().edgesIgnoringSafeArea(.all)
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
