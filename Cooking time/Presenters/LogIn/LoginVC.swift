//
//  LoginVC.swift
//  Cooking time
//
//  Created by Eвгений Павлюков on 23.10.2022.
//

import UIKit
import SnapKit


class LoginVC: UIViewController {
    
    fileprivate var textFieldEmail: UITextField!
    fileprivate var textFieldPassword: UITextField!
    fileprivate var loginButton: UIButton!
    fileprivate var registerButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialization()
        hideKeyboardWhenTappedAround()
        createTextFieldEmail()
        createTextFieldPassword()
        creatLoginButton()
        createRegisterButton()
        createConstraints()
       
        textFieldEmail.delegate = self
        textFieldPassword.delegate = self
    }
    
    fileprivate func initialization() {
        view.backgroundColor = UIColor(displayP3Red: 43/255, green: 199/255, blue: 254/255, alpha: 1)
        title = "Welcome 🧁"
    }
    
    fileprivate func createTextFieldEmail() {
        textFieldEmail = UITextField()
        textFieldEmail.backgroundColor = UIColor.white
        textFieldEmail.layer.cornerRadius = 25
        textFieldEmail.textColor = .black
        textFieldEmail.attributedPlaceholder = NSAttributedString(
                                                string: "@Email",
                                                attributes: [NSAttributedString.Key.foregroundColor : UIColor.black.withAlphaComponent(0.3)])
        textFieldEmail.textAlignment = .center
        view.addSubview(textFieldEmail)
    }
    
    fileprivate func createTextFieldPassword() {
        textFieldPassword = UITextField()
        textFieldPassword.keyboardType = .numberPad
        textFieldPassword.backgroundColor = UIColor.white
        textFieldPassword.layer.cornerRadius = 25
        textFieldPassword.attributedPlaceholder = NSAttributedString(
                                                string: "Password",
                                                attributes: [NSAttributedString.Key.foregroundColor : UIColor.black.withAlphaComponent(0.3)])
        textFieldPassword.textColor = .black
        textFieldPassword.isSecureTextEntry = true
        textFieldPassword.textAlignment = .center
        view.addSubview(textFieldPassword)
    }

    fileprivate func creatLoginButton() {
        loginButton = UIButton(type: .roundedRect)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.setTitle("Log In", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.addTarget(self, action: #selector(loginPush), for: .touchUpInside)
        view.addSubview(loginButton)
    }
    
    fileprivate func createRegisterButton() {
        registerButton = UIButton(type: .roundedRect)
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.setTitle("Register", for: .normal)
        registerButton.setTitleColor(.white, for: .normal)
        registerButton.addTarget(self, action: #selector(registerPush), for: .touchUpInside)
        view.addSubview(registerButton)
    }
    
    
//MARK: - Login Push VC
    
    @objc func loginPush() {
        let recepiesTabBar = TabBarMainVC()
        present(recepiesTabBar, animated: true)
        
    }
    
//MARK: - Register Push VC
    
    @objc func registerPush() {
        let registerVC = RegistrationVC()
        present(registerVC, animated: true)
        
    }

    //MARK: - Constraints SnapKit
    
    fileprivate func createConstraints() {
        textFieldEmail.snp.makeConstraints { make in
            make.top.equalTo(view.snp_topMargin).inset(50)
            make.leading.equalToSuperview().inset(40)
            make.trailing.equalToSuperview().inset(40)
            make.bottom.equalTo(view.snp_topMargin).inset(120) //width = 70
        }
        
        textFieldPassword.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(40)
            make.top.equalTo(textFieldEmail.snp_bottomMargin).offset(30)
            make.bottom.equalTo(textFieldEmail.snp_bottomMargin).offset(100) //width = 70
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(textFieldPassword.snp_bottomMargin).offset(70)
            make.left.right.equalToSuperview().inset(160)
            make.bottom.equalTo(textFieldPassword.snp_bottomMargin).offset(90)
        }
        
        registerButton.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp_bottomMargin).offset(20)
            make.left.right.equalToSuperview().inset(150)
            make.bottom.equalTo(loginButton.snp_bottomMargin).offset(50)
        }
        
            
        }
    
    
}


//MARK: - UITextFieldDelegate

extension LoginVC: UITextFieldDelegate {
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        textField.becomeFirstResponder()
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    
}

//MARK: - KeyBoard hiding with tap around

extension UIViewController {
    fileprivate func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
