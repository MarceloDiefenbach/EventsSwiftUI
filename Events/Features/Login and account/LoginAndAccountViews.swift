//
//  EmailViewModel.swift
//  Events
//
//  Created by Marcelo Diefenbach on 23/04/23.
//

//
//  CreateAccountView.swift
//  Events
//
//  Created by Marcelo Diefenbach on 23/04/23.
//

import SwiftUI
import Combine

enum WhatPage {
    case email, login, create, success, home
}

struct LoginAndAccountViews: View {
    
    @StateObject var viewModel = LoginAndAccountViewModel()
    
    var body: some View {
        ZStack {
            
            if viewModel.currentPage == .email {
                EmailView()
                    .environmentObject(viewModel)
            } else if viewModel.currentPage == .login {
                PasswordView()
                    .environmentObject(viewModel)
            } else if viewModel.currentPage == .create {
                CreateAccountView()
                    .environmentObject(viewModel)
            } else if viewModel.currentPage == .success {
                InterestsView()
                    .environmentObject(viewModel)
            } else if viewModel.currentPage == .home {
                TabBarView()
            }
            
        }.onAppear(){
            FirebaseAccountService.shared.checkIfUserIsSignedIn { result in
                switch result {
                case .success(let isSignedIn):
                    if isSignedIn {
                        print("Usuário já fez login")
                        viewModel.currentPage = .home
                    } else {
                        print("Usuário ainda não fez login")
                        viewModel.currentPage = .email
                    }
                case .failure(let error):
                    print("Erro ao verificar se o usuário está logado: \(error.localizedDescription)")
                    viewModel.currentPage = .email
                }
            }
        }
    }
}


struct LoginAndAccountViews_Previews: PreviewProvider {
    static var previews: some View {
        LoginAndAccountViews()
    }
}
