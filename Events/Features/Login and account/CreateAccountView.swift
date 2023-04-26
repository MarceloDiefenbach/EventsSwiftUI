//
//  CreateAccountView.swift
//  Events
//
//  Created by Marcelo Diefenbach on 23/04/23.
//

import SwiftUI

struct CreateAccountView: View {
    
    @EnvironmentObject var viewModel: LoginAndAccountViewModel
    @State var showAlert: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            Text("Let's create your account")
                .font(Font.DesignSystem.bigTitleBold)
                .multilineTextAlignment(.center)
                .foregroundColor(Color.DesignSystem.black)
                .padding(.bottom, 40)
            
            TextFieldView(text: self.$viewModel.username,placeholder: "Choose an username", fieldType: .normal)
                .padding(.bottom, 8)
            TextFieldView(text: self.$viewModel.password,placeholder: "Type your password", fieldType: .password)
                .padding(.bottom, 8)
            EVButton(title: "Create account", iconSFSymbols: "", style: .secondary, action: {
                viewModel.createAccount { result in
                    if result == .success {
                        viewModel.currentPage = .success
                    } else if result == .error {
                        viewModel.loginAlertCase = .error
                        showAlert = true
                    } else if result == .usernameAlreadyInUse {
                        viewModel.loginAlertCase = .usernameAlreadyInUse
                        showAlert = true
                    } else if result == .emptyFields {
                        viewModel.loginAlertCase = .emptyFields
                        showAlert = true
                    }
                }
            })
                .padding(.bottom, 32)
        }
        .padding(.horizontal, 16)
        .alert(isPresented: $showAlert, content: {
            return Alert(title: Text(viewModel.loginAlertCase.title),
                            message: Text(viewModel.loginAlertCase.message),
                            dismissButton: .cancel(Text("OK")) {
                showAlert = false
            })
        })
    }
}


struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
    }
}

