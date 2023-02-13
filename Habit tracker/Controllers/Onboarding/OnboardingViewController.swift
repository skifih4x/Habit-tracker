//
//  OnboardingViewController.swift
//  Habit tracker
//
//  Created by Артем Орлов on 23.01.2023.
//

import UIKit
//H 926
//W 428
final class OnboardingViewController: UIViewController {

    private lazy var mainImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "startImage")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private lazy var firstLabel: UILabel = {
        let label = UILabel()
        label.text = "Будь творцом своей жизни!"
        label.font = UIFont(name: Theme.fontName, size: Theme.fontSize20)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var subLabel: UILabel = {
        let label = UILabel()
        label.text =
                """
                Добро пожаловать.
                Давай начнем планировать
                твой день!
                """
        label.font = UIFont(name: Theme.fontName, size: Theme.fontSize14)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

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
        label.font = UIFont(name: Theme.fontBoldName, size: Theme.fontSize20)
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
        label.font = UIFont(name: Theme.fontName, size: Theme.fontSize14)
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
        button.setTitle("Давай", for: [])
        button.titleLabel?.font = UIFont(name: Theme.fontName, size: Theme.fontSize16)
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
        buttonTapped()
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
    
    func buttonTapped() {
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
        
            onboardingImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            onboardingImageView.heightAnchor.constraint(equalToConstant: view.frame.height * 0.27645),
            onboardingImageView.widthAnchor.constraint(equalToConstant: view.frame.height * 0.27645),
            
            stackView.topAnchor.constraint(equalTo: onboardingImageView.bottomAnchor, constant: view.frame.height * 0.06047),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: startButton.topAnchor, constant: view.frame.height * -0.04103),
            stackView.heightAnchor.constraint(equalToConstant: view.frame.height * 0.11447),
            stackView.widthAnchor.constraint(equalToConstant: view.frame.height * 0.32829),
            
            startButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.frame.height * 0.03779),
            startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: view.frame.height * -0.03779),
            startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: view.frame.height * -0.10799),
            startButton.heightAnchor.constraint(equalToConstant: view.frame.height * 0.05183),
            startButton.widthAnchor.constraint(equalToConstant: view.frame.height * 0.34557)
            
        ])
    }
}
