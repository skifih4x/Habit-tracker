//
//  MainViewController.swift
//  Habit tracker
//
//  Created by Артем Орлов on 23.01.2023.
//

import UIKit

final class MainViewController: UIViewController {

    private lazy var habitLabel: UILabel = {
        let label = UILabel()
        label.text = "Мои привычки"
        label.font = UIFont(name: "Manrope-ExtraBold", size: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var topImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "image_hills")
        image.clipsToBounds = true
        image.backgroundColor = .black
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private lazy var mainImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "mainImage")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private lazy var infoHabitLabel: UILabel = {
        let label = UILabel()
        label.text =
                """
                У вас пока нет привычек.
                Чтобы добавить привычку,
                нажмите «+»
                """
        label.font = UIFont(name: "Manrope-Regular", size: 14)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var arrowImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "arrow")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "mainColor")
        view.addSubview(habitLabel)
        view.addSubview(topImage)
        view.addSubview(mainImage)
        view.addSubview(infoHabitLabel)
        view.addSubview(arrowImage)

        topImage.layer.cornerRadius = 10


        NSLayoutConstraint.activate([
            habitLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 58),
            habitLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            habitLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            topImage.topAnchor.constraint(equalTo: habitLabel.bottomAnchor, constant: 24),
            topImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            topImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            mainImage.topAnchor.constraint(equalTo: topImage.bottomAnchor, constant: 40),
            mainImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            mainImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),

            infoHabitLabel.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: 16),
            infoHabitLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            infoHabitLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            arrowImage.topAnchor.constraint(equalTo: infoHabitLabel.bottomAnchor, constant: 5),
            arrowImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -130)
        ])

    }
}

import SwiftUI

struct PeopleVCProvider1: PreviewProvider {
    static var previews: some View {
        Container().edgesIgnoringSafeArea(.all)
            .previewDevice("iPhone 13 Pro Max")
    }

    struct Container: UIViewControllerRepresentable {

        let tabBarVC = TabBarContoller()

        func makeUIViewController(context: Context) -> some UIViewController {
            tabBarVC
        }

        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {

        }
    }
}
