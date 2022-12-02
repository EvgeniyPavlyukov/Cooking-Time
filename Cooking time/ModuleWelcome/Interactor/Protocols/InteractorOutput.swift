//
//  InteractorOutput.swift
//  Cooking time
//
//  Created by Eвгений Павлюков on 28.11.2022.
//

import Foundation

protocol InteractorOutputProtocol: AnyObject { // это то что выходит из интерактора в презентер?
    func signUpWith(login: String, password: String)
    func logInWith(login: String, password: String)
}
