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

        setValue(CustomTabBar(frame: tabBar.frame), forKey: "tabBar")
        tabBar.backgroundColor = .white

        navigationItem.setHidesBackButton(true, animated: false)

        tabBar.isTranslucent = false

        guard let tabBar = self.tabBar as? CustomTabBar else { return }

        tabBar.didTapButton = { [unowned self] in
            self.routeToCreateNewAd()
        }
        delegate = self
    }

    func routeToCreateNewAd() {
        navigationController?.pushViewController(OnboardingViewController(), animated: true)
        
        for family in UIFont.familyNames.sorted() {
            let names = UIFont.fontNames(forFamilyName: family)
            print("Family: \(family) Font names: \(names)")
        }
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
