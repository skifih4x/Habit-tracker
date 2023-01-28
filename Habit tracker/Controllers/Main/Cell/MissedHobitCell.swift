//
//  MissedHobitCell.swift
//  Habit tracker
//
//  Created by Артем Орлов on 28.01.2023.
//

import UIKit

final class MissedHobitCell: UITableViewCell {
    static let indetifier = "MissedHobitCell"

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
        label.font = UIFont(name: "Manrope-Regular", size: 17)
        label.textColor = #colorLiteral(red: 0.0229173284, green: 0.1207512096, blue: 0.2747300565, alpha: 1)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var doneHabitButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Привычка пропущенна!", for: .normal)
        button.titleLabel?.font = UIFont(name: "Manrope-Regular", size: 11)
        button.setImage(UIImage(systemName: "xmark.circle"), for: .normal)
        button.imageView?.tintColor = #colorLiteral(red: 0.2927370965, green: 0.4645472765, blue: 0.7684565783, alpha: 1)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 4
        button.layer.borderWidth = 1
        button.layer.borderColor = #colorLiteral(red: 0.2927370965, green: 0.4645472765, blue: 0.7684565783, alpha: 1).cgColor
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -40.25, bottom: 0, right: 0)
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
        backgroundColor = .white

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
