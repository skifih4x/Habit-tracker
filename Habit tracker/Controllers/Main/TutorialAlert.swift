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
    
    // Затемняющийся background
    private let backgroundView: UIView = {
       let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0
        return view
    }()
    
    //сам alert
    private let alertView: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        return view
    }()
    
    private let alertImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .none
        imageView.image = UIImage(named: "swipe")
        return imageView
    }()
    
    private var dismissTargetView: UIView?
    
    //Метод, для использования на любом ViewController'е
    func showAlert(title: String, message: String, viewController: UIViewController) {
        guard let targetView = viewController.view else { return }
        
        dismissTargetView = targetView
        
        backgroundView.frame = targetView.bounds
        targetView.addSubview(backgroundView)
        
        alertView.frame = CGRect(x: 40, y: -216, width: targetView.frame.width - 80, height: 216)
        targetView.addSubview(alertView)
        
        alertImage.frame = CGRect(x: 112, y: 40, width: targetView.frame.width / 2, height: targetView.frame.height * 0.17)
        alertView.addSubview(alertImage)
        
        let titleLabel = UILabel(frame: CGRect(x: 200, y: 0, width: alertView.frame.width, height: 80))
        titleLabel.text = title
        titleLabel.font = .systemFont(ofSize: 14)
        titleLabel.textColor = Theme.textDark
        titleLabel.textAlignment = .center
//        titleLabel.numberOfLines = 0
        alertView.addSubview(titleLabel)
        
        let messageLabel = UILabel(frame: CGRect(x: 70, y: 80, width: alertView.frame.width - 140, height: 180)) // ширина вычитаем ось Х * 2 для центровки
        messageLabel.text = message
        messageLabel.textAlignment = .center
        messageLabel.numberOfLines = 0
        alertView.addSubview(messageLabel)
        
        let alertButton = UIButton(frame: CGRect(x: 140, y: alertView.frame.height - 90, width: alertView.frame.width - 280, height: 40))
        alertButton.setTitle("TestMessage", for: .normal)
        alertButton.setBackgroundColor(color: .blue, forState: .normal)
        alertButton.addTarget(self, action: #selector(dismissAlert), for: .touchUpInside)
        alertView.addSubview(alertButton)
        
        
        UIView.animate(withDuration: 0.3, animations: {
            self.backgroundView.alpha = Constants.backgroundAlpha
        }, completion: { done in
            if done {
                UIView.animate(withDuration: 0.3, animations: {
                    self.alertView.center = targetView.center
                })
            }
        })
    }
    
    @objc func dismissAlert() {
        guard let targetView = dismissTargetView else { return }
        
        UIView.animate(withDuration: 0.3, animations: {
            
            self.alertView.frame = CGRect(x: 40, y: targetView.frame.height, width: targetView.frame.width - 80, height: 216)
            
          
        }, completion: { done in
            if done {
                UIView.animate(withDuration: 0.3, animations: {
                    self.backgroundView.alpha = 0
                    
                }, completion: { done in
                    if done {
                        self.alertView.removeFromSuperview()
                        self.backgroundView.removeFromSuperview()
                        self.alertImage.removeFromSuperview()
                    }
                })
            }
        })
    }
    
}
