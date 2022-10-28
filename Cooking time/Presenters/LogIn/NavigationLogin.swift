//
//  NavigationLogin.swift
//  Cooking time
//
//  Created by Eвгений Павлюков on 25.10.2022.
//

import UIKit

class NavigationLogin: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        createTabBar()
    }
    
    
    
    //MARK: - TabBar
    
    func createTabBar() {
        
        let loginVC = createNavVC(vc: LoginVC())
        let registrationVC = createNavVC(vc: RegistrationVC())
        
        viewControllers = [loginVC, registrationVC]
    }

    //MARK: - NavigationBar
    
    func createNavVC(vc: UIViewController) -> UINavigationController {
        
        let navController = UINavigationController(rootViewController: vc)
        return navController
    }

}


