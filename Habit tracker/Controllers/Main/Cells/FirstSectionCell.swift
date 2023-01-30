//
//  FirstSectionCell.swift
//  Habit tracker
//
//  Created by Alexander Altman on 27.01.2023.
//

import UIKit

class FirstSectionCell: UICollectionViewCell {
    
    private lazy var habitImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "HabitIcon")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.borderWidth = 1
        imageView.layer.backgroundColor = Theme.buttonAccentLight.cgColor
        imageView.layer.cornerRadius = frame.width / 2
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupView() {
        addSubview(habitImageView)
        backgroundColor = Theme.backgroundLight
        self.clipsToBounds = true
    }
    
    func configureCell(image: UIImage) {
        habitImageView.image = image
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            habitImageView.topAnchor.constraint(equalTo: topAnchor),
            habitImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            habitImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            habitImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
//            habitImageView.heightAnchor.constraint(equalToConstant: 56),
//            habitImageView.widthAnchor.constraint(equalToConstant: 56)
        ])
    }
    
}
