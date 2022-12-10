//
//  Router.swift
//  Cooking time
//
//  Created by Eвгений Павлюков on 01.12.2022.
//

import Foundation
import UIKit //чтобы показать алерт через роутер


class Router: LoginRouterInputProtocol, RegisterRouterInputProtocol, ViewInputProtocol {

  
    weak var view: UIViewController!
    weak var interactor: Interactor!
    var firebaseSignUp: FirebaseRegisterClass!
    var firebaseSignIn: FirebaseAuthClass!
    
    func showSignUpAccountAlert(login: String, password: String) {
        let alert = UIAlertController(title: "Create Account", message: "Would you like to create account?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Continue",
                                      style: .default,
                                      handler: { _ in self.firebaseSignUp.createNewUser(login: login, password: password)
        }))
        alert.addAction(UIAlertAction(title: "cancel",
                                      style: .cancel,
                                      handler: {_ in
        }))
        
        self.view?.present(alert, animated: true)
        
    }
    
    
    //MARK: - LoginRouterInputProtocol
    func showSignUpPage() {
        var signUPVC = RegistrationAssembler.registrationModuleAssembling()
        self.view?.present(signUPVC, animated: true)
    }
    
    func checkForLogin(login: String, password: String) {
        self.firebaseSignIn.logInUser(login: login, password: password)
    }
    
    func showRecepiesPageAfterAuth() {
        let recepiesModuleAssembler = RecipiesAssembler.createTabBar()
        recepiesModuleAssembler.modalPresentationStyle = .fullScreen
        recepiesModuleAssembler.modalTransitionStyle = .crossDissolve
        self.view.present(recepiesModuleAssembler, animated: true) {
            let loginVC = LoginAssembler.loginModuleAssembling()
            loginVC.dismiss(animated: false)
        }
    }
    
    
    //MARK: - RegisterRouterInputProtocol
    func popBackToLogin() {
        self.view?.dismiss(animated: true)
    }
    
    func showFailureLoginAlert(login: String, password: String) {
        
    }
}
