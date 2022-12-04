//
//  Interactor.swift
//  Cooking time
//
//  Created by Eвгений Павлюков on 28.11.2022.
//

import Foundation

class Interactor: InteractorInputProtocol {
    
    var output: InteractorOutputProtocol! //это слабая ссылка на презентер так как презентер держит сильную на интерактор
    
    func didObtainForSignUp(login: String?, password: String?, confirmationPassword: String?) {
        guard let loginChecked = login, !loginChecked.isEmpty else {
            print("Missing Email field data")
            return
        }
        
        guard let passwordChecked = password, !passwordChecked.isEmpty else {
            print("Missing password field data")
            return
        }
        
        guard let confirmationPasswordChecked = confirmationPassword, !confirmationPasswordChecked.isEmpty else {
            print("Missing confirmation password field data")
            return
        }
        
        output.signUpWith(login: loginChecked, password: passwordChecked)
    }
    
    func didObtainForSignIn(login: String?, password: String?) {
        guard let loginChecked = login, !loginChecked.isEmpty else {
            print("Missing Email field data")
            return
        }
        
        guard let passwordChecked = password, !passwordChecked.isEmpty else {
            print("Missing password field data")
            return
        }
        
        output.logInWith(login: loginChecked, password: passwordChecked)
    }
}
