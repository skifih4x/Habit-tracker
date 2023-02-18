//
//  CellHabit.swift
//  Habit tracker
//
//  Created by Артем Орлов on 26.01.2023.
//

import UIKit

final class CellHabit: UITableViewCell {

    static let indetifer = "CellHabit"

    private lazy var imageHabit: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "imageRun")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private var nameHabit: UILabel = {
        let label = UILabel()
        label.text = "Утренний бег"
        label.font = UIFont(name: Theme.fontName, size: 17)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var skipHabitButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Пропустить", for: .normal)
        button.titleLabel?.font = UIFont(name: Theme.fontName, size: 11)
        button.setImage(UIImage(systemName: "xmark.circle"), for: .normal)
        button.imageView?.tintColor = Theme.buttonBorder
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 4
        button.layer.borderWidth = 1
        button.layer.borderColor = Theme.buttonBorder.cgColor
//        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -9.25, bottom: 0, right: 0)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private var doneHabitButton: UIButton = {
        let button = UIButton()
        button.setTitle("Сделано", for: .normal)
        button.titleLabel?.font = UIFont(name: Theme.fontName, size: 11)
        button.setImage(UIImage(named: "checkImage"), for: .normal)
        button.imageView?.tintColor = .blue
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 4
        button.backgroundColor = Theme.buttonAccentLight
//        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -9.25, bottom: 0, right: 0)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        layout()
    }

    private func setup() {
        selectionStyle = .none
        layer.cornerRadius = 16
        clipsToBounds = true

        var confoguration = UIButton.Configuration.filled()
        confoguration.imagePadding = 10
    }


    private func layout() {

        addSubview(imageHabit)
        addSubview(nameHabit)
        addSubview(skipHabitButton)
        addSubview(doneHabitButton)

        NSLayoutConstraint.activate([
            imageHabit.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            imageHabit.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            imageHabit.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),

            nameHabit.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            nameHabit.leadingAnchor.constraint(equalTo: imageHabit.trailingAnchor, constant: 16),
            nameHabit.heightAnchor.constraint(equalToConstant: 24),

            skipHabitButton.topAnchor.constraint(equalTo: nameHabit.bottomAnchor, constant: 24),
            skipHabitButton.leadingAnchor.constraint(equalTo: imageHabit.trailingAnchor, constant: 16),
            skipHabitButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            skipHabitButton.heightAnchor.constraint(equalToConstant: 40),
            skipHabitButton.widthAnchor.constraint(equalToConstant: 104),

            doneHabitButton.topAnchor.constraint(equalTo: nameHabit.bottomAnchor, constant: 24),
            doneHabitButton.leadingAnchor.constraint(equalTo: skipHabitButton.trailingAnchor, constant: 8),
            doneHabitButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            doneHabitButton.heightAnchor.constraint(equalToConstant: 40),
            doneHabitButton.widthAnchor.constraint(equalToConstant: 104)

        ])
    }
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
