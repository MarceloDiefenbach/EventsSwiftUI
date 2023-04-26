//
//  Event.swift
//  Events
//
//  Created by Marcelo Diefenbach on 25/04/23.
//

import Foundation

class Event: Identifiable {
    var owner: String
    var description: String
    var ticketsLink: String
    var coverImage: String
    var participantsID: [String]
    var date: Date
    var title: String // novo atributo adicionado
    
    init(owner: String, description: String, ticketsLink: String, coverImage: String, participantsID: [String], date: Date, title: String) {
        self.owner = owner
        self.description = description
        self.ticketsLink = ticketsLink
        self.coverImage = coverImage
        self.participantsID = participantsID
        self.date = date
        self.title = title // inicialização do novo atributo
    }
}

