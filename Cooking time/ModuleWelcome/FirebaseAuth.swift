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

    func logInUser(login: String, password: String) {
        FirebaseAuth.Auth.auth().signIn(withEmail: login, password: password) {[weak self] /* If you have a closure inside a class that uses self, the closure will keep a strong reference to self as long as the closure lives in memory.*/ result, error in
            guard let strongSelf = self else { // убираем опциональность
                return
            }
            
            guard error == nil else {
                // show failed login
                print("No user was found")
                return
            }
            
            print("you have signed in")
        }
    }

    func createNewUser(login: String, password: String) {
        FirebaseAuth.Auth.auth().createUser(withEmail: login, password: password) {[weak self] result, error in
            guard let strongSelf = self else {
                return
            }
            
            guard error == nil else {
                // show account creation notific
                print("Account creation failed. Please use your Email")
                return
            }
            
            print("you have signed up")
        }
    }

}

