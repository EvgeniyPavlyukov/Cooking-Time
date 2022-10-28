//
//  ViewController.swift
//  Cooking time
//
//  Created by Eвгений Павлюков on 15.10.2022.
//

import UIKit

class TabBarMainVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTabBar()
        initialization()
    }
    
    //MARK: - Init
    
    private func initialization() {
        self.modalTransitionStyle = .crossDissolve
        self.modalPresentationStyle = .fullScreen
        
    }
    
    //MARK: - TabBar
    
    func createTabBar() {
        
        let allRecipies = createNavVC(vc: Recipies(), imageName: "list.bullet.rectangle.portrait.fill", itemName: "All recipies")
        let favoriteRecipies = createNavVC(vc: Favorites(), imageName: "star.fill", itemName: "Favorite")
        
        self.viewControllers = [allRecipies, favoriteRecipies]
    }

    //MARK: - NavigationBar
    
    func createNavVC(vc: UIViewController, imageName: String, itemName: String) -> UINavigationController {
        let item = UITabBarItem(title: itemName, image: UIImage(systemName: imageName), tag: 0)
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.black]
        
        
        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem = item
       
        viewControllers = [SearchVC()]
        
        return navController
    }

}


