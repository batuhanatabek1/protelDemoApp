//
//  LoginViewModel.swift
//  PtotelDemoApp
//
//  Created by Batuhan Atabek on 8.07.2023.
//

import Foundation

class LoginViewModel: LoginViewModelProtocol {
    
    func login(userName: String, password: String) -> Bool {
        let validUserNames = Constants.LoginData.validUserNames
        let validPasswords = Constants.LoginData.validPasswords
        guard validUserNames.contains(userName) && validPasswords.contains(password) else {
            return false
        }
        return true
    }
}
