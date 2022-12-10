//
//  FirebaseAuth.swift
//  Cooking time
//
//  Created by Eвгений Павлюков on 29.11.2022.
//

import Foundation
import FirebaseAuth
import Firebase


class FirebaseAuthClass {
    
    weak var router: LoginRouterInputProtocol!

    func logInUser(login: String, password: String) {
        FirebaseAuth.Auth.auth().signIn(withEmail: login, password: password) {[weak self] /* If you have a closure inside a class that uses self, the closure will keep a strong reference to self as long as the closure lives in memory.*/ result, error in
            guard let strongSelf = self else { // убираем опциональность
                return
            }
            
            guard error == nil else {
                // show failed login
                print(error?.localizedDescription)
                print("No user was found")
                return
            }
            
            print("you have signed in")
            self?.router.showRecepiesPageAfterAuth()
        }
    }
}

