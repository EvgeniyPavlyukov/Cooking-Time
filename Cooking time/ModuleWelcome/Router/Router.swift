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
    var registerOutput: RegisterViewOutputProtocol!
    var loginOutput: LoginRouterOutputProtocol!
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
        
        view?.present(alert, animated: true)
        
    }
    
    
    //MARK: - LoginRouterInputProtocol
    func showSignUpPage() {
        weak var signUPVC = RegistrationAssembler.registrationModuleAssembling()
        view?.present(signUPVC!, animated: true)
    }
    
    func checkForLogin(login: String, password: String) {
        firebaseSignIn.logInUser(login: login, password: password)
    }
    
    func showRecepiesPageAfterAuth() {
//        let recepiesModuleAssembler =
//        view.present(recepiesModuleAssembler, animated: true, completion: nil)
    }
    
    
    //MARK: - RegisterRouterInputProtocol
    func popBackToLogin() {
        view?.dismiss(animated: true)
    }
    
    func showFailureLoginAlert(login: String, password: String) {
        
    }
}
