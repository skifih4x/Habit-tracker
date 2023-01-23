//
//  TabBarContoller.swift
//  Habit tracker
//
//  Created by Артем Орлов on 23.01.2023.
//

import UIKit

final class TabBarContoller: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        tabBar.backgroundColor = .white
        self.navigationItem.setHidesBackButton(true, animated: false)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let mainVC = MainViewController()
        let mainTabBarItem = UITabBarItem(title: "", image: UIImage(named: "home"), selectedImage: UIImage(named: "home_fill"))
        mainVC.tabBarItem = mainTabBarItem

        let calendarVC = CalendarViewController()
        let onboardingTabBarItem = UITabBarItem(title: "", image: UIImage(named: "calendar"), selectedImage: UIImage(named: "calendar"))
        calendarVC.tabBarItem = onboardingTabBarItem

        viewControllers = [mainVC, calendarVC]
    }
}
