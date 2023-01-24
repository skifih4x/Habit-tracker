//
//  OnboardingViewController.swift
//  Habit tracker
//
//  Created by Артем Орлов on 23.01.2023.
//

import UIKit

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
        label.font = UIFont(name: "Manrope-SemiBold", size: 20)
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
        label.font = UIFont(name: "Manrope-Regular", size: 14)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var startButton: UIButton = {
        let button = UIButton()
        button.setTitle("Давай", for: .normal)
        button.backgroundColor = UIColor(named: "buttonColor")
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont(name: "Manrope-SemiBold", size: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(getStart), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "mainColor")
        view.addSubview(mainImage)
        view.addSubview(firstLabel)
        view.addSubview(subLabel)
        view.addSubview(startButton)

        NSLayoutConstraint.activate([
            mainImage.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 20),
            mainImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),


            firstLabel.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: 60),
            firstLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            firstLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),

            subLabel.topAnchor.constraint(equalTo: firstLabel.bottomAnchor, constant: 20),
            subLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            subLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            startButton.topAnchor.constraint(equalTo: subLabel.bottomAnchor, constant: 38),
            startButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
        ])
    }

    @objc private func getStart() {
        navigationController?.pushViewController(TabBarContoller(), animated: true)
    }
}

import SwiftUI

struct PeopleVCProvider: PreviewProvider {
    static var previews: some View {
        Container().edgesIgnoringSafeArea(.all)
            .previewDevice("iPhone 13 Pro Max")
    }

    struct Container: UIViewControllerRepresentable {

        let tabBarVC = OnboardingViewController()

        func makeUIViewController(context: Context) -> some UIViewController {
            tabBarVC
        }

        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {

        }
    }
}
