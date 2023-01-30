//
//  SceneDelegate.swift
//  Habit tracker
//
//  Created by Артем Орлов on 23.01.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
#warning ("Revert back")
        let window = UIWindow(windowScene: windowScene)
        let tabBar = OnboardingViewController()
//        let tabBar = AddHabitScreen()
        let navigationController = UINavigationController(rootViewController: tabBar)
        window.rootViewController = navigationController
        self.window = window
        window.makeKeyAndVisible()
    }
}

