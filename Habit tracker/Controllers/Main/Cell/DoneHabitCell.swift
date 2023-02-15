//
//  DoneHabitCell.swift
//  Habit tracker
//
//  Created by Артем Орлов on 27.01.2023.
//

import UIKit

final class DoneHabitCell: UITableViewCell {

    static let indetifier = "DoneHabitCell"

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

    private var doneHabitButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Привычка выполнена!", for: .normal)
        button.titleLabel?.font = UIFont(name: Theme.fontName, size: 11)
        button.setImage(UIImage(named: "checkImage"), for: .normal)
        button.imageView?.tintColor = .white
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 4
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
//        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -40.25, bottom: 0, right: 0)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        layer.cornerRadius = 16
        clipsToBounds = true

        addSubview(imageHabit)
        addSubview(nameHabit)
        addSubview(doneHabitButton)
        backgroundColor = Theme.cellDoneBackground

        NSLayoutConstraint.activate([
            imageHabit.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            imageHabit.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            imageHabit.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),

            nameHabit.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            nameHabit.leadingAnchor.constraint(equalTo: imageHabit.trailingAnchor, constant: 16),
            nameHabit.heightAnchor.constraint(equalToConstant: 24),
//
            doneHabitButton.topAnchor.constraint(equalTo: nameHabit.bottomAnchor, constant: 24),
            doneHabitButton.leadingAnchor.constraint(equalTo: imageHabit.trailingAnchor, constant: 16),
            doneHabitButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            doneHabitButton.widthAnchor.constraint(equalToConstant: 204)

        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
