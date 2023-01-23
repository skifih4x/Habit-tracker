//
//  OnboardingViewController.swift
//  Habit tracker
//
//  Created by Артем Орлов on 23.01.2023.
//

import UIKit

final class OnboardingViewController: UIViewController {
    
    private let onboardingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "OnboardingImage")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Будь творцом своей жизни!"
        label.textColor = Theme.textDark
        label.font = UIFont(name: Theme.fontBoldName, size: 20)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let subHeaderLabel1: UILabel = {
        let label = UILabel()
        label.text = """
Добро пожаловать.
Давай начнем планировать
твой день!
"""
        label.numberOfLines = 0
        label.textColor = Theme.textDark
        label.font = UIFont(name: Theme.fontName, size: 14)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let stackView: UIStackView = {
       let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .equalCentering
        stack.alignment = .center
        stack.spacing = 1
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let startButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = Theme.buttonAccentDark
//        button.configuration?.contentInsets = .init(top: 4, leading: 5, bottom: 0, trailing: 5)
        button.setTitle("Давай", for: [])
        button.titleLabel?.font = UIFont(name: Theme.fontName, size: 16)
        button.setTitleColor(Theme.textLight, for: .normal)
        button.layer.cornerRadius = 25
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStyle()
        setupLayout()
        setConstraints()
    }
    
    private func setupStyle() {
        view.backgroundColor = Theme.backgroundLight
    }
    
    private func setupLayout() {
        view.addSubview(onboardingImageView)
        view.addSubview(stackView)
        stackView.addArrangedSubview(headerLabel)
        stackView.addArrangedSubview(subHeaderLabel1)
        view.addSubview(startButton)
    }
    
    func ButtonTapped() {
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
    }
    
    @objc func startButtonTapped(_ sender: UIButton) {
            let tabBarController = TabBarContoller()
            if let navigator = self.navigationController {
                navigator.pushViewController(tabBarController, animated: true)
        }
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
        
            onboardingImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 208),
            onboardingImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            onboardingImageView.heightAnchor.constraint(equalToConstant: 256),
            onboardingImageView.widthAnchor.constraint(equalToConstant: 256),
            
            stackView.topAnchor.constraint(equalTo: onboardingImageView.bottomAnchor, constant: 56),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 44),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -44),
            stackView.bottomAnchor.constraint(equalTo: startButton.topAnchor, constant: -38),
            stackView.heightAnchor.constraint(equalToConstant: 106),
            stackView.widthAnchor.constraint(equalToConstant: 304),
            
            startButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
            startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            startButton.heightAnchor.constraint(equalToConstant: 48),
            startButton.widthAnchor.constraint(equalToConstant: 320)
            
        ])
    }
}

import SwiftUI
struct ListProvider: PreviewProvider {
    static var previews: some View {
        ContainterView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainterView: UIViewControllerRepresentable {
        let listVC = OnboardingViewController()
        func makeUIViewController(context:
                                  UIViewControllerRepresentableContext<ListProvider.ContainterView>) -> OnboardingViewController {
            return listVC
        }
        
        func updateUIViewController(_ uiViewController:
                                    ListProvider.ContainterView.UIViewControllerType, context:
                                    UIViewControllerRepresentableContext<ListProvider.ContainterView>) {
        }
    }
}
