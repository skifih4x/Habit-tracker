//
//  CustomTabBar.swift
//  Habit tracker
//
//  Created by Артем Орлов on 25.01.2023.
//

import UIKit

class CustomTabBar: UITabBar {

    // MARK: - Variables
    public var didTapButton: (() -> ())?

    public lazy var middleButton: UIButton! = {
        let middleButton = UIButton()
        middleButton.frame.size = CGSize(width: 64, height: 64)

        let conf = UIImage.SymbolConfiguration(pointSize: 35, weight: .light)
        let image = UIImage(systemName: "plus", withConfiguration: conf)
        middleButton.setImage(image, for: .normal)
        middleButton.backgroundColor = Theme.backgroundLight
        middleButton.tintColor = Theme.buttonAccentDark
        middleButton.layer.cornerRadius = 0.5 * middleButton.bounds.size.width

        middleButton.addTarget(self, action: #selector(self.middleButtonAction), for: .touchUpInside)

        self.addSubview(middleButton)

        return middleButton
    }()

    // MARK: - View Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()

        self.layer.shadowColor = #colorLiteral(red: 0.976000011, green: 0.9570000172, blue: 0.9250000119, alpha: 1).cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.layer.shadowRadius = 4.0
        self.layer.shadowOpacity = 0.4
        self.layer.masksToBounds = false

    }

    override func layoutSubviews() {
        super.layoutSubviews()

        middleButton.center = CGPoint(x: frame.width / 2, y: -5)
    }

    // MARK: - Actions
    @objc private func middleButtonAction(sender: UIButton) {
        didTapButton?()
    }

    // MARK: - HitTest
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        guard !clipsToBounds && !isHidden && alpha > 0 else { return nil }

        return self.middleButton.frame.contains(point) ? self.middleButton : super.hitTest(point, with: event)
    }
}
