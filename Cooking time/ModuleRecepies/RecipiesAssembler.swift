//
//  RecepiesTabBarVCViewController.swift
//  Cooking time
//
//  Created by Eвгений Павлюков on 04.12.2022.
//

import UIKit

class RecipiesAssembler {

    class func createTabBar() -> UITabBarController {
        let tabBarVC = UITabBarController()
        let allRecipies = createNavVC(vc: RecipiesVC(), imageName: "list.bullet.rectangle.portrait.fill", itemName: "All recipies")
        let favoriteRecipies = createNavVC(vc: FavoritesVC(), imageName: "star.fill", itemName: "Favorite")
        
        tabBarVC.viewControllers = [allRecipies, favoriteRecipies]
        
        func createNavVC(vc: UIViewController, imageName: String, itemName: String) -> UINavigationController {
            let item = UITabBarItem(title: itemName, image: UIImage(systemName: imageName), tag: 0)
            UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.black]
            
            let navController = UINavigationController(rootViewController: vc)
            navController.tabBarItem = item
            
            return navController
        }
        
        return tabBarVC
    }
}
