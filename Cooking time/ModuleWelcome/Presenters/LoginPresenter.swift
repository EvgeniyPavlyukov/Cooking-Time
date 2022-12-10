//
//  WelcomePresenter.swift
//  Cooking time
//
//  Created by Eвгений Павлюков on 28.11.2022.
//

import Foundation

class LoginPresenter: LoginViewOutputProtocol, InteractorOutputProtocol, ViewOutputProtocol {

    //уходит в интерактор
    weak var view: LoginViewInputProtocol! //слабая ссылка на вью
    var interactor: InteractorInputProtocol! //связующее звено между всеми остальными
    var router: LoginRouterInputProtocol!
    
  
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
        
        self.router.checkForLogin(login: loginChecked, password: passwordChecked)
    }
    
    //MARK: - LoginViewOutputProtocol
    
    func pressedSignUpPage() {
        self.router.showSignUpPage()
    }
    
    func logInWith(login: String, password: String) {
        self.router.checkForLogin(login: login, password: password)
    }
    
}
