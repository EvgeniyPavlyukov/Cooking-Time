//
//  LoginRouterInput.swift
//  Cooking time
//
//  Created by Eвгений Павлюков on 01.12.2022.
//

import Foundation

protocol LoginRouterInputProtocol: AnyObject {
    func showRecipiesModule(login: String, password: String)
    func showSignUpPage()
}
