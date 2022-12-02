//
//  RegistrationVC.swift
//  Cooking time
//
//  Created by Eвгений Павлюков on 23.10.2022.
//

import UIKit

class RegistrationVC: UIViewController, RegisterViewInputProtocol {

    fileprivate var textFieldEmail: UITextField!
    fileprivate var textFieldPassword: UITextField!
    fileprivate var textFieldPasswordConfirmation: UITextField!
    fileprivate var registerButton: UIButton!
    
    var outputData: ViewOutputProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialization()
        hideKeyboardWhenTappedAround()
        createTextFieldEmail()
        createTextFieldPassword()
        createTextFieldPasswordConfirmation()
        createRegisterButton()
        createConstraints()
    }
    
    fileprivate func initialization() {
        view.backgroundColor = UIColor(displayP3Red: 43/255, green: 199/255, blue: 254/255, alpha: 1)
        self.navigationItem.title = "Create new account"
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
    
    fileprivate func createTextFieldPasswordConfirmation() {
        textFieldPasswordConfirmation = UITextField()
        textFieldPasswordConfirmation.keyboardType = .numberPad
        textFieldPasswordConfirmation.backgroundColor = UIColor.white
        textFieldPasswordConfirmation.layer.cornerRadius = 25
        textFieldPasswordConfirmation.attributedPlaceholder = NSAttributedString(
            string: "Confirm you password",
            attributes: [NSAttributedString.Key.foregroundColor : UIColor.black.withAlphaComponent(0.3)])
        textFieldPasswordConfirmation.textColor = .black
        textFieldPasswordConfirmation.isSecureTextEntry = true
        textFieldPasswordConfirmation.textAlignment = .center
        view.addSubview(textFieldPasswordConfirmation)
    }
    
    fileprivate func createRegisterButton() {
        registerButton = UIButton(type: .roundedRect)
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.setTitle("Register", for: .normal)
        registerButton.setTitleColor(.white, for: .normal)
        registerButton.addTarget(self, action: #selector(registerNewAccount), for: .touchUpInside)
        view.addSubview(registerButton)
    }
    
    //MARK: - ViewOutput
    
    @objc func registerNewAccount() { //this should be in interactor
        
        if textFieldPassword.text == textFieldPasswordConfirmation.text {
            guard let login = textFieldEmail.text, !login.isEmpty else {
                print("Missing Email field data")
                return
            }
            
            guard let password = textFieldPassword.text, !password.isEmpty else {
                print("Missing password field data")
                return
            }
            
            outputData.obtain(login: login, password: password)
        } else {
            print("your passwords doesn't match")
        }
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
        
        textFieldPasswordConfirmation.snp.makeConstraints { make in
            make.top.equalTo(textFieldPassword.snp_bottomMargin).offset(30)
            make.left.right.equalToSuperview().inset(40)
            make.bottom.equalTo(textFieldPassword.snp_bottomMargin).offset(100)
        }
        
        registerButton.snp.makeConstraints { make in
            make.top.equalTo(textFieldPasswordConfirmation.snp_bottomMargin).offset(40)
            make.left.right.equalToSuperview().inset(150)
            make.bottom.equalTo(textFieldPasswordConfirmation.snp_bottomMargin).offset(70)
        }
        
        
    }
}



//MARK: - UITextFieldDelegate

extension RegistrationVC: UITextFieldDelegate {
    
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
}
