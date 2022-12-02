//
//  Interactor.swift
//  Cooking time
//
//  Created by Eвгений Павлюков on 28.11.2022.
//

import Foundation

class Interactor: InteractorInputProtocol {
  
    var output: InteractorOutputProtocol! //это слабая ссылка на презентер так как презентер держит сильную на интерактор
    
    func didObtainForSignUp(login: String, password: String) {
        let name = login
        let pas = password
        output.signUpWith(login: name, password: pas)
    }
    
    func didObtainForSignIn(login: String, password: String) {
        output.logInWith(login: login, password: password)
    }

}
