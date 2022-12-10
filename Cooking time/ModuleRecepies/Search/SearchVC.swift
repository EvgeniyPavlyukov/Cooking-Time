//
//  SearchVC.swift
//  Cooking time
//
//  Created by Eвгений Павлюков on 10.12.2022.
//

import UIKit

class SearchVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        title = "Find your dish"
        self.view.backgroundColor = UIColor.white
        createSearchTextField()
//        createLeftBarButtonItem()
        
    }
    
    private func createSearchTextField() {
//        navigationItem.searchController?.searchBar.placeholder = "safasfaf"
        self.navigationItem.searchController = UISearchController()
    }
    
//    private func createLeftBarButtonItem() {
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(backToRecipies))
//    }

//    @objc func backToRecipies() {
//        let recepiesTabBar = TabBarMainVC()
//        recepiesTabBar.modalTransitionStyle = .crossDissolve
//        present(recepiesTabBar, animated: true)
//    }
//
}



