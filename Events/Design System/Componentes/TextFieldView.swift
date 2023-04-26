//
//  TextFieldView.swift
//  Events
//
//  Created by Marcelo Diefenbach on 23/04/23.
//

import Foundation
import SwiftUI

enum TextFieldType {
    case normal, email, password
}

struct TextFieldView: View {
    @Binding var text: String
    @State var placeholder: String
    @FocusState private var keyboardFocused: Bool
    @State var fieldType: TextFieldType = .normal
    
    var body: some View {
        if fieldType == .normal {
            TextField(placeholder, text: $text)
                .autocapitalization(.none)
                .disableAutocorrection(false)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.DesignSystem.primary, lineWidth: 2)
                )
                .cornerRadius(10)
                .focused($keyboardFocused)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        keyboardFocused = true
                    }
                }
        } else if fieldType == .password {
            SecureField(placeholder, text: $text)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .textContentType(.password)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.DesignSystem.primary, lineWidth: 2)
                )
                .cornerRadius(10)
                .focused($keyboardFocused)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        keyboardFocused = true
                    }
                }
        } else if fieldType == .email {
            TextField(placeholder, text: $text)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .keyboardType(.emailAddress)
                .textContentType(.emailAddress)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.DesignSystem.primary, lineWidth: 2)
                )
                .cornerRadius(10)
                .focused($keyboardFocused)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        keyboardFocused = true
                    }
                }
        }
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(text: .constant("texto"), placeholder: "Placeholder text")
    }
}
