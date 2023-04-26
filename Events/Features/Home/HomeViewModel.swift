//
//  HomeViewModel.swift
//  Events
//
//  Created by Marcelo Diefenbach on 25/04/23.
//

import SwiftUI
import Firebase

class HomeViewModel: ObservableObject {
    
    @Published var events: [Event] = []

    func createEvent(event: Event, completion: @escaping (Error?) -> Void) {
        let db = Firestore.firestore()
        let eventsCollection = db.collection("events")
        
        let data: [String: Any] = [
            "owner": event.owner,
            "description": event.description,
            "ticketsLink": event.ticketsLink,
            "coverImage": event.coverImage,
            "participantsID": event.participantsID,
            "date": Timestamp(date: event.date)
        ]
        
        eventsCollection.addDocument(data: data) { (error) in
            if let error = error {
                completion(error)
                return
            }
            completion(nil)
        }
    }
    
    func getEvents(completion: @escaping (Bool) -> Void) {
        FirebaseEventsService.shared.fetchEvents { (events, error) in
            if let error = error {
                // tratamento do erro
                print("Ocorreu um erro ao buscar os eventos: \(error.localizedDescription)")
                return
            }
            print(self.events)
            self.events = events!
            print(self.events)
            completion(true)
        }
    }
}
