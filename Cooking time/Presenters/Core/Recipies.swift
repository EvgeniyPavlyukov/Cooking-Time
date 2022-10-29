//
//  Recepies.swift
//  Cooking time
//
//  Created by Eвгений Павлюков on 15.10.2022.
//

import UIKit
import SnapKit

class Recipies: UIViewController {
    
   
    var imageView: UIImageView!
    var label: UILabel!
    
    weak var collectionView: UICollectionView!
    
    var itemRecipiesArray: [MenuRecipies] = {
        var blankRecipi = MenuRecipies(name: "bitch")
        
        return [blankRecipi]
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        view.backgroundColor = UIColor.white
        self.title = "All Recipies"
        segmentedControl()
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
    
    func navigationSearch() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search,
                                                            target: self,
                                                            action: #selector(searchRecipies))
    }
    
    @objc func searchRecipies() {
        let searchVC = SearchVC()
        searchVC.modalTransitionStyle = .partialCurl
        searchVC.modalPresentationStyle = .pageSheet
        navigationController?.pushViewController(searchVC, animated: true)
        
        
        
        
        
        
//        let searchAlertController = UIAlertController(title: "Search and Cook",
//                                                      message: "Please type key phrase",
//                                                      preferredStyle: .alert)
//
//
//        let searchAlertAction = UIAlertAction(title: "Let's cook!", style: .default) { (action) in
//            let text = searchAlertController.textFields?.first
//
//        }
//
//        searchAlertController.addTextField { [weak self] (textField: UITextField!) in
//            textField.delegate = self //вызывает клавиатуру при появлении тексфилда в алерте
//        }
        
        
//        searchAlertController.addAction(searchAlertAction)
//        self.present(searchAlertController, animated: true, completion: nil)
    }
 
    //MARK: - Left Bar Button Item
    
    private func createLeftBarButtonItem() {
        let item = UIBarButtonItem(image: UIImage(systemName: "person.fill"), style: .plain, target: self, action: #selector(toAccountManager))
        
        self.navigationItem.leftBarButtonItem = item
    }
    
    @objc func toAccountManager() {
        let accountManagerVC = AccountManagerVC()
        present(accountManagerVC, animated: true)
        
       }
    
    
}

//MARK: - UItextfielddeligate

extension Recipies: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("keyBoard")
        return true
    }
    
}

