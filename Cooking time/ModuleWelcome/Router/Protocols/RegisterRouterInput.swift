//
//  RouterInput.swift
//  Cooking time
//
//  Created by Eвгений Павлюков on 28.11.2022.
//

import Foundation
import UIKit

protocol RegisterRouterInputProtocol: AnyObject { 
    func showSignUpAccountAlert(login: String, password: String)
    func popBackToLogin()
}
