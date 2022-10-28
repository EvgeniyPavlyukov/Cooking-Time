//
//  WelcomeSplashScreen.swift
//  Cooking time
//
//  Created by Eвгений Павлюков on 23.10.2022.
//

import UIKit

class WelcomeSplashScreen: UIViewController {
    
    private var welcomeLabel: UILabel!
    
    override func viewDidLoad() {
        
        view.backgroundColor = UIColor.white
        
       
        createLabel()
        animationLabel()
        changingView()
        
        
    }
    
    private func createLabel() {
        welcomeLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 50))
        welcomeLabel.center = self.view.center
        welcomeLabel.textAlignment = .natural
        welcomeLabel.numberOfLines = 0
        welcomeLabel.font = UIFont.boldSystemFont(ofSize: 40)
        welcomeLabel.highlightedTextColor = UIColor.gray
        welcomeLabel.textColor = UIColor(displayP3Red: 43/255, green: 199/255, blue: 200/255, alpha: 1)
        
        view.addSubview(welcomeLabel)
    }
    
    //MARK: - Animation for Lounch screen Label
    
    private func animationLabel() {
        welcomeLabel.text = ""
        var charIndex = 0.0
        let titleText = "🥨CookingTime"
        for letter in titleText {
            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { (timer) in
                self.welcomeLabel.text?.append(letter)
            }
            charIndex += 1
        }
    }
    
    //MARK: - Transition to logIn Screen
    
    private func changingView() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5, execute:  {
            let homeViewController = LoginVC()
            homeViewController.modalTransitionStyle = .crossDissolve
            homeViewController.modalPresentationStyle = .fullScreen
            self.present(homeViewController, animated: true)
        })
    }
}

    

    
    



