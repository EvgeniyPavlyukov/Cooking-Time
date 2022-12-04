//
//  LoginAssembler.swift
//  Cooking time
//
//  Created by Eвгений Павлюков on 01.12.2022.
//

import Foundation
import UIKit


class LoginAssembler {
    
    class func loginModuleAssembling() -> UIViewController {
        let view = LoginVC()
        
        let presenter = LoginPresenter()
        let interactor = Interactor()
        let router = Router()
        let firebaseAuth = FirebaseAuthClass()
        let firebaseRegister = FirebaseRegisterClass()
        
        
        view.outputData = presenter
        view.outputAction = presenter
        presenter.view = view 
        presenter.interactor = interactor
        presenter.router = router
        router.interactor = interactor
        router.firebaseSignUp = firebaseRegister
        router.firebaseSignIn = firebaseAuth
        router.view = view
        interactor.output = presenter
        
        
        return view
    }
}

class RegistrationAssembler {
    
    class func registrationModuleAssembling() -> UIViewController {
        let view = RegistrationVC()
        
        let presenter = RegisterPresenter()
        let interactor = Interactor()
        let router = Router()
        let firebaseRegister = FirebaseRegisterClass()
        
        view.outputData = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        router.interactor = interactor
        router.firebaseSignUp = firebaseRegister
        router.view = view
        interactor.output = presenter
        firebaseRegister.router = router
        
        return view
    }
    
}
