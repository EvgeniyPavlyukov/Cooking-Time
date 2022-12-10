//
//  RegisterPresenter.swift
//  Cooking time
//
//  Created by Eвгений Павлюков on 29.11.2022.
//

import Foundation
import UIKit


class RegisterPresenter: RegisterViewOutputProtocol, InteractorOutputProtocol, ViewOutputProtocol {
    
 
    weak var view: RegisterViewInputProtocol!
    var interactor: InteractorInputProtocol!
    var router: RegisterRouterInputProtocol!
    
    //MARK: - ViewOutputProtocol
    
    func obtain(login: String?, password: String?, passwordConfirmation: String?) {
        guard let loginChecked = login, !loginChecked.isEmpty else {
            print("Missing Email field data")
            return
        }
        
        guard let passwordChecked = password, !passwordChecked.isEmpty else {
            print("Missing password field data")
            return
        }
        
        guard let confirmationPasswordChecked = passwordConfirmation, !confirmationPasswordChecked.isEmpty else {
            print("Missing confirmation password field data")
            return
        }
        
        self.router.showSignUpAccountAlert(login: loginChecked, password: passwordChecked)
    }
    
    //MARK: - InteractorOutputProtocol

 
}
