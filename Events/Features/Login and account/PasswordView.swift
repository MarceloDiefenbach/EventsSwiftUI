//
//  PasswordView.swift
//  Events
//
//  Created by Marcelo Diefenbach on 23/04/23.
//

import Foundation
import SwiftUI

struct PasswordView: View {
    
    @EnvironmentObject var viewModel: LoginAndAccountViewModel
    @State var showAlert: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            Text("We find your account")
                .font(Font.DesignSystem.bigTitleBold)
                .multilineTextAlignment(.center)
                .foregroundColor(Color.DesignSystem.black)
                .padding(.bottom, 40)
            
            TextFieldView(text: $viewModel.password ,placeholder: "Type your password", fieldType: .password)
                .padding(.bottom, 8)
            EVButton(title: "Login", iconSFSymbols: "", style: .secondary, action: {
                viewModel.signIn(completion: {result in
                    if result == .success {
                        viewModel.currentPage = .success
                    } else {
                        viewModel.loginAlertCase = result
                        showAlert = true
                    }
                })
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

struct PasswordView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordView()
    }
}

