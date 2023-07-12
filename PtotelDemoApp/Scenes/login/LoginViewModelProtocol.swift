//
//  LoginViewModelProtocol.swift
//  PtotelDemoApp
//
//  Created by Batuhan Atabek on 8.07.2023.
//

import Foundation

protocol LoginViewModelProtocol {
    func login(userName: String, password: String) -> Bool
}
