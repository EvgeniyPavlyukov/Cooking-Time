//
//  InteractorInput.swift
//  Cooking time
//
//  Created by Eвгений Павлюков on 28.11.2022.
//

import Foundation

protocol InteractorInputProtocol: AnyObject { //это то что приходит в интерактор из презентера
    func didObtainForSignUp(login: String?, password: String?, confirmationPassword: String?)
    func didObtainForSignIn(login: String?, password: String?)
}
