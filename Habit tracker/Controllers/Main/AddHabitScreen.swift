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
        return button
    }()
    
//    private lazy var habitImageLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Выберите иконку привычки"
//        label.font = UIFont(name: "Manrope-Regular", size: 20)
//        label.textColor = Theme.textDark
//        label.textAlignment = .left
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//
//    private lazy var habitImageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.image = UIImage(named: "HabitIcon")
//        imageView.contentMode = .scaleAspectFit
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        return imageView
//    }()
//
//    private let stackHView: UIStackView = {
//       let stack = UIStackView()
//        stack.axis = .horizontal
//        stack.distribution = .fillEqually
//        stack.alignment = .center
//        stack.spacing = 14
//        stack.translatesAutoresizingMaskIntoConstraints = false
//        return stack
//    }()
//
//    private let stackVView: UIStackView = {
//       let stack = UIStackView()
//        stack.axis = .vertical
//        stack.distribution = .fillEqually
//        stack.alignment = .center
//        stack.spacing = 1
//        stack.translatesAutoresizingMaskIntoConstraints = false
//        return stack
//    }()
    
//==================
    
    private let collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = Theme.buttonAccentLight
        collectionView.showsVerticalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private var sections = MockData.shared.pageData
    private var firstSection: [ListItem]?
    private var secondSection: [ListItem]?
    
    
    //==================
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Создать новую привычку"
        
        setupStyle()
        setupLayout()
        setConstraints()
        buttonTapped()
        
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
        view.addSubview(collectionView)
        view.addSubview(addButton)
//        view.addSubview(habitImageLabel)
//        view.addSubview(stackHView)
//
//        arrangeHStack()
    }
    
    
    
//    private var stackImages: [UIImageView] = []
//    private func arrangeHStack() {
//        for num in 0...4 {
//            stackImages.append(habitImageView)
//            stackHView.addArrangedSubview(stackImages[num])
//        }
//
//    }
//
//    private func arrangeVStack() {
//
//    }
    
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
            
//            habitImageLabel.topAnchor.constraint(equalTo: textInputField.bottomAnchor, constant: 32),
//            habitImageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            habitImageLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//
//            stackHView.topAnchor.constraint(equalTo: habitImageLabel.bottomAnchor, constant: 10),
//            stackHView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            stackHView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            stackHView.heightAnchor.constraint(equalToConstant: 56),
            collectionView.topAnchor.constraint(equalTo: textInputField.bottomAnchor, constant: 32),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            addButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            addButton.heightAnchor.constraint(equalToConstant: 48),
            addButton.widthAnchor.constraint(equalToConstant: 320)
            
        ])
        
    }
    
    private func buttonTapped() {
        
    }
    
}


extension AddHabitScreen {
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in
            guard let self = self else { return nil }
            
            let section = self.sections[sectionIndex]
            switch section {
            case .first(_):
                return self.createFirstSection()
            case .second(_):
                return self.createSecondSection()
            }
        }
    }
    
    private func createLayoutSection(
        group: NSCollectionLayoutGroup,
        behavior: UICollectionLayoutSectionOrthogonalScrollingBehavior,
        intergrouupSpacing: CGFloat,
        contentInsets: Bool
    ) -> NSCollectionLayoutSection {
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = behavior
        section.interGroupSpacing = intergrouupSpacing
        return section
    }
    
    
    private func createFirstSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalWidth(1)
            )
        )
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalWidth(50)
            ),
            subitems: [item]
        )
        
        let section = createLayoutSection(
            group: group,
            behavior: .groupPaging,
            intergrouupSpacing: 10,
            contentInsets: false
        )
        section.contentInsets = .init(top: 10, leading: 10, bottom: 10, trailing: 10)
        return section
    }
    
    private func createSecondSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(50)
            )
        )
        item.contentInsets = NSDirectionalEdgeInsets.init(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .estimated(1)
            ),
            subitems: [item]
        )
        
        let section = createLayoutSection(
            group: group,
            behavior: .none,
            intergrouupSpacing: 10,
            contentInsets: false
        )
        section.contentInsets = .init(top: 10, leading: 0, bottom: 0, trailing: 0)
        return section
    }
}

//MARK: - UICollectionViewDelegate
extension AddHabitScreen: UICollectionViewDelegate { }

//MARK: - UICollectionViewDataSource
extension AddHabitScreen: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sections[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch sections[indexPath.section] {
            
        case .first(let first):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FirstSectionCell", for: indexPath) as? FirstSectionCell
            else {
                return UICollectionViewCell()
            }
            cell.configureCell(title: first[indexPath.row].label, image: first[indexPath.row].image!)
            return cell
            
            
        case .second(let second):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SecondSectionCell", for: indexPath) as? SecondSectionCell
            else {
                return UICollectionViewCell()
            }
            cell.configureCell(title: second[indexPath.row].label, image: second[indexPath.row].image!)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

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
