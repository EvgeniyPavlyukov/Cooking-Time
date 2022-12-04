//
//  WelcomeViewInput.swift
//  Cooking time
//
//  Created by Eвгений Павлюков on 28.11.2022.
//

import Foundation

protocol ViewOutputProtocol: AnyObject { // то что приходит на вью
    func obtain(login : String?, password : String?, passwordConfirmation : String?)
}
