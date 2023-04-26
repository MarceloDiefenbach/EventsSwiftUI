//
//  LoginAndAccountViewsViewModel.swift
//  Events
//
//  Created by Marcelo Diefenbach on 24/04/23.
//

import Foundation
import SwiftUI

class LoginAndAccountViewModel: ObservableObject {
    
    @Published var currentPage: WhatPage = .email
    @Published var password: String = "Lelo318318"
    @Published var email: String = "lelod15@gmail.com"
    @Published var username: String = ""
    @Published var loginAlertCase: LoginAlertCases = .emptyFields
    
    func verifyIfAccountExists(completion: @escaping (LoginAlertCases) -> Void) {
        
        if email == "" {
            completion(.emptyFields)
        } else if !email.isValidEmail {
            completion(.incorrectField)
        } else {
            FirebaseAccountService.shared.checkIfUserExists(email: email) { result in
                switch result {
                case .success(let userExists):
                    if userExists {
                        print("User exists")
                        completion(.userExists)
                    } else {
                        print("User does not exist")
                        completion(.success)
                    }
                case .failure(let error):
                    print(error)
                    completion(.error)
                }
            }
        }
    }
    
    func createAccount(completion: @escaping (LoginAlertCases) -> Void) {
        FirebaseAccountService.shared.createAccountWithEmail(email: self.email, password: self.password, username: self.username, completion: { result in
            if result == .success {
                completion(.success)
            } else if result == .error {
                completion(.error)
            } else if result == .usernameAlreadyInUse {
                completion(.usernameAlreadyInUse)
            } else if result == .emptyFields {
                completion(.emptyFields)
            }
        })
    }
    
    func signIn(completion: @escaping (LoginAlertCases) -> Void) {
        if password.count < 8 {
            completion(.emptyFields)
        } else {
            FirebaseAccountService.shared.signIn(email: email, password: password) { result, error in
                if let error = error {
                    print("Erro ao fazer login: \(error.localizedDescription)")
                    if error.localizedDescription.contains("invalid") {
                        completion(.error)
                    }
                } else if let user = result?.user {
                    print("Login bem-sucedido para o usuário: \(user.email ?? "")")
                    completion(.success)
                }
            }
        }
    }
    
}
