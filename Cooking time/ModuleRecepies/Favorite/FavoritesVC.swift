//
//  FavoritesVCViewController.swift
//  Cooking time
//
//  Created by Eвгений Павлюков on 04.12.2022.
//

import UIKit

class FavoritesVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
        navigationItem.title = "Best recipies"
//        segmentedControl()
        navigationSearch()
        createLeftBarButtonItem()
        
    }
    
    //MARK: - Segmented Controll Vegetian
    
    func segmentedControl() {
        var optionSegmentedControl = UISegmentedControl()
        let itemSegments = ["vegan", "regular"]
        optionSegmentedControl = UISegmentedControl(items: itemSegments as [Any])
        optionSegmentedControl.isSelected = true
        self.view.addSubview(optionSegmentedControl)
        
        optionSegmentedControl.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(60)
            make.centerY.equalTo(view.snp_bottomMargin).inset(50)
        }
        
        optionSegmentedControl.addTarget(self, action: #selector(dietChange(target:)), for: .valueChanged)
        
        }
    
    @objc func dietChange(target: UISegmentedControl) {
        print(target.titleForSegment(at: target.selectedSegmentIndex) ?? "nil")
    }
    
    //MARK: - Navigation search button
    
    private func navigationSearch() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search,
                                                            target: self,
                                                            action: #selector(searchRecipies))
    }
    
    @objc func searchRecipies() {
        let searchVC = SearchVC()
        searchVC.modalTransitionStyle = .partialCurl
        searchVC.modalPresentationStyle = .pageSheet
        navigationController?.pushViewController(searchVC, animated: true)
    }
    
    private func createLeftBarButtonItem() {
        let item = UIBarButtonItem(image: UIImage(systemName: "person.fill"), style: .plain, target: self, action: #selector(toAccountManager))
        
        self.navigationItem.leftBarButtonItem = item
    }
    
    @objc func toAccountManager() {

    }
    
}
    

//MARK: - UItext field deligate

extension FavoritesVC: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("keyBoard")
        return true
    }
    
    
}

