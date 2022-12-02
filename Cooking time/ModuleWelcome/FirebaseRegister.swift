//
//  FirebaseRegister.swift
//  Cooking time
//
//  Created by Eвгений Павлюков on 01.12.2022.
//

import Foundation
import FirebaseAuth
import Firebase

/* scope of work:
 1) Make notification about email text field required format in case of an error
 2) Make notification about minimum 6 charachters password
 */

class FirebaseRegisterClass {
    
    var router: RegisterRouterInputProtocol!
    
    func createNewUser(login: String, password: String) {
        FirebaseAuth.Auth.auth().createUser(withEmail: login, password: password) {[weak self] result, error in
            guard let strongSelf = self else {
                return
            }
            
            guard error == nil else {
                let shortPass = "\(error!.localizedDescription)"
                let shortPassDescription = "The password must be 6 characters long or more."
                switch error?.localizedDescription {
                case let shortPass where shortPass == shortPassDescription: print("password is too short")
                default: print("Account creation failed. Please use your Email")
                }
                return
            }
            
            print("you have signed up successfuly")
            self?.router.popBackToLogin()
        }
    }

}

