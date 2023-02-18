//
//  TutorialAlert.swift
//  Habit tracker
//
//  Created by Alexander Altman on 17.02.2023.
//

import UIKit

class TutorialAlert {
    
    
    struct Constants {
        static let backgroundAlpha: CGFloat = 0.8
    }
    
    private let backgroundView: UIView = {
       let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0
        return view
    }()
    
    
    private let alertView: UIView = {
       let view = UIView()
        view.backgroundColor = .none
        return view
    }()
    
    private let backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .none
        imageView.image = UIImage(named: "swipe")
        return imageView
    }()
    
    
    func showAlert(title: String, message: String, viewController: UIViewController) {
        
    }
    
}
