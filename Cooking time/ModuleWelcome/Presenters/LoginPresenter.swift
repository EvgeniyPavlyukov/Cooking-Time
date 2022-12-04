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
    
    //MARK: - InteractorOutputProtocol
    
    func presentSignUpPage() {
        router.showSignUpPage()
    }
    
    
    func signUpWith(login: String, password: String) {
        // no need
    }
    
    func logInWith(login: String, password: String) {
        router.checkForLogin(login: login, password: password)
    }
    
    //MARK: - ViewOutputProtocol
    
    func obtain(login: String?, password: String?, passwordConfirmation: String?) {
        interactor.didObtainForSignIn(login: login, password: password)
    }
    
    //MARK: - LoginViewOutputProtocol
    
    func showSignUpPage() {
        router.showSignUpPage()
    }
}
