//
//  LoginPresenter.swift
//  GitClientAnchor
//
//  Created by Ruslan Bagautdinov on 10.12.2021.
//  Copyright © 2021 Ruslan Bagautdinov. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseAuth
import FirebaseDatabase

protocol LoginDelegate {
    func showAlert(with message: String)
    func moveToTabBar()
}

class LoginPresenter: NSObject {

    var delegate: LoginDelegate?

    //MARK: - Registration accaunt in DB
    func regUser(login: String, email: String, password: String) {

        if (!login.isEmpty && !email.isEmpty && !password.isEmpty) {
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if error == nil {
                    if let result = result {

                        let db = Firestore.firestore()
                        db.collection("users").addDocument(data: [
                            "login" : login,
                            "email" : email,
                            "uid" : result.user.uid
                        ]) { error in
                            guard let error = error else { return }
                            
                            if let errorCode = AuthErrorCode(rawValue: error._code) {
                                self.delegate?.showAlert(with: errorCode.errorMessage)
                            }
                        }
                        self.delegate?.moveToTabBar()
                    }
                }
            }
        } else  {
            self.delegate?.showAlert(with: "Пожалуйста заполните все поля!")
        }
    }
    
    //MARK: - Authontication
    func authUser(email: String, password: String) {

        if (!email.isEmpty && !password.isEmpty) {
            Auth.auth().signIn(withEmail: email, password: password) { result, error in
                guard let error = error else { return }
                
                if let errorCode = AuthErrorCode(rawValue: error._code) {
                    self.delegate?.showAlert(with: errorCode.errorMessage)
                }
                self.delegate?.moveToTabBar()
            }
        } else {
            self.delegate?.showAlert(with: "Пожалуйста заполните все поля!")
        }
    }
}

//MARK: - Alert errors text
extension AuthErrorCode {
    var errorMessage: String {
        switch self {
            case .emailAlreadyInUse:
                return "email уже используется!"
            case .weakPassword:
                return "Ваш пароль считается слишком слабым!"
            case .invalidEmail:
                return "Не верный формат email!"
            case .wrongPassword:
                return "Не верный пароль!"
            case .userNotFound:
                return "Учетная запись не найдена!"
            case .userDisabled:
                return "Учётная запись отключена"
            case .invalidUserToken:
                return "Сохранённые данные пользователя не действительны"
            case .networkError:
                return "Network error"
            default:
                return "Other error!"
        }
    }
}
