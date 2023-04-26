//
//  EmailView.swift
//  Events
//
//  Created by Marcelo Diefenbach on 23/04/23.
//

import Foundation
import SwiftUI

struct EmailView: View {
    
    @EnvironmentObject var viewModel: LoginAndAccountViewModel
    @State var showAlert: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            Text("Let's find more events?")
                .font(Font.DesignSystem.bigTitleBold)
                .multilineTextAlignment(.center)
                .foregroundColor(Color.DesignSystem.black)
                .padding(.bottom, 8)
            Text("If you already have an account we will do login, if not we will create an account for you")
                .font(Font.DesignSystem.normalRegular)
                .multilineTextAlignment(.center)
                .foregroundColor(Color.DesignSystem.gray)
                .padding(.bottom, 40)
                .padding(.horizontal, UIScreen.main.bounds.width*0.03)
            
            TextFieldView(text: self.$viewModel.email ,placeholder: "Type your email", fieldType: .email)
                .padding(.bottom, 8)
            EVButton(title: "Next", iconSFSymbols: "", style: .secondary, action: {
                viewModel.verifyIfAccountExists { result in
                    if result == .success {
                        viewModel.currentPage = .create
                    } else if result == .userExists {
                        viewModel.currentPage = .login
                    } else {
                        viewModel.loginAlertCase = result
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


struct EmailView_Previews: PreviewProvider {
    static var previews: some View {
        EmailView()
    }
}

