//
//  FirebaseService.swift
//  Events
//
//  Created by Marcelo Diefenbach on 24/04/23.
//

import Foundation
import Firebase
import FirebaseFirestore

class FirebaseAccountService {
    
    // Cria uma instância singleton da classe FirestoreService
    static let shared = FirebaseAccountService()
    
    private let db = Firestore.firestore()
    
    func checkIfUserExists(email: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        let db = Firestore.firestore()
        let query = db.collection("users").whereField("email", isEqualTo: email)
        
        query.getDocuments { (querySnapshot, error) in
            if let error = error {
                completion(.failure(error))
            } else if let querySnapshot = querySnapshot {
                let count = querySnapshot.documents.count
                completion(.success(count > 0))
            }
        }
    }
    
    func createAccountWithEmail(email: String, password: String, username: String, completion: @escaping (LoginAlertCases) -> Void) {
        let db = Firestore.firestore()
        let userQuery = db.collection("users").whereField("username", isEqualTo: username)
        
        userQuery.getDocuments { (querySnapshot, error) in
            if let error = error {
                completion(.error)
            } else if let querySnapshot = querySnapshot {
                if querySnapshot.documents.count > 0 {
                    completion(.usernameAlreadyInUse)
                } else {
                    Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
                        if let error = error {
                            completion(.error)
                        } else if let authResult = authResult {
                            let email = authResult.user.email ?? ""
                            
                            let user = [
                                "email": email,
                                "username": username
                            ]
                            
                            db.collection("users").document(email).setData(user) { error in
                                if let error = error {
                                    completion(.error)
                                } else {
                                    completion(.success)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    func signIn(email: String, password: String, completion: @escaping (AuthDataResult?, Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password, completion: completion)
    }
    
    func checkIfUserIsSignedIn(completion: @escaping (Result<Bool, Error>) -> Void) {
        let currentUser = Auth.auth().currentUser
        
        if currentUser != nil {
            completion(.success(true))
        } else {
            completion(.success(false))
        }
    }
    
}
