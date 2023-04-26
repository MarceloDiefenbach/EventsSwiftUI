//
//  LoginAlertCases.swift
//  Events
//
//  Created by Marcelo Diefenbach on 24/04/23.
//

import Foundation
import SwiftUI

enum LoginAlertCases {
    //MARK: Login
    case emptyFields
    case usernameAlreadyInUse
    case error
    case success
    case userExists
    case incorrectField
    
    var title: String {
        switch self {
        case .emptyFields:
            return "Empty fields"
        case .usernameAlreadyInUse:
            return "Username already in use"
        case .error:
            return "Connection error"
        case .success:
            return "Success"
        case .userExists:
            return "Email already in use"
        case .incorrectField:
            return "Incorrect fields"
        }
    }
    var message: String {
        switch self {
        case .emptyFields:
            return "You need to fill all fields"
        case .usernameAlreadyInUse:
            return "Choose another username and try again."
        case .error:
            return "Try again later"
        case .success:
            return "Success"
        case .userExists:
            return "UserExists"
        case .incorrectField:
            return "Verify and try again"
        }
    }
}
