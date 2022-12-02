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
    
    func obtain(login: String, password: String) {
        interactor.didObtainForSignIn(login: login, password: password)
        interactor.didObtainForSignUp(login: login, password: password)
    }
    
    //MARK: - InteractorOutputProtocol
    
    func signUpWith(login: String, password: String) {
        router.showSignUpAccountAlert(login: login, password: password)
    }
    
    func logInWith(login: String, password: String) {
        
    }
}
