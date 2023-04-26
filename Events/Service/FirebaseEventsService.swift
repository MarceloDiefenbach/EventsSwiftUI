//
//  FirebaseEventsService.swift
//  Events
//
//  Created by Marcelo Diefenbach on 25/04/23.
//

import Foundation
import Firebase

class FirebaseEventsService {
    
    // Cria uma instância singleton da classe FirestoreService
    static let shared = FirebaseEventsService()
    
    private let db = Firestore.firestore()
    
    func fetchEvents(completion: @escaping ([Event]?, Error?) -> Void) {
        let db = Firestore.firestore()
        let eventsCollection = db.collection("events")
        
        eventsCollection.getDocuments { (snapshot, error) in
            if let error = error {
                completion(nil, error)
                return
            }
            
            var events = [Event]()
            
            for document in snapshot!.documents {
                let data = document.data()
                let owner = data["owner"] as! String
                let description = data["description"] as! String
                let ticketsLink = data["ticketsLink"] as! String
                let coverImage = data["coverImage"] as! String
                let participantsID = data["participantsID"] as! [String]
                let date = data["date"] as! Timestamp
                let title = data["title"] as! String // novo atributo adicionado
                
                let event = Event(owner: owner, description: description, ticketsLink: ticketsLink, coverImage: coverImage, participantsID: participantsID, date: date.dateValue(), title: title)
                events.append(event)
            }
            
            completion(events, nil)
        }
    }
    
}
