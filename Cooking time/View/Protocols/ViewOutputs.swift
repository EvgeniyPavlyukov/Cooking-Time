//
//  WelcomeViewInput.swift
//  Cooking time
//
//  Created by Eвгений Павлюков on 28.11.2022.
//

import Foundation

protocol ViewOutputProtocol: AnyObject { // любая дата выходящая с обоих VC
    func obtain(login : String?, password : String?, passwordConfirmation : String?)
}
